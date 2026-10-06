/*-------------------------------------------
  L1211 12槽充电器 - 充电管理模块
-------------------------------------------*/
#include "config.h"

/* --- 本地常量(不依赖config.h的微调参数) --- */
#define DETECT_STABLE_TICKS      20    /* 高压稳定确认tick数: 20tick=200ms无显著下跌→真锂电 */
#define DIODE_CLAMP_MARGIN       150   /* DIODE_TEST钳位判据: 相对脉冲前电压的最大允许爬升(ADC).
                                          超过说明电容未被电池/体二极管钳位→干电池高内阻特征 */
#define CC_RETRY_FLAG            0x80  /* g_ccBlocks bit7 复用为LINEAR_LI CC超时循环标记:
                                          0=首次超时回DETECT重判, 1=再次超时直接ERROR锁死,
                                          避免碳性误判LINEAR_LI后循环重判. 标志置位后
                                          imp_linear_li拒绝再次放行(直接DRY锁死),
                                          进CV/新CC周期/电池拔出时清零. */
#define CC_LINEAR_LI_TICKS       1600  /* LINEAR_LI在CC的最长停留(16s, 10ms/tick换算).
                                          超过仍未进CV→回DETECT重判/ERROR锁死. */

/*========================================================================
  全局变量
========================================================================*/
unsigned int g_temperature = 250;
unsigned char g_tempProtect = 0;
unsigned char g_vccProtect  = 0;         /* VCC低压保护标志: 1=VCC过低, 关闭充电 */
unsigned int g_slotRefV[BATTERY_SLOTS];  /* 槽位参考电压: DETECT存初始值/稳定基准, CC/CV存峰值 */
unsigned char g_ccBlocks[12];           /* CC阶段10分钟块计数(解决16bit chargeTimer溢出);
                                           bit7复用为CC_RETRY_FLAG(见其定义) */
unsigned char g_ovCnt[12];              /* 过压消抖计数器: 连续过压次数 */
unsigned char g_detectLowCnt[12];       /* 通用消抖计数器(短路消抖/AMBIGUOUS消抖/LI_ION消抖) */
unsigned char g_detectOwner = 0xFF;     /* 检测链令牌: 0xFF=空闲, 其他=持有令牌的槽号.
                                           只有持令牌槽可执行 DETECT→IMP_CHECK→DIODE_TEST
                                           全链; 其余IDLE槽在入链前等待令牌, 保证同一时间
                                           只有一槽在跑检测链, 避免多槽共轨检测相互串扰
                                           (采样节点/VCC归一化基准被其他槽充电电流污染).
                                           令牌由进入检测链时申请, 离开检测链时释放. */
unsigned char g_detectWaiter = 0xFF;     /* 检测链等待者: 0xFF=无, 其他=有槽在检测链被冻结等待令牌.
                                           冻结槽登记后, IDLE空槽不再抢令牌, 保证等待者下次可
                                           优先获令牌, 避免令牌在连续空槽间单向传递导致先入链的
                                           重判槽(CC超时回DETECT)长期饥饿. */
unsigned char g_stableCnt[12];           /* DETECT高压稳定循环专用计数器 */
unsigned int g_capFlag;                  /* 电容虚高标记位掩码: bit[i]=1表示槽i需扩展等待电容放电 */
unsigned int g_impData;                  /* IMP_CHECK共享数据: 低12位脉冲前电压+高4位VCC编码(100mV步进)
                                           因检测链令牌独占, 同一时间仅一个槽使用 */
unsigned char g_diodeTrace[4];         /* DIODE_TEST slot_v轨迹: 4点(charge_ticks=7,14,21,28),
                                         每点1字节存相对pre偏移/4+128(±127*4 ADC, clamp),
                                         单槽共享缓冲(检测链令牌保证同时仅一槽在DIODE_TEST),
                                         仅ISR写数组供主循环打印, 不阻塞UART */
unsigned char g_diodeTraceCnt;         /* DIODE_TEST slot_v轨迹采样点数, 主循环打印后清零 */
unsigned char g_diodeTraceSlot;        /* 轨迹归属槽号(打印时匹配) */
unsigned int g_highVFlag;                /* DETECT高压确认标记: bit[i]=1表示槽i在高压稳定循环中
                                           连续≥DETECT_STABLE_TICKS维持V>2900, 用于IMP_CHECK
                                           区分恒压锂电池charger IC断开(false low)和真干电池 */

/*========================================================================
  (V58H) 多语义数组的语义别名: 零字节, 仅源码改名, 不新增任何存储.
  g_ccBlocks / g_stableCnt 在不同状态下承担不同角色, 直接读原数组名会误导
  (例如 "ccBlocks" 出现在CV代码里其实表示"CV起点锁/崩溃计数"). 下列别名把
  "当前语义"直接写在代码上, 底层仍是同一个字节.
  ⚠ 同一数组的多个别名共享存储, 同一状态下混用会互相破坏;
    每个别名仅在其注释标注的状态内有效, 跨状态误用是历史误判的来源之一.
========================================================================*/
/* ---- g_ccBlocks[12]: 一个字节承载4种角色 ---- */
#define CC_BLK_CNT(i)    ((g_ccBlocks[i]) & 0x7FU)          /* [CC] 10分钟块计数(屏蔽bit7重试锁) */
#define CC_BLK_INC(i)    (g_ccBlocks[i]++)                  /* [CC] 块计数+1(整字节自增, 与改前同) */
#define CC_BLK_ZERO(i)   (g_ccBlocks[i] &= CC_RETRY_FLAG)   /* [CC] 只清块计数, 保留重试锁 */
#define CC_RETRY_TST(i)  ((g_ccBlocks[i]) & CC_RETRY_FLAG)  /* [CC] 重试锁是否已置位 */
#define CC_RETRY_SET(i)  (g_ccBlocks[i] |= CC_RETRY_FLAG)   /* [CC] 置重试锁 */
#define CV_BASE_LOCK(i)  (g_ccBlocks[i])                    /* [CV] 0=未锁, 置1=已锁上爬检测起点 */
#define CV_CRASH_CNT(i)  (g_ccBlocks[i])                    /* [CV] 崩溃回DETECT次数
                                                               (与CV_BASE_LOCK同字节: 置锁的1会被计入,
                                                                故1次崩溃即达CV_DROP_LOOP_MAX=2) */
/* ---- g_stableCnt[12]: 一个字节承载3种角色 ---- */
#define DET_STABLE_CNT(i) (g_stableCnt[i])                  /* [DETECT] 高压区间稳定tick计数 */
#define CC_PROGRESS(i)    (g_stableCnt[i])                  /* [CC] 有充电进展闩锁(0/1) */
#define CV_CLIMB_CNT(i)   (g_stableCnt[i])                  /* [CV] 上爬消抖计数 */


/*========================================================================
  函数: Get_Vcc
  功能: 采样VREF(内部1.2V参考)反推实时VCC(mV), 写回g_vcc_mv并返回
========================================================================*/
unsigned int Get_Vcc(void)
{
	if(ADC_OK == ADC_Sample(ADC_CH_VREF, 0))
	{
		unsigned long pt = POWER_RATIO / adresult;
		g_vcc_mv = (unsigned int)pt;
	}
	return g_vcc_mv;
}

/*========================================================================
  函数: Adc_Norm
  功能: 采样指定ADC通道并归一化到 VCC_REF_MV(5000mV) 基准
  说明: ADC参考为VDD(比例式), 同一物理电压在不同VCC下原始ADC不同.
        归一化后 raw*vcc/5000 使同一电池在不同槽位/不同电源下读数一致,
        可直接套用 VCC≈5000 标定的全部阈值.
========================================================================*/
unsigned int Adc_Norm(unsigned char ch)
{
	unsigned int raw;
	if(ADC_OK != ADC_Sample(ch, 0))
		return 0;
	raw = adresult;
	if(g_vcc_mv == 0)
		return raw;                     /* 防除0 */
	return (unsigned int)(((unsigned long)raw * (unsigned long)g_vcc_mv) / VCC_REF_MV);
}

unsigned int Read_Temperature(void)
{
	unsigned int ntcVal;
	unsigned int temp_x10;

	test_adc = ADC_Sample(ADC_CH_NTC, 0);
	if(ADC_OK != test_adc)
		return g_temperature;

	ntcVal = adresult;
	if(ntcVal < 100 || ntcVal > 3996)
		return g_temperature;

	{
		unsigned long rt;
		rt = (unsigned long)ntcVal * 10000UL / (4096UL - ntcVal);
		if(rt >= 10000UL)
			temp_x10 = 250U - (unsigned int)((rt - 10000UL) * 10UL / 445UL);
		else
			temp_x10 = 250U + (unsigned int)((10000UL - rt) * 10UL / 445UL);
		if(temp_x10 < 100U) temp_x10 = 100U;
		if(temp_x10 > 750U) temp_x10 = 750U;
	}

	g_temperature = temp_x10;
	if((temp_x10 / 10U) >= TEMP_STOP)
		g_tempProtect = 1;
	else if((temp_x10 / 10U) <= TEMP_RESUME)
		g_tempProtect = 0;

	return temp_x10;
}

unsigned char Detect_BatteryType(unsigned int voltage)
{
	if(voltage >= ADC_V_OPEN)
		return BAT_TYPE_UNKNOWN;
	if(voltage < ADC_V_SHORT)
		return BAT_TYPE_UNKNOWN;

#if NIMH_DETECT_ENABLE
	/* AMBIGUOUS区间[NIMH_LOW, OPEN): 覆盖低/中/高压电池, 全部进入IMP_CHECK
	   用VCC跌落脉冲+体二极管爬升区分:
	   - VCC跌>300mV → NiMH(极低内阻拉垮VCC)
	   - VCC跌>200mV → LI_ION(charger IC拉载)
	   - 电池自身跌>1000ADC → DRY(碳性/碱性高内阻)
	   - 脉冲前>NEAR_OPEN且VCC不塌 → DRY(高压碳性/碱性)
	   - 脉冲前>2300(≤NEAR_OPEN) → LINEAR_LI(中压锂电兜底)
	   - 脉冲后电压≥OPEN → LINEAR_LI(体二极管阻断)
	   - DIODE_TEST爬升>DIODE_RISE_THRESH → LINEAR_LI(无charger IC)
	   - 否则DIODE_TEST超时 → DRY(干电池拒充)
	   高位碳性/碱性若漏入CC, PEAK_DROP会在数秒内纠正 */
	if(voltage >= ADC_V_NIMH_LOW && voltage < ADC_V_OPEN)
		return BAT_TYPE_AMBIGUOUS;
#endif

	/* AMBIGUOUS区间以外: SHORT~NIMH_LOW(低压/过放锂) → LI_ION
	   或 OPEN以上 → UNKNOWN(已达L69返回) */
	if(voltage >= ADC_V_SHORT && voltage < ADC_V_OPEN)
		return BAT_TYPE_LI_ION;

	return BAT_TYPE_UNKNOWN;
}

BatterySlot_t g_slot[12];   /* 不由ISR访问(采样/检测/充电均在主循环内同步完成), 故不用volatile:
                               加volatile会被迫每次访问都重新从内存读取, 无法用寄存器缓存 */

/* 槽位工作副本: 直接寻址(非索引), 供 Slot_Charge_Ctrl 及其拆出的各状态子函数
   零代价共享本轮槽位工作状态(state/type/voltage/chargeTimer).
   说明: XC8为非重入编译栈模型, 原先的 state/type/slot_v/charge_ticks 四个局部量
   本身就是静态分配(cstack psect), 改为文件级静态结构体后RAM占用等价; 但拆出的
   子函数可直接读写其字段, 不必用参数与返回值搬运"4个输入与3个输出".
   逐槽同步: Slot_Charge_Ctrl 入口 s_work = g_slot[idx]; 出口 g_slot[idx] = s_work; */
static BatterySlot_t s_work;

/* (V58F) SLOT_RD_ALL / SLOT_WR_ALL 读写辅助宏已删除:
   由 s_work 工作副本 + 结构体整体赋值取代(见下方 s_work 说明).
   原写法要求每个提前return前都必须回写, 漏一处即丢失本轮状态与计时;
   现在入口取一次/出口存一次, 中间所有状态变化都在 s_work 上. */

/*========================================================================
  函数: Route_DetectLi
  功能: 锂电池DETECT完成后统一充电路由: 按归一化ADC电压档位返回应进入的
        下一个状态, 并复位该槽的消抖计数器.
  参数: idx    - 槽号(0~11)
        slot_v - 归一化ADC电压(VCC=5000mV基准)
  返回: 下一个充电状态(CHG_ACTIVATE / CHG_PRECHARGE / CHG_CV_CHARGE /
        CHG_CC_CHARGE / CHG_ERROR)
  说明: (V58D)原为 DETECT_LI_ROUTE 宏, 在 Slot_Charge_Ctrl 内被展开3次, 每次展开
        都会在该函数栈上再生成一份 vx_mv/bat_mv_long/bat_mv(共10字节)局部量;
        改为函数后只保留1份. 原宏内的 charge_ticks=0 由调用方负责.
  注意: 现场验证: V58J(=V58G机器码, SHA256一致)同工装3/3全部通过; V58I 同工装失败.
        (V58J)已回退 V58I 的"ADC域折叠"(原把 bat_mv>=1520 反解为 slot_v>=3235).
        (V58K)本版=实验B隔离版: 保留 V58G 的 32 位运算与全部 auto(19字节), 只删除
        上面两条数学上不可达的分支(bat_mv 恒 >=1030, 永不满足 <=100 / <900), 故
        RAM/ROM 布局与 V58G 基本相同. 目的: 单独检验"删掉这两条分支"是否有害,
        以把"逻辑等价性"与"布局敏感性"分开.
        · V58K 通过 → 删分支无害(印证数学证明), V58I 的失败只能归因于折叠带来的
          布局重排(auto 19→3字节 + 代码段位移约1000字) → 下一步 V58L: 保留折叠
          但补回 auto 占用以还原布局.
        · V58K 失败 → 删这两条"不可达"分支确实改变了行为, 数学证明需重新审视.
        现场实测: V58J(=V58G机器码) 3/3 通过, V58K(RAM同V58G, ROM仅-19字) 3/3 通过
        → 删分支无害, 数学证明成立; 空槽读数摆动在 V58J 同样出现(2692↔4248), 属
        逐槽采样的时序现象, 与版本无关.
        (V58L=实验C)作废: 16字节 volatile 占位未被XC8分配(Data space仍267B), 无效.
        (V58M=实验D)判定式改用ADC阈值, 但保留 V58G 的32位mV折算(用恒假比较强制
        保留运算量), 使代码量/RAM/耗时≈V58G → 通过=判定式无罪(失败只是footprint/
        时序), 失败=判定式在现场确实不等价.
========================================================================*/
unsigned char Route_DetectLi(unsigned char idx, unsigned int slot_v)
{
	/* (V58M)实验D: 判定式改用ADC阈值(与V58I相同), 但保留 V58G 的32位mV折算运算,
	   并把其结果的比较(恒假)挂在条件上, 使本函数的代码量/RAM占用/执行耗时与
	   V58G 基本一致. 用途: 把"判定式本身"与"折叠带来的footprint/时序变化"分开:
	     · V58M 通过 → 判定式无罪, V58I的失败只能归因于footprint/时序变化
	     · V58M 失败 → 判定式在现场确实不等价, 需重新审视等价性推导
	   (V58L实验作废: 16字节 volatile 占位未被XC8分配, Data space仍267B, 无效.) */
	unsigned long vx_mv;
	unsigned long bat_mv_long;
	unsigned int  bat_mv;
	unsigned char st;

	vx_mv = (unsigned long)slot_v * VCC_REF_MV / 4096UL;
	bat_mv_long = ALPHA_NUM * vx_mv + BETA_NUM * VCC_REF_MV;
	bat_mv = (unsigned int)((bat_mv_long + CAL_DEN/2UL) / CAL_DEN);

	/* 第二条件恒假(bat_mv 全域上限约10950 < 60000), 仅用于强制保留mV折算的运算量 */
	if(slot_v >= ADC_V_ROUTE_FULL || bat_mv > 60000U)
	{
		if(CV_CRASH_CNT(idx) >= CV_DROP_LOOP_MAX)
		{
			st = CHG_ERROR;
		}
		else
		{
			st = CHG_CV_CHARGE;
			g_slotRefV[idx] = slot_v;
			g_ccBlocks[idx] = 0;
			g_stableCnt[idx] = 0;
		}
	}
	else
	{
		st = CHG_CC_CHARGE;
		CC_BLK_ZERO(idx); /* 仅清块计数, 保留CC_RETRY_FLAG(使CC超时
		                                     重判能累计到再次超时ERROR, 防无限循环) */
		g_slotRefV[idx] = slot_v;
		g_stableCnt[idx] = 0;
	}
	g_ovCnt[idx] = 0;
	g_detectLowCnt[idx] = 0;
	return st;
}

/* IMP_CHECK阶段VCC解码: 从g_impData高4位还原脉冲前VCC(mV), 误差≤50mV */
#define IMP_VCC_DECODE(data)  (((((data) >> 12) & 0x0FU) + 38U) * 100U)

/* IMP_CHECK阶段脉冲前电压解码: 从g_impData低12位还原脉冲前归一化电压(pre) */
#define IMP_PRE_VOLT(data)  ((data) & 0x0FFFU)

/* IMP_CHECK阶段g_impData打包: 低12位=脉冲前电压pre_v, 高4位=脉冲前VCC编码(100mV步进)
   pre_v钳位到12位上界: 归一化空槽读数=(ADC满量程4095)*VCC/5000, 在VCC>5000mV时
   可达~4240, 超过12位(0~4095). 若直接打包, 溢出位会撞入高4位VCC字段, 使解码出的
   pre被截断成小值(如4151→55)且VCC被抬高一级, 导致IMP_CHECK空槽识别失效、
   DIODE_TEST误判pre<DIODE_PRE_MIN而拒充DRY. 钳位到4095后空槽pre与slot_v均≥4050,
   由IMP_CHECK空槽判据正常拦截. 真实电池归一化读数≤ADC_V_OPEN(3990)<4095, 不受影响. */
#define IMP_PACK(pre_v, vcc_mv)  ((((pre_v) > 0x0FFFU) ? 0x0FFFU : (pre_v)) | \
                                  ((unsigned int)((((vcc_mv) + 50U) / 100U) - 38U) << 12))

/* VCC归一化满量程: 该VCC下空槽/爬升至顶读数的归一化ADC(=VCC*4096/5000) */
#define VCC_NORM(vcc_mv)  ((unsigned int)(((unsigned long)(vcc_mv) * 4096UL) / VCC_REF_MV))

/*========================================================================
  函数: Route_LiIon
  功能: 锂电路由(恒压锂): 释放检测链令牌 + 标记类型 + 路由到CC/CV/ERROR
  参数: idx - 槽号
  返回: 下一个充电状态
  说明: (V58G)原为 imp_li_ion 标签的共用尾块, 由IMP_CHECK与DIODE_TEST多处以
        goto进入; 改为函数后调用点写作 s_work.state = Route_LiIon(idx);
        因s_work为文件级工作副本, 无需传参即可读写槽位工作状态.
========================================================================*/
unsigned char Route_LiIon(unsigned char idx)
{
	g_detectOwner = 0xFF;
	g_highVFlag &= ~((unsigned int)1 << idx);
	s_work.type = BAT_TYPE_LI_ION;
	s_work.chargeTimer = 0;
	return Route_DetectLi(idx, s_work.voltage);
}

/*========================================================================
  函数: Route_LinearLi
  功能: 线性锂路由(无charger IC, VCC不塌)
  参数: idx - 槽号
        pre - 脉冲前电压(g_impData低12位)
  返回: 下一个充电状态(CHG_ERROR = CC_RETRY_FLAG已锁死拒充)
  说明: (V58G)原为 imp_linear_li 标签的共用尾块.
        碳性/碱性循环锁死: 该槽已完成一次LINEAR_LI CC无进展超时(16s)仍未充电
        → 判高内阻干电池锁死拒充, 杜绝 DET→DIO→CC→ERR 无限循环; 清highVFlag
        防止ERROR重判回DETECT. 真实线性锂CC中电压必上升, 不受此锁影响.
        必须用脉冲前电压(pre)而非s_work.voltage做路由: 线性锂无charger IC拉载,
        IMP_CHECK PWM脉冲后电容充电至VCC, 体二极管被阻断无法放电→slot_v读伪
        OPEN(4091), 若用slot_v会误入CV且g_slotRefV被设为4091, 后续PEAK_DROP
        必然触发; 脉冲前电压来自DETECT(MOSFET导通→电容跟踪Vbat→读数准确).
        注: 锁死分支直接返回ERROR, 不重置计时器(与改前一致).
========================================================================*/
unsigned char Route_LinearLi(unsigned char idx, unsigned int pre)
{
	g_detectOwner = 0xFF;
	g_highVFlag &= ~((unsigned int)1 << idx);
	if(CC_RETRY_TST(idx))
	{
		s_work.type = BAT_TYPE_DRY;
		return CHG_ERROR;
	}
	s_work.type = BAT_TYPE_LINEAR_LI;
	s_work.chargeTimer = 0;
	return Route_DetectLi(idx, pre);
}

/*========================================================================
  函数: Detect_Classify
  功能: DETECT阶段的类型分类与路由(原 amb_check 标签尾块)
  参数: idx       - 槽号
        fromHighV - 1 = 由DETECT高压路径进入(原 amb_shortcut): 先清高压标记并
                    强制AMBIGUOUS; 0 = 常规路由(s_work.type 已确定)
  返回: 无(直接改写 s_work.state / s_work.chargeTimer / s_work.type)
  说明: (V58G)直接改写 s_work 而非返回值, 因此"消抖未满/继续等待"等本tick
        不改变状态的情况用 return 表达(等价于原 break 跳出switch),
        不需要哨兵值或打包编码.
        fromHighV 合并进本函数(而非独立函数)是为了不多一层调用嵌套:
        硬件栈上限8层, 合并后最深需求为6层.
========================================================================*/
void Detect_Classify(unsigned char idx, unsigned char fromHighV)
{
	if(fromHighV)
	{
		/* 原 amb_shortcut 路径: 高压稳定但超时仍>2900, 先清高压标记并强制
		   AMBIGUOUS, 交IMP_CHECK用VCC跌落做最终区分. 走AMBIGUOUS而非直接
		   Detect_BatteryType(slot_v)的原因: 后者会把>2900覆盖为LI_ION,
		   导致IMP_CHECK被跳过.
		   注: 合并进本函数(而非独立函数)是为了不再多一层调用嵌套——
		   硬件栈已用到7/8层, 每多一层嵌套都可能溢出. */
		g_capFlag &= ~((unsigned int)1 << idx);
		g_stableCnt[idx] = 0;
		s_work.type = BAT_TYPE_AMBIGUOUS;
	}
	if(s_work.type == BAT_TYPE_AMBIGUOUS)
	{
		/* AMBIGUOUS电压段: 短脉冲方向检测区分恒压/线性锂与NiMH/干电池.
		   消抖: 单帧VCC污染可能让空槽(4093)误读为~2243, 需连续2帧确认 */
		g_detectLowCnt[idx]++;
		if(g_detectLowCnt[idx] < 2)
			return;
		/* 取令牌 + 重新采样VCC(防止g_vcc_mv滞后于其他槽充电导致的VCC跌落,
		   实测其他槽充电时VCC从5000降至4717, 用旧VCC编码会误判>200mV跌落) */
		g_detectOwner = idx;
		Get_Vcc();
		/* VCC打包至g_impData: 低12位=脉冲前电压, 高4位=脉冲前VCC编码 */
		g_impData = IMP_PACK(s_work.voltage, g_vcc_mv);
		s_work.state = CHG_IMP_CHECK;
		s_work.chargeTimer = 0;
		g_detectLowCnt[idx] = 0;
		return;
	}
	if(s_work.type == BAT_TYPE_LI_ION || s_work.type == BAT_TYPE_LINEAR_LI)
	{
		/* LI_ION/LINEAR_LI: 连续2帧确认, 防碳性/碱性ADC尖峰越过NIMH_HIGH误判 */
		g_detectLowCnt[idx]++;
		if(g_detectLowCnt[idx] < 2)
			return;
		s_work.state = Route_DetectLi(idx, s_work.voltage);
		s_work.chargeTimer = 0;
		return;
	}
	if(s_work.type == BAT_TYPE_UNKNOWN)
	{
		/* UNKNOWN: 分辨空槽(OPEN)和不可识别电池(SHORT/异常) */
		if(s_work.voltage >= ADC_V_OPEN)
			return;                 /* 继续等待电压下降 */
		s_work.state = CHG_ERROR;   /* 电压异常或无法识别 → 报错 */
		g_detectLowCnt[idx] = 0;
		return;
	}
	/* 剩余: NIMH / DRY → 拒充报错 */
	s_work.state = CHG_ERROR;
	g_detectLowCnt[idx] = 0;
}

/*========================================================================
  函数: Enter_DiodeTest
  功能: 进入体二极管被动检测(CHG_IMP_DIODE_TEST)
  参数: idx - 槽号
  返回: 无
  说明: (V58G)原为 imp_diode_test_entry 标签尾块. 保持检测链令牌不释放,
        防止g_impData基准被其它槽改写.
========================================================================*/
void Enter_DiodeTest(unsigned char idx)
{
	s_work.state = CHG_IMP_DIODE_TEST;
	s_work.chargeTimer = 0;
	g_diodeTraceCnt = 0;        /* 新一轮检测开始, 清slot_v轨迹(单槽共享缓冲) */
	g_diodeTraceSlot = (unsigned char)idx;
	g_highVFlag &= ~((unsigned int)1 << idx);
}

/*========================================================================
  函数: Slot_Charge_Ctrl
  功能: 单槽同步控制: 采样 + 检测 + 充电 + MOSFET(12槽由主循环顺序调用)
  说明: (V58F起)槽位工作状态统一放在文件级工作副本 s_work 上, 不再使用4个影子
        局部量. s_work 的各字段与原局部量的对应关系(下文历史注释按旧名理解):
          s_work.state       <-> state        (充电状态 CHG_xxx)
          s_work.type        <-> type         (电池类型 BAT_TYPE_xxx)
          s_work.voltage     <-> slot_v       (归一化ADC电压, VCC=5000基准)
          s_work.chargeTimer <-> charge_ticks (10ms节拍计时器)
        入口 s_work = g_slot[idx]; 出口 g_slot[idx] = s_work; 中间不再同步,
        因此任何提前return前只需确认已回写一次即可, 不会漏字段.
========================================================================*/
void Slot_Charge_Ctrl(unsigned char idx)
{
	unsigned int  charge_ticks_prev;                  /* chargeTimer累加前值(跨越检测: 精确tick点==N) */
	unsigned char dly;                     /* 稳定延时循环计数 */

	/* 取入本槽工作副本(索引访问仅此1次, 6字节整体赋值) */
	s_work = g_slot[idx];

	/* --- charge_ticks按ISR 10ms硬件节拍累加(与打印/主循环轮速解耦).
	   累加粒度可能>1tick, 因此所有"charge_ticks==N"精确判断
	   必须用 charge_ticks_prev/charge_ticks 跨越检测, 不能直接比较. --- */
	charge_ticks_prev = s_work.chargeTimer;
	s_work.chargeTimer += (unsigned int)g_elapsedTicks;

	/* --- 检测链令牌门控(覆盖整个检测链, 含DETECT段) ---
	   此前令牌仅在IDLE入链门控与AMBIGUOUS→IMP_CHECK交接处检查, DETECT段最长
	   ~10s不受令牌约束, 使多个槽可同时在DETECT中采样且MOSFET同时导通相互串扰.
	   此处扩展为整链独占: 非持令牌槽在此冻结(不采样/不推进状态/关MOSFET),
	   由持令牌槽跑完整链后释放, 是检测链唯一的时间互斥点. --- */
	if((s_work.state == CHG_DETECT || s_work.state == CHG_IMP_CHECK || s_work.state == CHG_IMP_DIODE_TEST) &&
	   g_detectOwner != 0xFF && g_detectOwner != idx)
	{
		/* 登记本槽为等待者: 阻止IDLE空槽抢占令牌, 使令牌在持令牌槽完成后
		   优先交给等待槽, 避免重判槽(CC超时回DETECT)在连续空槽间被长期饥饿. */
		if(g_detectWaiter == 0xFF)
			g_detectWaiter = idx;
		SLOT_CHARGE_OFF(idx);
		g_slot[idx] = s_work;   /* 回写: 本轮chargeTimer累加已生效, 此处return不丢状态 */
		return;
	}

	/* --- 单槽同步采样: 关MOSFET → 稳定延时 → 采样并归一化 --- */
	SLOT_CHARGE_OFF(idx);
	if(s_work.state == CHG_DETECT || s_work.state == CHG_IMP_CHECK || s_work.state == CHG_IMP_DIODE_TEST)
	{
		/* 2000us: 让BxAD电容充电/放电到可区分电池类型的电平 */
		for(dly = 0; dly < 20; dly++)
			__delay_us(100);
	}
	else
	{
		__delay_us(100);
	}

	{
		unsigned int newv = Adc_Norm(s_adcChannels[idx]);
		/* LINEAR_LI CC/CV伪OPEN消噪: 读到OPEN不更新, 保留上次有效值 */
		if(!(s_work.type == BAT_TYPE_LINEAR_LI &&
		     (s_work.state == CHG_CC_CHARGE || s_work.state == CHG_CV_CHARGE) &&
		     newv >= ADC_V_OPEN))
		{
			s_work.voltage = newv;
		}
	}

	switch(s_work.state)
	{
	case CHG_IDLE:
		/* 空槽轮询停留: 空槽(slot_v≥OPEN)停留IDLE_POLL_TICKS后再转DETECT,
		   避免空槽在DETECT→IMP_CHECK→IDLE间循环导致红灯常亮. */
		if(s_work.voltage >= ADC_V_OPEN)
		{
			if(s_work.chargeTimer < IDLE_POLL_TICKS)
				break;              /* charge_ticks已在开头按10ms节拍累加 */
		}

		/* 单槽串行化: 检测链(检测令牌)被其他槽占用, 或已有槽在等待令牌时,
		   本槽等待入链, 避免多槽同时跑检测链相互串扰; 等待者优先获令牌,
		   防止令牌在连续空槽间单向传递使先入链的重判槽长期饥饿 */
		if((g_detectOwner != 0xFF && g_detectOwner != idx) ||
		   (g_detectWaiter != 0xFF && g_detectWaiter != idx))
			break;

		s_work.chargeTimer = 0;
		s_work.state = CHG_DETECT;       /* 令牌在switch后统一申请(见下方单点判定) */
		g_ccBlocks[idx] = 0;      /* 新检测周期复位块计数/CV崩溃计数与CC_RETRY_FLAG */
		g_highVFlag &= ~((unsigned int)1 << idx);
		/* 记录IDLE→DETECT初始电压, 用于charge_ticks<TIME_DETECT_WAIT期间
		   检测碳性/空槽电容被串扰充电(电压大幅上升>1000ADC) */
		if(s_work.voltage < ADC_V_OPEN)
			g_slotRefV[idx] = s_work.voltage;
		else
			g_slotRefV[idx] = 0;
		break;

	case CHG_DETECT:
		/* charge_ticks已在开头按10ms节拍累加 */

		/* 首次进入DETECT(跨越charge_ticks=1): 重置本槽专用计数器, 清除可能残留的电容标记 */
		if(charge_ticks_prev < 1U && s_work.chargeTimer >= 1U)
		{
			DET_STABLE_CNT(idx) = 0;
			g_capFlag &= ~((unsigned int)1 << idx); /* 通过idx清除可能残留的电容标记 */
		}

		if(s_work.chargeTimer < TIME_DETECT_WAIT)
		{
			/* 停用"串扰充电快速检测"(ref>2500 && slot_v>ref+1000 → 判DRY):
			   该判据会误杀charger IC输出电容建立慢的真锂电, 且与高压稳定
			   流程功能重叠. 干电池/碱性改走IMP_CHECK(VCC不塌+脉冲后大跌)
			   或DIODE_TEST(爬升不足超时)拒充, 仅拒充时间略长. */
			break;
		}

		/* 高内阻电池(碳性/碱性)开槽放电稳定检测:
		   OPEN→DETECT时槽位电容充满近VCC电荷, 高内阻电池放电慢,
		   初始ADC读数偏高(碳性R6P实测: 3745→1972需约8秒)
		   charge_ticks=200时标记>2900, 稳定后若降至≤2900→电容放电→g_capFlag清除
		   高压区间(>2900): 连续稳定tick=真锂电池→放行;
		   否则延至≤2900直接判DRY或超时(碳性电容放电至2900约3秒) */
		if(charge_ticks_prev < TIME_DETECT_WAIT && s_work.chargeTimer >= TIME_DETECT_WAIT)
		{
			g_slotRefV[idx] = s_work.voltage;
			if(s_work.voltage > ADC_V_NIMH_MAX)
				g_capFlag |= (unsigned int)1 << idx;  /* 标记: 初始电压>2900(可能是电容放电) */
			break;
		}
		if(s_work.voltage > ADC_V_NIMH_MAX && s_work.voltage < ADC_V_OPEN)
		{
			/* 门禁: 仅charge_ticks=TIME_DETECT_WAIT时电压已>2900(g_capFlag置位)
			   才进入高压稳定路径. 若初始电压≤2900(无cap标记)后电压
			   异常跳升>2900: 多槽IMP_CHECK排队等待期间其他槽充电噪声/
			   串扰导致ADC读值异常(碳性1960→3769), 重置DETECT重读.
			   但电压>NEAR_OPEN(3500)时已接近OPEN, 不可能是碳性噪声,
			   应继续高压稳定流程, 避免高压线性锂/恒压锂(B11等)卡死.
			   接触改善导致电压真上升会在重置后charge_ticks=TIME_DETECT_WAIT时正确置cap标记
			   type=AMBIGUOUS跳过: amb_shortcut清除g_capFlag后type已标记
			   为AMBIGUOUS(确认高压稳定), 门禁不应重置charge_ticks→丢失进度 */
			if(!(g_capFlag & ((unsigned int)1 << idx)) && s_work.type != BAT_TYPE_AMBIGUOUS &&
			   s_work.voltage <= ADC_V_NEAR_OPEN)
			{
				s_work.chargeTimer = 0;
				g_slotRefV[idx] = 0;
				DET_STABLE_CNT(idx) = 0;
				g_detectLowCnt[idx] = 0;
				break;
			}

			/* 高压区间(>2900): 两阶段处理
			   [1]稳定循环: 连续DETECT_STABLE_TICKS无显著下跌→电压已稳定
			       每周期更新g_slotRefV跟踪当前值, 防电压振荡(B6线性锂电
			       3790↔3693)被误判为"累计下跌"导致计数器反复重置卡死
			   [2]扩展等待: g_capFlag标记电池稳定后不立即路由,
			       延长等待电容放电至2900以下(碳性R6P实测需~3秒),
			       超时仍>2900→真实锂电池放行 */
			unsigned int v_init = g_slotRefV[idx];

			if(DET_STABLE_CNT(idx) >= DETECT_STABLE_TICKS)
			{
				/* 高压稳定确认: 记录此槽在DETECT中V>2900持续稳定,
				   IMP_CHECK时若判DRY但此标记存在→charger IC断开假象→走LI_ION
				   真干电池(碳性/碱性)无法在高压区间连续20tick保持稳定 */
				g_highVFlag |= (unsigned int)1 << idx;
				/* ── 阶段[2]: 扩展等待电容放电 ── */
				if(s_work.voltage <= ADC_V_NIMH_MAX)
				{
					/* 电压降至2900以下 → 电容放电确认, 清除所有高压标记 */
					g_capFlag &= ~((unsigned int)1 << idx);
					DET_STABLE_CNT(idx) = 0;
					g_highVFlag &= ~((unsigned int)1 << idx);
				}
				else if(s_work.chargeTimer < TIME_DETECT_WAIT + TIME_DETECT_SETTLE)
				{
					/* 高压锂电提前放行: g_highVFlag已确认V>2900稳定(上面刚置位,
					   本分支内无清除路径, 故不再重复判断), 碳性电池电容放电至
					   ≤2900实测R6P约3秒, 保守等25tick(≈2s)后仍>2900→真锂电,
					   直接IMP_CHECK. 碳性稳态分压降不下, 多等无益; 异常误入由
					   DIODE_TEST判据及CC/CV崩溃锁定兜底 */
					if(s_work.chargeTimer >= TIME_DETECT_WAIT + 25U)
					{
						Detect_Classify(idx, 1);   /* 已到提前放行点 */
						break;
					}
					/* 未到提前放行点: 继续等待, 更新基准跟踪当前值 */
					g_slotRefV[idx] = s_work.voltage;
					break;
				}
				else
				{
					/* 超时仍>2900: 转AMBIGUOUS交IMP_CHECK用VCC跌落做最后区分 */
					Detect_Classify(idx, 1);
					break;
				}
			}
			else
			{
				/* ── 阶段[1]: 稳定循环 ──
				   超时兜底: 读数持续波动导致g_stableCnt长期凑不满20时,
				   达到总等待上限强制走AMBIGUOUS→IMP_CHECK, 防止永久卡DETECT */
				if(s_work.chargeTimer >= TIME_DETECT_WAIT + TIME_DETECT_SETTLE)
				{
					Detect_Classify(idx, 1);
					break;
				}
				/* 电压显著下跌→重置稳定计数; 稳定/小幅上升→递增.
				   两种情况都先把基准跟踪到当前值: 防电压振荡(B6线性锂电
				   3790↔3693)被误判为"累计下跌"导致计数器反复重置卡死 */
				g_slotRefV[idx] = s_work.voltage;
				if(s_work.voltage + DETECT_SETTLE_DROP < v_init)
					DET_STABLE_CNT(idx) = 0;
				else
					DET_STABLE_CNT(idx)++;
				if(DET_STABLE_CNT(idx) < DETECT_STABLE_TICKS)
					break;                       /* 尚未稳定: 继续等待 */
				/* 稳定确认: cap标记→保留计数器进入阶段[2]扩展等待 */
				if(g_capFlag & ((unsigned int)1 << idx))
					break;                       /* 下tick进入扩展等待 */
				DET_STABLE_CNT(idx) = 0;            /* 无cap标记: 直接放行 */
			}
		}
		else if(s_work.chargeTimer < TIME_DETECT_WAIT + TIME_DETECT_SETTLE && s_work.voltage < ADC_V_OPEN)
		{
			unsigned int v_ref = g_slotRefV[idx];
			if(v_ref < ADC_V_OPEN && s_work.voltage + DETECT_SETTLE_DROP < v_ref)
			{
				g_slotRefV[idx] = s_work.voltage;
				break;
			}
		}

		/* 电容放电标记路由: 电压已降至2900以下(经扩展等待或自然放电)
		   统一走AMBIGUOUS→IMP_CHECK: VCC跌落脉冲可靠区分NiMH(>300mV塌陷)
		   和锂电(>200mV跌落), 碳性无charger IC不拉载VCC→判DRY拒充 */
		if(g_capFlag & ((unsigned int)1 << idx))
		{
			g_capFlag &= ~((unsigned int)1 << idx);  /* 清除标记 */
			g_detectLowCnt[idx] = 0;                  /* 重置消抖计数器 */
			s_work.type = BAT_TYPE_AMBIGUOUS;                  /* 强制AMBIGUOUS→IMP_CHECK */
		}
		else
		{
			s_work.type = Detect_BatteryType(s_work.voltage);
			/* 空槽OPEN超时直接进IMP_CHECK: 强制type=AMBIGUOUS复用amb_check的
			   消抖+令牌独占+VCC重采样, 否则type每轮被Detect_BatteryType覆盖回
			   UNKNOWN, 永远进不了IMP_CHECK. 空槽脉冲前后slot_v均≥OPEN→回IDLE,
			   恒压/线性锂负载下slot_v跌至真实值→正常充电. */
			if(s_work.type == BAT_TYPE_UNKNOWN && s_work.voltage >= ADC_V_OPEN &&
			   s_work.chargeTimer >= TIME_DETECT_WAIT + TIME_DETECT_SETTLE)
				s_work.type = BAT_TYPE_AMBIGUOUS;
		}

		/* 消抖: 高内阻电池ADC读数可能跳动到极低值,
		   连续N次低值才判定为UNKNOWN, 避免单次噪点误触发ERROR */
		if(s_work.voltage < ADC_V_SHORT)
		{
			g_detectLowCnt[idx]++;
			if(g_detectLowCnt[idx] < DETECT_LOW_DEBOUNCE)
				break;
		}
		/* 仅对UNKNOWN/NIMH/DRY重置计数器, AMBIGUOUS和LI_ION各自维护消抖计数 */
		else if(s_work.type != BAT_TYPE_AMBIGUOUS && s_work.type != BAT_TYPE_LI_ION && s_work.type != BAT_TYPE_LINEAR_LI)
		{
			g_detectLowCnt[idx] = 0;
		}

		/* 类型分类与路由(原 amb_check 尾块, 已提取为函数): 内部直接改写
		   s_work.state / s_work.chargeTimer / s_work.type; 消抖未满或需继续
		   等待时本tick不改变状态. 注: 空槽(slot_v≥OPEN)且等待超时的槽已由上方
		   强制AMBIGUOUS接管, 故此处UNKNOWN仅在超时前短暂出现(电容放电中) */
		Detect_Classify(idx, 0);
		break;

	case CHG_IMP_CHECK:
		/* charge_ticks已在开头按10ms节拍累加; IMP_PULSE_TICKS=5(50ms),
		   主循环一轮(elapsed≥1)即达到脉冲窗口 */
		if(s_work.chargeTimer < IMP_PULSE_TICKS)
			break;

		{
			/* 实时VCC采样: IMP_CHECK期间MOSFET已导通~80ms */
			Get_Vcc();

			/* ── 电池拔出检测（最高优先级） ──
			   脉冲前、后电压均≥OPEN → 确实空槽/已被拔出
			   高压碱性满电电压~3967~4005, 与OPEN接近但<4050,
			   仅当双值均≥4050才判空槽, 避免高压电池被误拔入IDLE死循环. */
			if(s_work.voltage >= 4050U && IMP_PRE_VOLT(g_impData) >= 4050U)
			{
				s_work.type = BAT_TYPE_UNKNOWN;
				s_work.state = CHG_IDLE;
				g_detectOwner = 0xFF;
				g_highVFlag &= ~((unsigned int)1 << idx);
				break;
			}

			/* ── 空槽识别(归一化域, 兼容低VCC) ──
			   无电池时BxAD电容经100K上拉至VCC, 脉冲前(pre)后(slot_v)读数
			   均接近各自VCC的归一化满量程(VCC_norm). pre按打包时VCC
			   解码, slot_v按当前VCC, 双基准各自抵消VCC波动(含其他槽拉载).
			   真锂电: 线性锂pre为电池电压(远低于VCC_norm), 恒压锂脉冲
			   后slot_v被电池钳位回落, 均不满足, 不会被误判拔出. */
			{
				unsigned int vcc_norm_pre = VCC_NORM(IMP_VCC_DECODE(g_impData));
				unsigned int vcc_norm_now = VCC_NORM(g_vcc_mv);
				if((IMP_PRE_VOLT(g_impData) + DIODE_TOP_MARGIN >= vcc_norm_pre) &&
				   (s_work.voltage + DIODE_TOP_MARGIN >= vcc_norm_now))
				{
					s_work.type = BAT_TYPE_UNKNOWN;
					s_work.state = CHG_IDLE;
					g_detectOwner = 0xFF;
					g_highVFlag &= ~((unsigned int)1 << idx);
					break;
				}
			}

			/* ── NiMH VCC塌陷检测 ──
			   VCC跌落>300mV 且 脉冲后电池端被拉到OPEN
			   恒压锂电charger IC也会拉低VCC, 但电池端不会飙升到OPEN, 避免误判 */
			if(IMP_VCC_DECODE(g_impData) > g_vcc_mv + 300U && s_work.voltage >= ADC_V_OPEN)
			{
				s_work.type = BAT_TYPE_NIMH;
				s_work.state = CHG_ERROR;
				g_detectOwner = 0xFF;
				g_highVFlag &= ~((unsigned int)1 << idx);
				break;
			}

			/* ── 恒压锂电: VCC跌落>200mV ──
			   高压/中压碳性(pre≥3100)在IMP脉冲时VCC波动易超200mV被误判为
			   恒压锂, 故仅对脉冲前<3100的电池启用此判据,
			   中压段统一走DIODE_TEST用爬升区分. */
			if(IMP_VCC_DECODE(g_impData) > g_vcc_mv + 200U &&
			   IMP_PRE_VOLT(g_impData) < 3100U)
			{
				s_work.state = Route_LiIon(idx);
				break;
			}

			/* ── 碳性/碱性干电池: 脉冲后电压比脉冲前低>1000ADC ──
			   g_highVFlag保护: DETECT已确认高压稳定的真锂电跳过此判据,
			   其脉冲前读数是电容虚高(实测脉冲后回落>1000), 并非电池真值;
			   碳性/碱性无法在DETECT连续稳定, flag不置位仍正常拒充 */
			if(!(g_highVFlag & ((unsigned int)1 << idx)) &&
			   (IMP_PRE_VOLT(g_impData) > s_work.voltage) &&
			   (IMP_PRE_VOLT(g_impData) - s_work.voltage) > 1000U)
			{
				s_work.type = BAT_TYPE_DRY;
				s_work.state = CHG_ERROR;
				g_detectOwner = 0xFF;
				g_highVFlag &= ~((unsigned int)1 << idx);
				g_detectLowCnt[idx] = 0;
				break;
			}

			/* ── 高压锂电保护: pre>NEAR_OPEN 且 VCC不塌(<200mV)
			   不直接判DRY, 先进DIODE_TEST确认, 避免高压恒压锂/线性锂
			   (B10/B11/B12等)被误拒充 */
			if((IMP_PRE_VOLT(g_impData) > ADC_V_NEAR_OPEN) &&
			   (IMP_VCC_DECODE(g_impData) <= g_vcc_mv + 200U))
			{
				Enter_DiodeTest(idx);
				break;
			}

			/* ── 兜底: 未命中上述判据 → 一律进DIODE_TEST确认 ──
			   脉冲后≥OPEN(体二极管阻断), 或线性锂/恒压锂/镍氢/碱性, 统一由
			   DIODE_TEST用爬升区分Li与DRY/NiMH.
			   注: 原代码此处为 "if(slot_v >= ADC_V_OPEN) goto imp_diode_test_entry;"
			   其后紧接同名标签, 两条路径目标相同, 该if恒为冗余, 故直接进入. */
			Enter_DiodeTest(idx);
		}
		break;

	/*========================================================================
	  CHG_IMP_DIODE_TEST: 体二极管被动检测
  MOSFET关断, BxAD电容通过100K上拉充电, 观察电压爬升
	  线性锂(体二极管阻断): 电容持续爬升>DIODE_RISE_THRESH
	  镍氢/干电池(体二极管导通或内阻大): 电压被钳位, 爬升不足
	========================================================================*/
	case CHG_IMP_DIODE_TEST:
		/* charge_ticks已在开头按10ms节拍累加 */
		/* 记录slot_v相对pre的偏移轨迹(charge_ticks=7,14,21,28共4点, 每点1字节:
		   (slot_v-pre)/4+128, 覆盖±508ADC并clamp), 供主循环打印分析.
		   仅写数组不打印, 避免UART阻塞破坏PWM/扫描时序.
		   charge_ticks为10ms节拍, 一次累加可能跨多个采样点→循环补齐 */
		while(g_diodeTraceCnt < 4U)
		{
			unsigned char pt = (unsigned char)(g_diodeTraceCnt + 1U);
			unsigned int  ptTick = (unsigned int)pt * 7U;
			if(s_work.chargeTimer < ptTick)
				break;                      /* 未到下一采样点(7/14/21/28) */
			{
				signed int diff = (signed int)s_work.voltage - (signed int)IMP_PRE_VOLT(g_impData);
				diff >>= 2;                 /* /4 */
				if(diff > 127) diff = 127;
				if(diff < -128) diff = -128;
				g_diodeTrace[g_diodeTraceCnt++] = (unsigned char)(diff + 128);
			}
		}
		{
			/* 注: 此处原有"电池拔出检查"空判据(判据体为空, 仅注释说明
			   "预脉冲非OPEN但当前OPEN属电容充电中, 非真拔出"), 无任何作用,
			   已删除, 行为不变. 电池拔出由IMP_CHECK的空槽双阈值判据处理. */

			/* 电压爬升检测: 当前电压-脉冲前电压 > DIODE_RISE_THRESH → Li
			   pre≥DIODE_PRE_MIN门槛: 低压碳性(pre≤1936)电容被100K自由浮空,
			   爬升快且无界(实测B10 T2 pre=1389越过+900被误放行进CC), 不构成
			   锂电特征; 实测锂电pre≥2271不受影响. */
			if(IMP_PRE_VOLT(g_impData) >= DIODE_PRE_MIN &&
			   s_work.voltage > IMP_PRE_VOLT(g_impData) + DIODE_RISE_THRESH)
			{
				/* 用IMP_CHECK期间记录的VCC跌落区分CV锂与线性锂:
				   跌落>150mV → 恒压锂, 否则 → 线性锂 */
				if(IMP_VCC_DECODE(g_impData) > g_vcc_mv + 150U)
					s_work.state = Route_LiIon(idx);
				else
					s_work.state = Route_LinearLi(idx, (unsigned int)IMP_PRE_VOLT(g_impData));
				break;
			}

			/* 高压锂电回落识别: IMP_CHECK时MOSFET导通BxAD电容被充到偏高电压;
			   DIODE_TEST中MOSFET关断, 真实高压锂电(低内阻)把电容电压拉回
			   电池本体 → slot_v明显低于pre但仍>NIMH_MAX. 碱性/碳性内阻大,
			   电容被100K继续拉向VCC, 不会出现此回落.
			   pre阈值取3000, 覆盖电压稍低的中压恒压锂电;
			   异常误入CC由崩溃检测锁定ERROR, 不循环 */
			if((IMP_PRE_VOLT(g_impData) > 3000U) &&
			   (s_work.voltage > ADC_V_NIMH_MAX) &&
			   (s_work.voltage < IMP_PRE_VOLT(g_impData)))
			{
				s_work.state = Route_LinearLi(idx, (unsigned int)IMP_PRE_VOLT(g_impData));
				break;
			}

			/* NiMH上拉虚高保护:
			   脉冲前<DIODE_PRE_MIN但DIODE_TEST期间电压>2900, 说明是100K上拉把
			   电池/电容充起来的虚假高电平, 判DRY拒充.
			   原pre≤2300会误杀真实线性锂(B6 T2 pre=2271爬升到3123), 收紧到
			   DIODE_PRE_MIN(实测锂电pre≥2271, 碳性pre≤1936);
			   同时拦截低压碳性自由浮空越过2900(B10 T2 pre=1389). */
			if((s_work.voltage > ADC_V_NIMH_MAX) &&
			   (IMP_PRE_VOLT(g_impData) < DIODE_PRE_MIN))
			{
				s_work.type = BAT_TYPE_DRY;
				s_work.state = CHG_ERROR;
				g_detectOwner = 0xFF;
				g_highVFlag &= ~((unsigned int)1 << idx);
				g_detectLowCnt[idx] = 0;
				break;
			}

			/* 低压锂电兜底: DIODE_TEST满20tick后, 电压仍稳定在>2100
			   且与脉冲前电压基本持平(下跌<160, 爬升≤DIODE_CLAMP_MARGIN),
			   说明体二极管/电池本体将电容钳位在电池电压附近 → 真锂电放行.
			   干电池(碳性/碱性)高内阻, 100K上拉能把电容持续推离电池电压,
			   爬升超钳位判据 → 超时判DRY拒充, 不再误入CC.
			   钳位判据覆盖全电压段; pre≤2300限制避免碳性中压(slot_v≈pre)触发;
			   slot_v+160>=pre覆盖充电中电压从pre上升的恒压锂(pre=1911→slot_v~2071~2282,
			   差160). 碱性/镍氢在DIODE_TEST中电压显著下跌(<2100)天然拒充. */
			if(s_work.chargeTimer >= 20U && s_work.voltage > 2100U &&
			   IMP_PRE_VOLT(g_impData) <= 2300U &&
			   s_work.voltage + 160U >= IMP_PRE_VOLT(g_impData) &&
			   s_work.voltage <= IMP_PRE_VOLT(g_impData) + DIODE_CLAMP_MARGIN)
			{
				s_work.state = Route_LinearLi(idx, (unsigned int)IMP_PRE_VOLT(g_impData));
				break;
			}

			/* 超时: 无爬升 → 干电池
			   高压锂电(pre/slot_v>NEAR_OPEN)可能仅因电容/体二极管特性爬升不足(<900),
			   直接判DRY会误杀; 中压锂电(pre 2300~3100)爬升缓慢(32~80ADC)也无法
			   达900. 对pre/slot_v>NEAR_OPEN及中压稳定钳位(slot_v与pre差<150)放行LINEAR_LI,
			   碳性中压即使被放行也由CC 16s超时锁定ERROR, 真实锂电不受影响. */
			if(s_work.chargeTimer >= DIODE_TEST_TICKS)
			{
				unsigned int pre = (unsigned int)IMP_PRE_VOLT(g_impData);
				/* 钳位到顶识别(相对基准, 消除VCC波动): 线性锂体二极管阻断,
				   电容被100K持续充至接近VCC(归一化后slot_v≈当前VCC_norm);
				   干电池体二极管导通被钳位在电池电压, slot_v远低于VCC_norm.
				   空槽已由IMP_CHECK拦截(pre与slot_v均≈VCC_norm), 此处仅slot_v到顶
				   而pre不满足即真线性锂, 覆盖低VCC下爬升空间不足900ADC的
				   中压锂电(绝对爬升判据的盲区). 恒压锂slot_v被电池钳位不爬升,
				   由VCC跌落判据区分. */
				{
					unsigned int vcc_norm = VCC_NORM(g_vcc_mv);
					if(s_work.voltage + DIODE_TOP_MARGIN >= vcc_norm)
					{
						if(IMP_VCC_DECODE(g_impData) > g_vcc_mv + 150U)
							s_work.state = Route_LiIon(idx);
						else
							s_work.state = Route_LinearLi(idx, pre);
						break;
					}
				}
				/* 高压段pre>3500放行锂电(须真实爬升): 真实线性锂体二极管阻断,
				   DIODE_TEST中slot_v相对pre持续爬升(实测≥80ADC); 碳性/碱性
				   电芯仅1.5V不可能稳定维持pre>3500, 空槽节点被充电轨偏置
				   到≈3500平直(slot_v≈pre差≤6), 均不满足爬升门槛而被挡.
				   用VCC跌落区分恒压锂(>150mV, charger IC拉载)与线性锂(不塌);
				   放行后由CC无进展锁死+钳位电压限制兜底 */
				if(pre > ADC_V_NEAR_OPEN && pre < ADC_V_OPEN &&
				   s_work.voltage >= pre + DIODE_CLIMB_MIN)
				{
					if(IMP_VCC_DECODE(g_impData) > g_vcc_mv + 150U)
						s_work.state = Route_LiIon(idx);            /* 恒压锂 */
					else
						s_work.state = Route_LinearLi(idx, pre);    /* 线性锂(爬升) */
					break;
				}
				/* 中压锂电放行(V57E log标定): 线性/恒压锂体二极管阻断, DIODE_TEST中
				   slot_v保持或爬升(实测pre+170~850的平台), 去掉原±150爬升上界
				   (只放行持稳锂电, 爬升型B4/B6/B8/B5全被误拒DRY);
				   slot_v上界取OPEN: 中压pre(<3500)线性锂爬升可越过3500进入
				   (3500,OPEN)段(实测pre3258→slot_v3604), 若上界仍取3500会落入
				   判据盲区误拒DRY, 越过OPEN(体二极管完全阻断充到VCC)由上方
				   钳位到顶判据承接;
				   slot_v>DIODE_MID_MIN绝对下界隔离镍氢(实测停留2300~2500不爬升,
				   避免B2 T3镍氢被放行进CC); pre≥DIODE_PRE_MIN隔离低压碳性
				   (与爬升判据同一下界);
				   平直持稳(pre<DIODE_MID_FLAT_MAX且slot_v未跌破pre-150)放行
				   爬升缓慢的锂电(实测平直锂电pre≤2849); pre≥此值必须真实爬升
				   (slot_v≥pre+DIODE_CLIMB_MIN), 挡碱性(pre≈3499)与空槽
				   (轨偏置≈3504)平直高值冒充锂电. 碳性中压若被放行仍由CC 16s
				   锁死兜底. */
				if(s_work.voltage > DIODE_MID_MIN && s_work.voltage < ADC_V_OPEN &&
				   pre >= DIODE_PRE_MIN && pre < 3500U &&
				   ((pre < DIODE_MID_FLAT_MAX && s_work.voltage + 150U >= pre) ||
				    s_work.voltage >= pre + DIODE_CLIMB_MIN))
				{
					s_work.state = Route_LinearLi(idx, pre);
					break;
				}
				/* 低压锂电预充放行: 深度过放锂电pre≈2000~2500, DIODE_TEST中
				   slot_v爬升超钳位(体二极管阻断充电电容)但未达中压下界,
				   落于低压兜底(≤pre+150)与中压(slot_v>2600)之间;
				   碳性pre≤DIODE_PRE_DRY_MAX实测上沿隔离; 镍氢slot_v≤pre+150
				   平直不满足爬升; 放行后由CC 16s无进展锁死兜底 */
				if(s_work.voltage > pre + DIODE_CLAMP_MARGIN && s_work.voltage < ADC_V_OPEN &&
				   pre > DIODE_PRE_DRY_MAX && pre < 3500U)
				{
					s_work.state = Route_LinearLi(idx, pre);
					break;
				}
				s_work.type = BAT_TYPE_DRY;
				s_work.state = CHG_ERROR;
				g_detectOwner = 0xFF;
				g_highVFlag &= ~((unsigned int)1 << idx);
				g_detectLowCnt[idx] = 0;
			}
	}
	break;

	case CHG_ACTIVATE:
		/* charge_ticks已在开头按10ms节拍累加 */
		if(s_work.chargeTimer > TIME_ACTIVATE_MAX)
		{
			s_work.state = CHG_ERROR;
			break;
		}
		if(s_work.voltage > ADC_V_ACTIVATE)
		{
			s_work.state = CHG_PRECHARGE;
			s_work.chargeTimer = 0;
			break;
		}
		if(s_work.voltage >= ADC_V_OVER)
		{
			s_work.state = CHG_ERROR;
			break;
		}
		break;

	case CHG_PRECHARGE:
		/* charge_ticks已在开头按10ms节拍累加 */
		if(s_work.chargeTimer > TIME_PRECHARGE_MAX)
		{
			s_work.state = CHG_ERROR;
			break;
		}
		if(s_work.voltage >= ADC_V_OVER)
		{
			g_ovCnt[idx]++;
			if(g_ovCnt[idx] >= OV_DEBOUNCE_CNT)
			{
				s_work.state = CHG_ERROR;
				break;
			}
		}
		else
		{
			g_ovCnt[idx] = 0;
		}
		if(s_work.voltage >= ADC_V_PRE_MAX)
		{
			s_work.state = CHG_CC_CHARGE;
			s_work.chargeTimer = 0;
			g_ccBlocks[idx] = 0;       /* 复位块计数与CC_RETRY_FLAG */
			g_ovCnt[idx] = 0;
			g_slotRefV[idx] = s_work.voltage;
			g_stableCnt[idx] = 0;      /* 复位CC无进展检测闩锁 */
		}
		break;

	case CHG_CC_CHARGE:
		/* charge_ticks已在开头按10ms节拍累加 */
		if(s_work.chargeTimer >= CC_BLOCK_TICKS)
		{
			s_work.chargeTimer -= CC_BLOCK_TICKS;
			CC_BLK_INC(idx);
		}
		/* 块计数检查屏蔽CC_RETRY_FLAG(bit7): 标志保留时g_ccBlocks=0x80,
		   若直接与CC_MAX_BLOCKS比较会误判"已充180分钟"→二次入CC瞬间
		   ERROR→重判死循环. */
		if(CC_BLK_CNT(idx) >= CC_MAX_BLOCKS)
		{
			s_work.state = CHG_ERROR;
			break;
		}

		/* 伪OPEN过滤: 线性锂电池无charger IC, BxAD电容充电至VCC后放电不足→伪OPEN(4091),
		   伪OPEN不更新g_slotRefV(防4091污染), 不触发CC→CV(等真实电压达标),
		   继续PEAK_DROP/OV/CC_MAX_BLOCKS等安全检查, CC→CV由真实电压触发 */
		if(s_work.voltage >= ADC_V_OPEN && s_work.type == BAT_TYPE_LINEAR_LI)
		{
			/* g_slotRefV不更新(跳过4091污染), 继续后续检查 */
		}
		else if(s_work.chargeTimer <= CC_NO_PROGRESS_TICKS)
		{
			/* CC无进展检测窗口期内冻结g_slotRefV为CC起点基准v0,
			   不做峰值追踪, 供下方进展判断与PEAK_DROP跌落基准使用
			   (LI_ION与LINEAR_LI均适用). 窗口结束后恢复峰值追踪. */
		}
		else
		{
			if(s_work.voltage > g_slotRefV[idx]) g_slotRefV[idx] = s_work.voltage;
		}

		/* 电压跌落/低压崩溃重判: 分类处理, 避免共用g_detectLowCnt互相清零
		   - LINEAR_LI(碳性误判): slot_v<2000持续33tick→ERROR
		   - LI_ION(碳性/接触不良): 峰值跌落>500或slot_v<2000, 连续2帧→回DETECT重判
		     真实恒压锂电CC中电压只升不跌, 不会长期<2000 */
		if(s_work.type == BAT_TYPE_LINEAR_LI)
		{
			if(s_work.voltage < 2000U)
			{
				g_detectLowCnt[idx]++;
				if(g_detectLowCnt[idx] >= 33U)
				{
					g_detectLowCnt[idx] = 0;
					s_work.state = CHG_ERROR;
					s_work.chargeTimer = 0;
					break;
				}
			}
			else
			{
				g_detectLowCnt[idx] = 0;
			}

			/* CC超时: LINEAR_LI在CC超过16s未进CV→超时重判
			   - slot_v≥2800(接近满电): 直接进CV, 由CV钳位电压(满电边缘缓升型)
			   - 有充电进展(slot_v较起点ref上升≥30ADC): 延长CC继续充(低压锂电)
			   - 无进展且已二次超时(CC_RETRY_FLAG): ERROR锁死(碳性/异常)
			   - 无进展且首次超时: 置CC_RETRY_FLAG回DETECT重判
			   真实线性锂CC阶段电压应快速升过ADC_V_FULL进CV; 伪OPEN(4091)
			   不满足slot_v<OPEN分支, 按有进展延长, 由真实电压后续判定. */
		if(s_work.chargeTimer >= CC_LINEAR_LI_TICKS)   /* 16s未进CV→回DETECT重判/ERROR锁死 */
		{
			s_work.chargeTimer = 0;
			if(s_work.voltage >= 2800U && s_work.voltage < ADC_V_OPEN)
			{
				s_work.state = CHG_CV_CHARGE;
				g_ccBlocks[idx] = 0;
				g_slotRefV[idx] = s_work.voltage;
				CC_PROGRESS(idx) = 0;
			}
			else if(s_work.voltage >= g_slotRefV[idx] + CC_NO_PROGRESS_RISE)
			{
				CC_PROGRESS(idx) = 1;    /* 真实锂电: CC中有充电进展, 标记后延长 */
				g_slotRefV[idx] = s_work.voltage;     /* 重置起点, 下一轮窗口冻结新基准 */
			}
			else if(CC_PROGRESS(idx) != 0)
			{
				g_slotRefV[idx] = s_work.voltage;     /* 已确认进展: 继续CC充电, 不循环不ERROR */
			}
			else if(CC_RETRY_TST(idx))
			{
				s_work.state = CHG_ERROR;          /* 碳性/异常: 无进展二次超时锁死 */
			}
			else
			{
				CC_RETRY_SET(idx);
				s_work.state = CHG_DETECT;         /* 首次超时无进展: 回DETECT重判 */
				g_slotRefV[idx] = 0;
				CC_PROGRESS(idx) = 0;
			}
			break;
		}
		}
		else
		{
			/* 跌落检测增加slot_v<g_slotRefV守卫: 无进展窗口期g_slotRefV冻结为
			   起点v0, 电压上升时slot_v>v0, 直接相减会unsigned回绕→误判跌落死循环 */
			if((s_work.voltage < g_slotRefV[idx] && g_slotRefV[idx] - s_work.voltage > PEAK_DROP_THRESH) || s_work.voltage < 2000U)
			{
				g_detectLowCnt[idx]++;
				if(g_detectLowCnt[idx] < 2)
					break;
				g_detectLowCnt[idx] = 0;
				s_work.state = CHG_DETECT;
				s_work.chargeTimer = 0;
				break;
			}
			else
			{
				g_detectLowCnt[idx] = 0;
			}

			/* CC无进展检测: 真实恒压锂电CC阶段电压应持续上升至≥ADC_V_FULL进CV.
			   若60s内上升<30ADC(维持中压高位不升不降)→误判LI_ION的碳性/
			   异常电池→ERROR, 而非等CC_MAX_BLOCKS(最长3h)超时.
			   窗口期内g_slotRefV冻结为起点基准v0; g_stableCnt做进展闩锁
			   (1=已上升≥30ADC), 进入CC时已复位 */
			if(s_work.chargeTimer <= CC_NO_PROGRESS_TICKS)
			{
				if(s_work.voltage >= g_slotRefV[idx] + CC_NO_PROGRESS_RISE)
					CC_PROGRESS(idx) = 1;
			}
			if(s_work.chargeTimer > CC_NO_PROGRESS_TICKS && CC_PROGRESS(idx) == 0)
			{
				s_work.state = CHG_ERROR;
				s_work.chargeTimer = 0;
				break;
			}
		}

		/* 线性锂电池(LC9203DC): 内部电芯VBAT>充电器VOUT时,
		   芯片不激活充电模式→不拉电流→BxAD电容充电至VCC→伪OPEN
		   恒压锂电池(LC9203DB)有charger IC始终拉载, 不会出现此现象
		   LI_ION+OPEN在CC阶段出现 → 电芯已充满 → 跳转FULL
		   线性锂电池排除: 100μs放电不足导致伪OPEN与真实电压交替出现,
		   伪OPEN不代表充满, 走正常CC→CV→FULL路径 */
		if(s_work.voltage >= ADC_V_OPEN && s_work.type == BAT_TYPE_LI_ION)
		{
			s_work.state = CHG_FULL;
			s_work.chargeTimer = 0;
			break;
		}

		/* 过压保护: 线性锂电池排除(无charger IC, ADC读数因电容残留不可靠,
		   伪OPEN(4091)不是真过压, 且已排除伪OPEN→FULL和PEAK_DROP,
		   真过压由电池自身保护板处理) */
		if(s_work.voltage >= ADC_V_OVER && s_work.type != BAT_TYPE_LINEAR_LI)
		{
			g_ovCnt[idx]++;
			if(g_ovCnt[idx] >= OV_DEBOUNCE_CNT)
			{
				s_work.state = CHG_ERROR;
				break;
			}
		}
		else
		{
			g_ovCnt[idx] = 0;
			/* LINEAR_LI伪OPEN不触发CC→CV: 等真实电压≥FULL时转换 */
			if(s_work.voltage >= ADC_V_FULL && !(s_work.voltage >= ADC_V_OPEN && s_work.type == BAT_TYPE_LINEAR_LI))
			{
				s_work.state = CHG_CV_CHARGE;
				s_work.chargeTimer = 0;
				g_ccBlocks[idx] = 0;    /* 复位CV上爬检测起点锁与CC_RETRY_FLAG */
			}
		}
		break;

	case CHG_CV_CHARGE:
		/* charge_ticks已在开头按10ms节拍累加 */
		if(s_work.chargeTimer > TIME_CV_HOLD)
			s_work.state = CHG_FULL;

		/* 伪OPEN过滤(必须在g_slotRefV更新之前):
		   线性锂电池(LC9203DC)无charger IC, MOSFET导通时BxAD电容充电至VCC,
		   100μs放电不足→伪OPEN(4091)≠真实电压, 跳过本次ADC读数,
		   保持当前充电状态(cvTimer已累加)继续下一周期, 防止:
		   (a) g_slotRefV被4091污染→后续PEAK_DROP假落差
		   (b) 拔出检测误判→IMP_CHECK↔CV↔IDLE死循环 */
		if(s_work.voltage >= ADC_V_OPEN && s_work.type == BAT_TYPE_LINEAR_LI)
			break;

		/* CV上爬检测: 正常满电锂电进CV后电压被PI钳位不再爬升;
		   碳性/碱性/镍氢误判进CV时过充电压持续爬升→窗口(60s)内相对起点
		   上升>CV_NO_PROGRESS_RISE且连续CV_NO_PROGRESS_CNT帧→ERROR,
		   而非等TIME_CV_HOLD(10分钟)后误判FULL.
		   g_ccBlocks复用为"起点已锁定"标志, g_stableCnt复用为上爬消抖计数.
		   仅对恒压锂(LI_ION)启用: 线性锂无charger IC, CV阶段电芯电压
		   自然缓慢爬升, 此检测会误杀. OPEN由下方拔出/满电逻辑处理. */
		if(s_work.voltage < ADC_V_OPEN && s_work.chargeTimer <= CV_NO_PROGRESS_TICKS && s_work.type == BAT_TYPE_LI_ION)
		{
			if(CV_BASE_LOCK(idx) == 0)
			{
				g_slotRefV[idx] = s_work.voltage;
				CV_BASE_LOCK(idx) = 1;
			}
			else if(s_work.voltage >= g_slotRefV[idx] + CV_NO_PROGRESS_RISE)
			{
				if(++CV_CLIMB_CNT(idx) >= CV_NO_PROGRESS_CNT)
				{
					CV_CLIMB_CNT(idx) = 0;
					s_work.state = CHG_ERROR;
					s_work.chargeTimer = 0;
					break;
				}
			}
			else
			{
				CV_CLIMB_CNT(idx) = 0;
			}
		}

		/* 电池拔出检测: 2帧消抖
		   仅LI_ION(有charger IC)的伪OPEN代表电芯已满→FULL
		   LINEAR_LI无charger IC, ADC读数可能接近OPEN(3990)但仍在真实电压
		   范围(3900~4050), 直接判IDLE会导致反复重判. 对LINEAR_LI仅当
		   slot_v≥4050(真正空槽)才判拔出, 3990~4050保持CV继续观察. */
		if(s_work.voltage >= ADC_V_OPEN)
		{
			if(s_work.type == BAT_TYPE_LI_ION)
			{
				g_detectLowCnt[idx]++;
				if(g_detectLowCnt[idx] < 2)
					break;
				g_detectLowCnt[idx] = 0;
				s_work.state = CHG_FULL;
				s_work.chargeTimer = 0;
				break;
			}
			if(s_work.type == BAT_TYPE_LINEAR_LI)
			{
				break;    /* 线性锂CV高压伪OPEN: 保持CV, 由CT超时进FULL
				              (CV电压可达~4086仍真实在位, 不设上限). */
			}
			g_detectLowCnt[idx]++;
			if(g_detectLowCnt[idx] < 2)
				break;
			g_detectLowCnt[idx] = 0;
			s_work.type = BAT_TYPE_UNKNOWN;
			s_work.state = CHG_IDLE;
			s_work.chargeTimer = 0;
			break;
		}

		/* 低压崩溃/跌落重判:
		   - LINEAR_LI(碳性误判进入CV): slot_v<2000持续33tick→ERROR(电化学崩溃)
		   - LI_ION(碳性/接触不良): 峰值跌落>500, 2帧→回DETECT重判
		   LINEAR_LI排除跌落判据: 100μs放电不足使slot_v交替读真实值/伪OPEN,
		   峰值与真实值的大落差是ADC假象非真跌落 */
		if(s_work.type == BAT_TYPE_LINEAR_LI)
		{
			if(s_work.voltage < 2000U)
			{
				g_detectLowCnt[idx]++;
				if(g_detectLowCnt[idx] >= 33U)
				{
					g_detectLowCnt[idx] = 0;
					s_work.state = CHG_ERROR;
					s_work.chargeTimer = 0;
					break;
				}
			}
			else
			{
				g_detectLowCnt[idx] = 0;
			}
		}
		else
		{
			if(s_work.voltage < g_slotRefV[idx] && g_slotRefV[idx] - s_work.voltage > PEAK_DROP_THRESH)
			{
				g_detectLowCnt[idx]++;
				if(g_detectLowCnt[idx] >= 2)
				{
					g_detectLowCnt[idx] = 0;
					CV_CRASH_CNT(idx)++;    /* CV崩溃计数: 累计≥CV_DROP_LOOP_MAX后
					                        再进CV直接ERROR(碳性/碱性崩溃循环闭环) */
					s_work.type = BAT_TYPE_UNKNOWN;
					s_work.state = CHG_DETECT;
					s_work.chargeTimer = 0;
					break;
				}
			}
			else
			{
				g_detectLowCnt[idx] = 0;
			}
		}

		/* 过压保护: CV阶段电压不应超过ADC_V_OVER.
		   仅对恒压锂(LI_ION)启用: 线性锂无charger IC, CV阶段电芯电压自然
		   爬升且ADC读数因VCC波动偏高, 过压保护会误杀; 恒压锂有charger IC
		   钳位, 正常不会超3850. */
		if(s_work.voltage >= ADC_V_OVER && s_work.type == BAT_TYPE_LI_ION)
		{
			g_ovCnt[idx]++;
			if(g_ovCnt[idx] >= OV_DEBOUNCE_CNT)
			{
				s_work.state = CHG_ERROR;
				break;
			}
		}
		else
		{
			g_ovCnt[idx] = 0;
		}
		break;

	case CHG_FULL:
		/* 电池拔出检测: 连续N帧slot_v≥OPEN退出FULL回IDLE
		   LINEAR_LI(无charger IC)100μs放电不足→伪OPEN(4091)与真实值
		   交替出现, 2帧消抖容易被伪OPEN连续命中→误判拔出→IDLE→DETECT
		   →FULL死循环. 改用50帧(0.5秒)消抖:
		   真拔出时V持续≈VCC, 50帧全部≥OPEN→可靠判定;
		   电池在位时真实V(<OPEN)出现在else→g_detectLowCnt复位→永不误判 */
		if(s_work.voltage >= ADC_V_OPEN)
		{
			g_detectLowCnt[idx]++;
			if(g_detectLowCnt[idx] >= (s_work.type == BAT_TYPE_LINEAR_LI ? 50 : 2))
			{
				g_detectLowCnt[idx] = 0;
				s_work.state = CHG_IDLE;
				s_work.chargeTimer = 0;
			}
			break;
		}
		/* 仅锂电池可补电: NIMH/DRY/AMBIGUOUS/UNKNOWN在DETECT阶段即被拦截,
		   只有LI_ION/LINEAR_LI能经CC→CV到达FULL
		   电压显著回落(slot_v<2800≈1.45V)说明电池已放电, 满电电容稳定后slot_v≈2900~3500不触发 */
		if(s_work.voltage < 2800U)
		{
			g_detectLowCnt[idx]++;
			if(g_detectLowCnt[idx] < 2)
				break;
			g_detectLowCnt[idx] = 0;
			s_work.state = CHG_CC_CHARGE;
			s_work.chargeTimer = 0;
			g_ovCnt[idx] = 0;
			g_ccBlocks[idx] = 0;   /* 补电新CC周期复位块计数/崩溃计数与CC_RETRY_FLAG */
			g_slotRefV[idx] = s_work.voltage;
			g_stableCnt[idx] = 0;      /* 复位CC无进展检测闩锁 */
		}
		else
		{
			g_detectLowCnt[idx] = 0;
		}
		break;

	case CHG_ERROR:
		/* 恢复路径: ADC回OPEN → 电池被拔出 → IDLE, 需连续2帧确认 */
		if(s_work.voltage >= ADC_V_OPEN)
		{
			g_detectLowCnt[idx]++;
			if(g_detectLowCnt[idx] < 2)
				break;
			g_detectLowCnt[idx] = 0;
			s_work.type = BAT_TYPE_UNKNOWN;
			s_work.state = CHG_IDLE;
			s_work.chargeTimer = 0;
			g_ccBlocks[idx] = 0;    /* 电池拔出, 复位CC_RETRY_FLAG */
			break;
		}
		/* NiMH/干电池 重判路径:
		   电压>2700ADC(NiMH单节上限~2775, 留余量):
		   NiMH物理上无法维持此高压 → 可能是恒压锂电charger IC待机误判
		   → 回DETECT重判, 需连续2帧确认
		   ⚠g_highVFlag门禁: 仅DETECT中确认过V>2900稳定(真锂电池)
		   才允许重判. 干电池MOSFET关断后ADC电容充电至VCC(实测3780),
		   V>2700是电容虚高非真电池电压, 无g_highVFlag标记直接锁定ERROR
		   电压≤2700: 确认真NiMH/干电池, 永久锁定 */
		if(s_work.type == BAT_TYPE_NIMH || s_work.type == BAT_TYPE_DRY)
		{
			if(s_work.voltage > 2700U && (g_highVFlag & ((unsigned int)1 << idx)))
			{
				g_detectLowCnt[idx]++;
				if(g_detectLowCnt[idx] < 2)
					break;
				g_detectLowCnt[idx] = 0;
				s_work.state = CHG_DETECT;
				s_work.chargeTimer = 0;
			}
			else
			{
				g_detectLowCnt[idx] = 0;
			}
			break;
		}
		/* LI_ION/LINEAR_LI/UNKNOWN: 有电压 → 回DETECT重判, 需连续2帧确认 */
		if(s_work.voltage > ADC_V_ACTIVATE)
		{
			g_detectLowCnt[idx]++;
			if(g_detectLowCnt[idx] < 2)
				break;
			g_detectLowCnt[idx] = 0;
			s_work.state = CHG_DETECT;
			s_work.chargeTimer = 0;
		}
		else
		{
			g_detectLowCnt[idx] = 0;
		}
		break;

	default:
		s_work.state = CHG_IDLE;
		break;
	}

	/* --- 检测令牌单点判定: 处于检测链即持有, 离开检测链即释放 ---
	   置于switch之后, 是本函数的唯一令牌读写点, 覆盖全部入链/出链路径:
	     [入链] IDLE→DETECT(首次) + CC无进展超时/PEAK_DROP回落/CV崩溃/
	            ERROR重判(这4条直接把状态置回CHG_DETECT, 不经过IDLE)
	     [出链] 归类到ACTIVATE/CC/CV/FULL/ERROR或回IDLE, 含default/异常分支
	   空闲时才占用(不抢占他人令牌), 避免多槽同时跑检测链;
	   本槽非持令牌时进入检测链的处理在DETECT/IMP入口处等待(见amb_check),
	   出链即释放, 单点读写避免多申请点漏覆盖. --- */
	if(s_work.state == CHG_DETECT || s_work.state == CHG_IMP_CHECK ||
	   s_work.state == CHG_IMP_DIODE_TEST)
	{
		if(g_detectOwner == 0xFF)
			g_detectOwner = idx;
	}
	else
	{
		if(g_detectOwner == idx)
			g_detectOwner = 0xFF;
	}

	/* 等待者生命周期: 本槽已不在检测链(获令牌跑完或退出)即撤销等待登记,
	   使后续IDLE空槽恢复可入链, 避免等待者僵死阻塞检测 */
	if(g_detectWaiter == idx &&
	   !(s_work.state == CHG_DETECT || s_work.state == CHG_IMP_CHECK ||
	     s_work.state == CHG_IMP_DIODE_TEST))
		g_detectWaiter = 0xFF;

	g_slot[idx] = s_work;   /* 回写本槽工作副本(索引访问仅此1次, 6字节整体赋值) */

	/* --- 依据结果控制本槽 MOSFET(受温度/VCC保护门控) ---
	   充电闸门: 只要检测链被某槽占用(g_detectOwner≠0xFF), 充电槽(ACTIVATE/
	   PRECHARGE/CC/CV)一律关闭MOSFET, 暂停充电电流, 避免其污染正在进行的检测;
	   检测槽(DETECT/IMP_CHECK)仅自身持令牌时导通; 无槽在检测链时恢复正常充电.
	   由此检测与充电在时间上互斥, 消除"边充边测"造成的采样串扰. --- */
	if((s_work.state == CHG_ACTIVATE || s_work.state == CHG_PRECHARGE ||
	    s_work.state == CHG_CC_CHARGE || s_work.state == CHG_CV_CHARGE) &&
	   g_detectOwner != 0xFF)
	{
		SLOT_CHARGE_OFF(idx);
	}
	else if((s_work.state == CHG_ACTIVATE || s_work.state == CHG_PRECHARGE ||
	         s_work.state == CHG_CC_CHARGE || s_work.state == CHG_CV_CHARGE ||
	         ((s_work.state == CHG_IMP_CHECK || s_work.state == CHG_DETECT) && g_detectOwner == idx)) &&
	        !g_tempProtect && !g_vccProtect)
	{
		SLOT_CHARGE_ON(idx);
	}
	else
	{
		SLOT_CHARGE_OFF(idx);
	}
}

/*========================================================================
  函数: CCCV_Control
  功能: CC-CV恒流恒压PWM占空比自动调节
  说明: 每轮槽位处理结束后调用一次, 含温度/VCC低压保护
  控制策略:
    CC恒流阶段(ACTIVATE/PRECHARGE/CC_CHARGE):
      - 使用固定占空比(CC_DUTY_TARGET=25/32≈78%)
      - 软启动: 每次+CC_DUTY_RAMP_STEP逐步增加到目标值
      - 无电流检测硬件, 通过固定占空比近似恒流效果
    CV恒压阶段(CV_CHARGE):
      - PI闭环控制, 以ADC_V_FULL为目标电压
      - 根据电压误差动态调节PWM占空比
      - 带积分限幅防饱和
  输出: 更新全局变量 g_pwmDuty (0~PWM_MAX),
        ISR中根据g_pwmDuty自动生成PWM波形
========================================================================*/
void CCCV_Control(void)
{
	unsigned char i;
	unsigned char hasCharging = 0;
	unsigned int  maxV = 0;
	unsigned char cvCount = 0;
	unsigned char ccCount = 0;
	unsigned char preCount = 0;

	/* VCC低压保护滞回: 电源过载VCC跌落→停止充电, 恢复后解除 */
	if(g_vccProtect)
	{
		if(g_vcc_mv >= VCC_UVLO_RESUME)
			g_vccProtect = 0;
	}
	else
	{
		if(g_vcc_mv < VCC_UVLO_STOP)
			g_vccProtect = 1;
	}

	/* 温度/VCC保护: 关闭PWM输出 */
	if(g_tempProtect || g_vccProtect)
	{
		g_pwmDuty = 0;
		g_cvIntegral = 0;
		return;
	}

	/* 遍历12槽位, 找出充电状态和最高电压 */
	for(i = 0; i < BATTERY_SLOTS; i++)
	{
		unsigned char s = S_STATE(i);

		if(s == CHG_ACTIVATE || s == CHG_PRECHARGE ||
		   s == CHG_CC_CHARGE || s == CHG_CV_CHARGE ||
		   s == CHG_IMP_CHECK)
		{
			hasCharging = 1;
			{
				unsigned int vt = S_VOLT(i);
				if(vt > maxV) maxV = vt;
			}
			if(s == CHG_CV_CHARGE)
				cvCount++;
			if(s == CHG_CC_CHARGE)
				ccCount++;
			if(s == CHG_PRECHARGE || s == CHG_ACTIVATE)
				preCount++;
		}
	}

	/* 无充电槽位: 关闭PWM, 复位积分 */
	if(!hasCharging)
	{
		g_pwmDuty = 0;
		g_cvIntegral = 0;
		return;
	}

	/* --- CC/PRECHARGE阶段: 固定占空比 + 软启动 ---
	   CC_CHARGE槽存在时: 使用CC_DUTY_TARGET(25/32=78%)
	   仅ACTIVATE/PRECHARGE时: 使用PRE_DUTY_TARGET(8/32=25%)小电流预充
	   避免78%PWM对高内阻深度过放电池造成充电异常 */
	if(cvCount == 0)
	{
		unsigned char duty_target, duty_initial;

		if(ccCount > 0)
		{
			/* 有CC槽位: 使用标准CC占空比 */
			duty_target  = CC_DUTY_TARGET;
			duty_initial = CC_DUTY_INITIAL;
		}
		else if(preCount > 0)
		{
			/* 仅预充/激活: 使用低占空比小电流激活 */
			duty_target  = PRE_DUTY_TARGET;
			duty_initial = PRE_DUTY_INITIAL;
		}
		else
		{
			/* 仅IMP_CHECK槽位: 78%占空比脉冲, 跳过硬启动
			   碳性电池可能短暂进入CC, PEAK_DROP会在数秒内纠正 */
			g_pwmDuty = CC_DUTY_TARGET;
			return;
		}

		if(g_pwmDuty < duty_initial)
		{
			/* 首次充电: 软启动 */
			g_pwmDuty += CC_DUTY_RAMP_STEP;
			if(g_pwmDuty > duty_initial)
				g_pwmDuty = duty_initial;
		}
		else if(g_pwmDuty > duty_target)
		{
			/* 从高占空比回退: 直接使用目标占空比 */
			g_pwmDuty = duty_target;
		}
		else
		{
			/* 维持目标占空比 */
			g_pwmDuty = duty_target;
		}
		return;
	}

	/* --- CV恒压阶段: PI闭环控制 ---
	   目标: 维持电池电压在ADC_V_FULL(1.52V)
	   error > 0: 电压偏低, 需加大占空比
	   error < 0: 电压偏高, 需减小占空比
	   积分项累加稳态误差, 消除静差 */
	{
		int error = (int)(ADC_V_FULL) - (int)(maxV);

		/* 积分累加(带限幅防积分饱和) */
		g_cvIntegral += error * CV_KI;
		if(g_cvIntegral > CV_KI_LIMIT)
			g_cvIntegral = CV_KI_LIMIT;
		else if(g_cvIntegral < -CV_KI_LIMIT)
			g_cvIntegral = -CV_KI_LIMIT;

		/* PI计算: duty = current_duty + (Kp*error + Ki*integral)/8 */
		int adjust = (error * CV_KP + g_cvIntegral) / 8;
		int duty = (int)g_pwmDuty + adjust;

		/* 占空比限幅 */
		if(duty > PWM_MAX) duty = PWM_MAX;
		if(duty < 0)      duty = 0;

		g_pwmDuty = (unsigned char)duty;
	}
}