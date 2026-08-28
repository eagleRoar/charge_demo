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

/* --- DIODE_TEST 判据命名布尔量: 判定链逐级清单化, 每个宏=一条判据(语义见各调用处) ---
   宏参数全称约定:
     pre_volt  = 脉冲前电压 IMP_PRE_VOLT(g_impData): 电池开路电压估计
     slot_volt = 当前槽电压读数 slot_v
     vcc_norm  = 归一化VCC VCC_NORM(g_vcc_mv): 空槽/钳位上限参考
   判据概览: RISE_FAST=早期快速爬升锂电 / HI_RECOVER=高压回落线性锂 / NIMH_FAKE=NiMH上拉虚高
             LOW_CLAMP=低压钳位兜底 / TOP_CLAMPED=钳位到顶 / HI_CLIMB=高压段真实爬升
             MID_GROW=中压爬升或平直持稳 / LOW_PRECHG=低压锂电预充 */
#define DIO_RISE_FAST(pre_volt, slot_volt)   ((pre_volt) >= DIODE_PRE_MIN && (slot_volt) > (pre_volt) + DIODE_RISE_THRESH)
#define DIO_HI_RECOVER(pre_volt, slot_volt)  ((pre_volt) > 3000U && (slot_volt) > ADC_V_NIMH_MAX && (slot_volt) < (pre_volt))
#define DIO_NIMH_FAKE(pre_volt, slot_volt)   ((slot_volt) > ADC_V_NIMH_MAX && (pre_volt) < DIODE_PRE_MIN)
#define DIO_LOW_CLAMP(pre_volt, slot_volt)   ((slot_volt) > 2100U && (pre_volt) <= 2300U && (slot_volt) + 160U >= (pre_volt) && \
                                              (slot_volt) <= (pre_volt) + DIODE_CLAMP_MARGIN)
#define DIO_TOP_CLAMPED(slot_volt, vcc_norm) ((slot_volt) + DIODE_TOP_MARGIN >= (vcc_norm))
#define DIO_HI_CLIMB(pre_volt, slot_volt)    ((pre_volt) > ADC_V_NEAR_OPEN && (pre_volt) < ADC_V_OPEN && \
                                              (slot_volt) >= (pre_volt) + DIODE_CLIMB_MIN)
#define DIO_MID_GROW(pre_volt, slot_volt)    ((slot_volt) > DIODE_MID_MIN && (slot_volt) < ADC_V_OPEN && \
                                              (pre_volt) >= DIODE_PRE_MIN && (pre_volt) < 3500U && \
                                              (((pre_volt) < DIODE_MID_FLAT_MAX && (slot_volt) + 150U >= (pre_volt)) || \
                                               (slot_volt) >= (pre_volt) + DIODE_CLIMB_MIN))
#define DIO_LOW_PRECHG(pre_volt, slot_volt)  ((slot_volt) > (pre_volt) + DIODE_CLAMP_MARGIN && (slot_volt) < ADC_V_OPEN && \
                                              (pre_volt) > DIODE_PRE_DRY_MAX && (pre_volt) < 3500U)

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
unsigned char g_fullRefillCnt[12];      /* FULL→CC补电循环计数: 碳性误判循环锁死用, 拔出/新检测复位 */
unsigned char g_impCheckSlot = 0xFF;    /* IMP_CHECK串行锁: 0xFF=空闲, 其他=持有锁的槽号
                                           同一时间只允许一个槽做IMP_CHECK,
                                           避免NiMH拉垮VCC导致其他槽误判 */
unsigned char g_stableCnt[12];           /* DETECT高压稳定循环专用计数器 */
unsigned int g_capFlag;                  /* 电容虚高标记位掩码: bit[i]=1表示槽i需扩展等待电容放电 */
unsigned int g_impData;                  /* IMP_CHECK共享数据: 低12位脉冲前电压+高4位VCC编码(100mV步进)
                                           因IMP_CHECK串行化, 同一时间仅一个槽使用 */
unsigned char g_diodeTrace[4];         /* DIODE_TEST slot_v轨迹: 4点(charge_ticks=7,14,21,28),
                                         每点1字节存相对pre偏移/4+128(±127*4 ADC, clamp),
                                         单槽共享缓冲(IMP_CHECK串行锁保证同时仅一槽在DIODE_TEST),
                                         仅ISR写数组供主循环打印, 不阻塞UART */
unsigned char g_diodeTraceCnt;         /* DIODE_TEST slot_v轨迹采样点数, 主循环打印后清零 */
unsigned char g_diodeTraceSlot;        /* 轨迹归属槽号(打印时匹配) */
unsigned int g_highVFlag;                /* DETECT高压确认标记: bit[i]=1表示槽i在高压稳定循环中
                                           连续≥DETECT_STABLE_TICKS维持V>2900, 用于IMP_CHECK
                                           区分恒压锂电池charger IC断开(false low)和真干电池 */

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

volatile BatterySlot_t g_slot[12];

/* 槽位字段读写辅助宏 */
#define SLOT_RD_ALL(idx, state, type, slot_v, charge_ticks)  do { \
	state = g_slot[(idx)].state; type = g_slot[(idx)].type; \
	slot_v  = g_slot[(idx)].voltage; charge_ticks = g_slot[(idx)].chargeTimer; \
} while(0)

#define SLOT_WR_ALL(idx, state, type, slot_v, charge_ticks)  do { \
	g_slot[(idx)].state = state; g_slot[(idx)].type = type; \
	g_slot[(idx)].voltage = slot_v; g_slot[(idx)].chargeTimer = charge_ticks; \
} while(0)

/* 锂电池DETECT后统一充电路由: 计算bat_mv→按电压档位跳转ACTIVATE/PRECHARGE/CV/CC */
#define DETECT_LI_ROUTE(idx, slot_v, state, charge_ticks)  do { \
	unsigned long vx_mv = (unsigned long)(slot_v) * VCC_REF_MV / 4096UL; \
	unsigned long bat_mv_long = ALPHA_NUM * vx_mv + BETA_NUM * VCC_REF_MV; \
	unsigned int  bat_mv = (unsigned int)((bat_mv_long + CAL_DEN/2UL) / CAL_DEN); \
	if(bat_mv <= BAT_MV_ACTIVATE) { \
		state = CHG_ACTIVATE; \
	} else if(bat_mv < BAT_MV_PRECHARGE) { \
		state = CHG_PRECHARGE; \
	} else if(bat_mv >= BAT_MV_FULL) { \
		if(g_ccBlocks[idx] >= CV_DROP_LOOP_MAX) { \
			state = CHG_ERROR; \
		} else { \
			state = CHG_CV_CHARGE; \
			g_slotRefV[idx] = slot_v; \
			g_ccBlocks[idx] = 0; \
			g_stableCnt[idx] = 0; \
		} \
	} else { \
		state = CHG_CC_CHARGE; \
		g_ccBlocks[idx] &= CC_RETRY_FLAG; /* 仅清块计数, 保留CC_RETRY_FLAG(使CC超时
		                                     重判能累计到再次超时ERROR, 防无限循环) */ \
		g_slotRefV[idx] = slot_v; \
		g_stableCnt[idx] = 0; \
	} \
	charge_ticks = 0; \
	g_ovCnt[idx] = 0; \
	g_detectLowCnt[idx] = 0; \
} while(0)

/* IMP_CHECK阶段VCC解码: 从g_impData高4位还原脉冲前VCC(mV), 误差≤50mV */
#define IMP_VCC_DECODE(data)  (((((data) >> 12) & 0x0FU) + 38U) * 100U)

/* IMP_CHECK阶段脉冲前电压解码: 从g_impData低12位还原脉冲前归一化电压(pre) */
#define IMP_PRE_VOLT(data)  ((data) & 0x0FFFU)

/* IMP_CHECK阶段g_impData打包: 低12位=脉冲前电压pre_v, 高4位=脉冲前VCC编码(100mV步进) */
#define IMP_PACK(pre_v, vcc_mv)  ((pre_v) | ((unsigned int)((((vcc_mv) + 50U) / 100U) - 38U) << 12))

/* VCC归一化满量程: 该VCC下空槽/爬升至顶读数的归一化ADC(=VCC*4096/5000) */
#define VCC_NORM(vcc_mv)  ((unsigned int)(((unsigned long)(vcc_mv) * 4096UL) / VCC_REF_MV))

void Slot_Charge_Ctrl(unsigned char idx)
{
	unsigned char state, type;                   /* state: 充电状态, type: 电池类型 */
	unsigned int  slot_v, charge_ticks;                   /* slot_v: ADC电压(归一化), charge_ticks: 充电计时器 */
	unsigned int  charge_ticks_prev;                  /* charge_ticks累加前值(跨越检测: 精确tick点charge_ticks==N) */
	unsigned char dly;                     /* 稳定延时循环计数 */

	SLOT_RD_ALL(idx, state, type, slot_v, charge_ticks);

	/* --- charge_ticks按ISR 10ms硬件节拍累加(与打印/主循环轮速解耦).
	   累加粒度可能>1tick, 因此所有"charge_ticks==N"精确判断
	   必须用 charge_ticks_prev/charge_ticks 跨越检测, 不能直接比较. --- */
	charge_ticks_prev = charge_ticks;
	charge_ticks += (unsigned int)g_elapsedTicks;

	/* --- 单槽同步采样: 关MOSFET → 稳定延时 → 采样并归一化 --- */
	SLOT_CHARGE_OFF(idx);
	if(state == CHG_DETECT || state == CHG_IMP_CHECK || state == CHG_IMP_DIODE_TEST)
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
		if(!(type == BAT_TYPE_LINEAR_LI &&
		     (state == CHG_CC_CHARGE || state == CHG_CV_CHARGE) &&
		     newv >= ADC_V_OPEN))
		{
			slot_v = newv;
		}
	}

	switch(state)
	{
	case CHG_IDLE:
		/* 空槽轮询停留: 空槽(slot_v≥OPEN)停留IDLE_POLL_TICKS后再转DETECT,
		   避免空槽在DETECT→IMP_CHECK→IDLE间循环导致红灯常亮.
		   插入电池(slot_v<OPEN)立即转DETECT. */
		if(slot_v >= ADC_V_OPEN)
		{
			if(charge_ticks < IDLE_POLL_TICKS)
				break;              /* charge_ticks已在开头按10ms节拍累加 */
		}
		charge_ticks = 0;
		state = CHG_DETECT;
		g_ccBlocks[idx] = 0;      /* 新检测周期复位块计数/CV崩溃计数与CC_RETRY_FLAG */
		g_fullRefillCnt[idx] = 0; /* 新检测周期复位补电循环计数 */
		g_highVFlag &= ~((unsigned int)1 << idx);
		/* 记录IDLE→DETECT初始电压, 用于charge_ticks<TIME_DETECT_WAIT期间
		   检测碳性/空槽电容被串扰充电(电压大幅上升>1000ADC) */
		if(slot_v < ADC_V_OPEN)
			g_slotRefV[idx] = slot_v;
		else
			g_slotRefV[idx] = 0;
		break;

	case CHG_DETECT:
		/* charge_ticks已在开头按10ms节拍累加 */

		/* 首次进入DETECT(跨越charge_ticks=1): 重置本槽专用计数器, 清除可能残留的电容标记 */
		if(charge_ticks_prev < 1U && charge_ticks >= 1U)
		{
			g_stableCnt[idx] = 0;
			g_capFlag &= ~((unsigned int)1 << idx); /* 通过idx清除可能残留的电容标记 */
		}

		if(charge_ticks < TIME_DETECT_WAIT)
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
		if(charge_ticks_prev < TIME_DETECT_WAIT && charge_ticks >= TIME_DETECT_WAIT)
		{
			g_slotRefV[idx] = slot_v;
			if(slot_v > ADC_V_NIMH_MAX)
				g_capFlag |= (unsigned int)1 << idx;  /* 标记: 初始电压>2900(可能是电容放电) */
			break;
		}
		if(slot_v > ADC_V_NIMH_MAX && slot_v < ADC_V_OPEN)
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
			if(!(g_capFlag & ((unsigned int)1 << idx)) && type != BAT_TYPE_AMBIGUOUS &&
			   slot_v <= ADC_V_NEAR_OPEN)
			{
				charge_ticks = 0;
				g_slotRefV[idx] = 0;
				g_stableCnt[idx] = 0;
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

			if(g_stableCnt[idx] >= DETECT_STABLE_TICKS)
			{
				/* 高压稳定确认: 记录此槽在DETECT中V>2900持续稳定,
				   IMP_CHECK时若判DRY但此标记存在→charger IC断开假象→走LI_ION
				   真干电池(碳性/碱性)无法在高压区间连续20tick保持稳定 */
				g_highVFlag |= (unsigned int)1 << idx;
				/* ── 阶段[2]: 扩展等待电容放电 ── */
				if(slot_v <= ADC_V_NIMH_MAX)
				{
					/* 电压降至2900以下 → 电容放电确认, 清除所有高压标记 */
					g_capFlag &= ~((unsigned int)1 << idx);
					g_stableCnt[idx] = 0;
					g_highVFlag &= ~((unsigned int)1 << idx);
				}
				else if(charge_ticks < TIME_DETECT_WAIT + TIME_DETECT_SETTLE)
				{
					/* 高压锂电提前放行: g_highVFlag已确认V>2900稳定,
			   碳性电池电容放电至≤2900实测R6P约3秒, 保守等
			   25tick(≈2s)后仍>2900→真锂电, 直接IMP_CHECK.
			   碳性稳态分压降不下, 多等无益; 异常误入由DIODE_TEST
			   判据及CC/CV崩溃锁定兜底 */
				if((g_highVFlag & ((unsigned int)1 << idx)) &&
				   charge_ticks >= TIME_DETECT_WAIT + 25U)
					goto amb_shortcut;
					/* 继续等待, 更新基准跟踪当前值 */
					g_slotRefV[idx] = slot_v;
					break;
				}
					else
				{
				amb_shortcut:
					/* 超时仍>2900: 走AMBIGUOUS→IMP_CHECK用VCC跌落做最后区分:
					有charger IC(VCC跌落>200mV)→LI_ION, 无→LINEAR_LI
					必须goto amb_check, 否则后续Detect_BatteryType(slot_v)会
					将type覆盖为LI_ION(>2900), 导致IMP_CHECK被跳过 */
					g_capFlag &= ~((unsigned int)1 << idx);
					g_stableCnt[idx] = 0;
					type = BAT_TYPE_AMBIGUOUS;
					goto amb_check;
				}
			}
			else
			{
				/* ── 阶段[1]: 稳定循环 ──
				   超时兜底: 读数持续波动导致g_stableCnt长期凑不满20时,
				   达到总等待上限强制走AMBIGUOUS→IMP_CHECK, 防止永久卡DETECT */
				if(charge_ticks >= TIME_DETECT_WAIT + TIME_DETECT_SETTLE)
					goto amb_shortcut;
				if(slot_v + DETECT_SETTLE_DROP < v_init)
				{
					/* 电压显著下跌: 仍在放电, 更新基准并重置稳定计数 */
					g_slotRefV[idx] = slot_v;
					g_stableCnt[idx] = 0;
				}
				else
				{
					/* 电压稳定(或小幅上升): 更新基准跟踪当前值, 递增稳定计数 */
					g_slotRefV[idx] = slot_v;
					g_stableCnt[idx]++;
				}
				if(g_stableCnt[idx] < DETECT_STABLE_TICKS)
					break;                       /* 尚未稳定: 继续等待 */
				/* 稳定确认: cap标记→保留计数器进入阶段[2]扩展等待 */
				if(g_capFlag & ((unsigned int)1 << idx))
					break;                       /* 下tick进入扩展等待 */
				g_stableCnt[idx] = 0;            /* 无cap标记: 直接放行 */
			}
		}
		else if(charge_ticks < TIME_DETECT_WAIT + TIME_DETECT_SETTLE && slot_v < ADC_V_OPEN)
		{
			unsigned int v_ref = g_slotRefV[idx];
			if(v_ref < ADC_V_OPEN && slot_v + DETECT_SETTLE_DROP < v_ref)
			{
				g_slotRefV[idx] = slot_v;
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
			type = BAT_TYPE_AMBIGUOUS;                  /* 强制AMBIGUOUS→IMP_CHECK */
		}
		else
		{
			type = Detect_BatteryType(slot_v);
			/* 空槽OPEN超时直接进IMP_CHECK: 强制type=AMBIGUOUS复用amb_check的
			   消抖+串行锁+VCC重采样, 否则type每轮被Detect_BatteryType覆盖回
			   UNKNOWN, 永远进不了IMP_CHECK. 空槽脉冲前后slot_v均≥OPEN→回IDLE,
			   恒压/线性锂负载下slot_v跌至真实值→正常充电. */
			if(type == BAT_TYPE_UNKNOWN && slot_v >= ADC_V_OPEN &&
			   charge_ticks >= TIME_DETECT_WAIT + TIME_DETECT_SETTLE)
				type = BAT_TYPE_AMBIGUOUS;
		}

		/* 消抖: 高内阻电池ADC读数可能跳动到极低值,
		   连续N次低值才判定为UNKNOWN, 避免单次噪点误触发ERROR */
		if(slot_v < ADC_V_SHORT)
		{
			g_detectLowCnt[idx]++;
			if(g_detectLowCnt[idx] < DETECT_LOW_DEBOUNCE)
				break;
		}
		/* 仅对UNKNOWN/NIMH/DRY重置计数器, AMBIGUOUS和LI_ION各自维护消抖计数 */
		else if(type != BAT_TYPE_AMBIGUOUS && type != BAT_TYPE_LI_ION && type != BAT_TYPE_LINEAR_LI)
		{
			g_detectLowCnt[idx] = 0;
		}

	amb_check:
		if(type == BAT_TYPE_AMBIGUOUS)
		{
			/* AMBIGUOUS电压段(1.20V~1.45V): 短脉冲方向检测区分
			   恒压/线性锂电池: 接PWM后芯片切充电模式→电压上升
			   NiMH: 极低内阻等效短路→VCC塌陷(>300mV)
			   干电池: 高内阻限流→电压不升, VCC不塌
			   消抖: 单帧VCC污染可能让空槽(4093)误读为~2243, 需连续2帧确认 */
			g_detectLowCnt[idx]++;
			if(g_detectLowCnt[idx] < 2)
				break;
			/* 串行化: 同一时间只允许一个槽做IMP_CHECK,
			   避免NiMH极低内阻拉垮整个VCC导致其他槽同时误判 */
			if(g_impCheckSlot != 0xFF && g_impCheckSlot != idx)
				break;                /* 等待其他槽完成IMP_CHECK */
			g_impCheckSlot = idx;
			/* 重新采样VCC: 防止g_vcc_mv滞后于其他槽充电导致的VCC跌落,
			   避免后续IMP_CHECK中误判(实测: 其他槽充电时VCC从5000降至4717,
			   若用旧VCC编码5000会误判>200mV跌落→误判LI_ION) */
			Get_Vcc();
			/* VCC打包至g_impData: 低12位=脉冲前电压slot_v(0~4095), 高4位=脉冲前VCC编码
			   VCC编码 = (g_vcc_mv+50)/100 - 38, 四舍五入到100mV, 覆盖3800~5100mV范围
			   IMP_CHECK串行锁保证单槽访问, 无需数组 */
			g_impData = IMP_PACK(slot_v, g_vcc_mv);
			state = CHG_IMP_CHECK;
			charge_ticks = 0;
			g_detectLowCnt[idx] = 0;
		}
		if(type == BAT_TYPE_LI_ION || type == BAT_TYPE_LINEAR_LI)
		{
			/* LI_ION/LINEAR_LI: 连续2帧确认, 防止碳性/碱性电池ADC尖峰越过NIMH_HIGH误判 */
			g_detectLowCnt[idx]++;
			if(g_detectLowCnt[idx] < 2)
				break;
			DETECT_LI_ROUTE(idx, slot_v, state, charge_ticks);
		}
		else if(type == BAT_TYPE_UNKNOWN)
		{
			/* UNKNOWN: 分辨空槽(OPEN)和不可识别电池(SHORT/异常)
			   注: slot_v≥OPEN且等待超时的空槽已由上方强制AMBIGUOUS接管,
			   此分支的OPEN等待仅在超时前短暂出现(电容放电中) */
			if(slot_v >= ADC_V_OPEN)
				break;                /* 继续等待电压下降 */
			state = CHG_ERROR;           /* 电压异常或无法识别 → 报错 */
			g_detectLowCnt[idx] = 0;
		}
		else if(type == BAT_TYPE_NIMH || type == BAT_TYPE_DRY)
		{
			state = CHG_ERROR;
			g_detectLowCnt[idx] = 0;
		}
		break;

	case CHG_IMP_CHECK:
		/* charge_ticks已在开头按10ms节拍累加; IMP_PULSE_TICKS=5(50ms),
		   主循环一轮(elapsed≥1)即达到脉冲窗口 */
		if(charge_ticks < IMP_PULSE_TICKS)
			break;

		{
			/* 实时VCC采样: IMP_CHECK期间MOSFET已导通~80ms */
			Get_Vcc();

			/* ── 电池拔出检测（最高优先级） ──
			   脉冲前、后电压均≥OPEN → 确实空槽/已被拔出
			   高压碱性满电电压~3967~4005, 与OPEN接近但<4050,
			   仅当双值均≥4050才判空槽, 避免高压电池被误拔入IDLE死循环. */
			if(slot_v >= 4050U && IMP_PRE_VOLT(g_impData) >= 4050U)
			{
				type = BAT_TYPE_UNKNOWN;
				state = CHG_IDLE;
				g_impCheckSlot = 0xFF;
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
				   (slot_v + DIODE_TOP_MARGIN >= vcc_norm_now))
				{
					type = BAT_TYPE_UNKNOWN;
					state = CHG_IDLE;
					g_impCheckSlot = 0xFF;
					g_highVFlag &= ~((unsigned int)1 << idx);
					break;
				}
			}

			/* ── NiMH VCC塌陷检测 ──
			   VCC跌落>300mV 且 脉冲后电池端被拉到OPEN
			   恒压锂电charger IC也会拉低VCC, 但电池端不会飙升到OPEN, 避免误判 */
			if(IMP_VCC_DECODE(g_impData) > g_vcc_mv + 300U && slot_v >= ADC_V_OPEN)
			{
				type = BAT_TYPE_NIMH;
				state = CHG_ERROR;
				g_impCheckSlot = 0xFF;
				g_highVFlag &= ~((unsigned int)1 << idx);
				break;
			}

			/* ── 恒压锂电: VCC跌落>200mV ──
			   高压/中压碳性(pre≥3100)在IMP脉冲时VCC波动易超200mV被误判为
			   恒压锂, 故仅对脉冲前<3100的电池启用此判据,
			   中压段统一走DIODE_TEST用爬升区分. */
			if(IMP_VCC_DECODE(g_impData) > g_vcc_mv + 200U &&
			   IMP_PRE_VOLT(g_impData) < 3100U)
				goto imp_li_ion;

			/* ── 碳性/碱性干电池: 脉冲后电压比脉冲前低>1000ADC ──
			   g_highVFlag保护: DETECT已确认高压稳定的真锂电跳过此判据,
			   其脉冲前读数是电容虚高(实测脉冲后回落>1000), 并非电池真值;
			   碳性/碱性无法在DETECT连续稳定, flag不置位仍正常拒充 */
			if(!(g_highVFlag & ((unsigned int)1 << idx)) &&
			   (IMP_PRE_VOLT(g_impData) > slot_v) &&
			   (IMP_PRE_VOLT(g_impData) - slot_v) > 1000U)
			{
				type = BAT_TYPE_DRY;
				state = CHG_ERROR;
				g_impCheckSlot = 0xFF;
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
				goto imp_diode_test_entry;
			}

			/* ── 脉冲后≥OPEN → 进DIODE_TEST进一步确认 ──
			   可能是线性锂/恒压锂/镍氢, DIODE_TEST用爬升区分Li与DRY/NiMH */
			if(slot_v >= ADC_V_OPEN)
				goto imp_diode_test_entry;

		imp_diode_test_entry:
			/* ── 进入DIODE_TEST ──
			   保持IMP_CHECK串行锁不释放, 防止g_impData基准被其它槽改写 */
			state = CHG_IMP_DIODE_TEST;
			charge_ticks = 0;
			g_diodeTraceCnt = 0;        /* 新一轮检测开始, 清slot_v轨迹(单槽共享缓冲) */
			g_diodeTraceSlot = (unsigned char)idx;
			g_highVFlag &= ~((unsigned int)1 << idx);
		}
		break;

	/* ── Li-ion路由(共用代码, goto跳转节省RAM) ── */
	imp_li_ion:
		g_impCheckSlot = 0xFF;
		g_highVFlag &= ~((unsigned int)1 << idx);
		type = BAT_TYPE_LI_ION;
		DETECT_LI_ROUTE(idx, slot_v, state, charge_ticks);
		break;

	/* ── 线性锂电池路由(无charger IC, VCC不塌) ──
	   检测: (1)脉冲后≥OPEN(体二极管阻断) (2)DIODE_TEST爬升>DIODE_RISE_THRESH
	   用脉冲前电压(g_impData低12位)做DETECT_LI_ROUTE:
	   线性锂无charger IC拉载, IMP_CHECK PWM脉冲后电容充电至VCC,
	   体二极管被阻断无法放电→slot_v读伪OPEN(4091), 若用slot_v做路由会误入CV
	   且g_slotRefV被设为4091, 后续PEAK_DROP必然触发
	   脉冲前电压来自DETECT(MOSFET导通→电容跟踪Vbat→读数准确) */
	imp_linear_li:
		g_impCheckSlot = 0xFF;
		g_highVFlag &= ~((unsigned int)1 << idx);
		/* 碳性/碱性循环锁死: 该槽已完成一次LINEAR_LI CC无进展超时(16s)仍未
		   充电 → 判定高内阻干电池(DETECT电容虚高/CC不升压), 锁死拒充,
		   杜绝 DET→DIO→CC→ERR 无限循环. 清highVFlag防止ERROR重判回DETECT;
		   真实线性锂CC中电压必上升, 不会触发16s无进展超时, 不受此锁影响. */
		if(g_ccBlocks[idx] & CC_RETRY_FLAG)
		{
			type = BAT_TYPE_DRY;
			state = CHG_ERROR;
			break;
		}
		type = BAT_TYPE_LINEAR_LI;
		DETECT_LI_ROUTE(idx, (unsigned int)IMP_PRE_VOLT(g_impData), state, charge_ticks);
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
			if(charge_ticks < ptTick)
				break;                      /* 未到下一采样点(7/14/21/28) */
			{
				signed int diff = (signed int)slot_v - (signed int)IMP_PRE_VOLT(g_impData);
				diff >>= 2;                 /* /4 */
				if(diff > 127) diff = 127;
				if(diff < -128) diff = -128;
				g_diodeTrace[g_diodeTraceCnt++] = (unsigned char)(diff + 128);
			}
		}
		{
			/* 电池拔出检查: 线性锂误插后拔出→电压回落至OPEN */
			if(slot_v >= ADC_V_OPEN && IMP_PRE_VOLT(g_impData) < ADC_V_OPEN)
			{
				/* 预脉冲非OPEN但当前OPEN: 电容正在充电中, 不是真拔出 */
			}

			/* 早期快速爬升 → 锂电: 体二极管阻断, 电容被100K持续充电(>900ADC).
			   pre≥DIODE_PRE_MIN隔离低压碳性(自由浮空爬升无界, 非锂电特征) */
			if(DIO_RISE_FAST(IMP_PRE_VOLT(g_impData), slot_v))
			{
				/* IMP_CHECK记录的VCC跌落区分: 跌落>150mV→恒压锂, 否则→线性锂 */
				if(IMP_VCC_DECODE(g_impData) > g_vcc_mv + 150U)
					goto imp_li_ion;
				else
					goto imp_linear_li;
			}

			/* 高压锂电回落 → 线性锂: 低内阻把电容电压拉回电池本体(slot_v<pre)
			   但仍>NIMH_MAX; 碱性/碳性内阻大, 电容被100K继续拉向VCC不回落 */
			if(DIO_HI_RECOVER(IMP_PRE_VOLT(g_impData), slot_v))
				goto imp_linear_li;

			/* NiMH/干电池上拉虚高 → DRY: pre<DIODE_PRE_MIN但slot_v>NIMH_MAX,
			   是100K上拉充出的虚假高电平(实测锂电pre≥2271, 碳性pre≤1936) */
			if(DIO_NIMH_FAKE(IMP_PRE_VOLT(g_impData), slot_v))
			{
				type = BAT_TYPE_DRY;
				state = CHG_ERROR;
				g_impCheckSlot = 0xFF;
				g_highVFlag &= ~((unsigned int)1 << idx);
				g_detectLowCnt[idx] = 0;
				break;
			}

			/* 低压锂电钳位兜底(满20tick) → 线性锂: 电压稳定>2100且与pre基本持平
			   (下跌<160, 爬升≤钳位150), 体二极管把电容钳在电池电压附近.
			   pre≤2300避免碳性中压(slot_v≈pre)误触发; 碱性/镍氢DIODE_TEST
			   电压显著下跌(<2100)天然不满足 */
			if(charge_ticks >= 20U && DIO_LOW_CLAMP(IMP_PRE_VOLT(g_impData), slot_v))
				goto imp_linear_li;

			/* 超时终判(240tick无快速爬升): 逐级放行锂电, 否则判DRY拒充.
			   高压/中压锂电爬升不足900ADC(电容/体二极管特性)需此兜底;
			   碳性中压即使被放行也由CC 16s无进展锁死ERROR, 真实锂电不受影响 */
			if(charge_ticks >= DIODE_TEST_TICKS)
			{
				unsigned int pre = (unsigned int)IMP_PRE_VOLT(g_impData);
				unsigned int vcc_norm = VCC_NORM(g_vcc_mv);
				/* 钳位到顶: 线性锂体二极管阻断, 电容被100K充至≈当前VCC_norm;
				   干电池被钳位在电池电压远低于VCC_norm. 恒压锂slot_v被电池
				   钳位不爬升, 由VCC跌落判据区分 */
				if(DIO_TOP_CLAMPED(slot_v, vcc_norm))
				{
					if(IMP_VCC_DECODE(g_impData) > g_vcc_mv + 150U)
						goto imp_li_ion;
					goto imp_linear_li;
				}
				/* 高压段须真实爬升(pre>3500且sv≥pre+50): 挡空槽轨偏置平直(差≤6)
				   与碱性(pre≈3499平直). 用VCC跌落区分恒压/线性锂 */
				if(DIO_HI_CLIMB(pre, slot_v))
				{
					if(IMP_VCC_DECODE(g_impData) > g_vcc_mv + 150U)
						goto imp_li_ion;              /* 恒压锂 */
					goto imp_linear_li;               /* 线性锂(爬升) */
				}
				/* 中压放行: pre∈[2100,3500)且平直持稳(pre<3000, 实测≤2849)
				   或真实爬升(≥pre+50); slot_v>DIODE_MID_MIN隔离镍氢(2300~2500) */
				if(DIO_MID_GROW(pre, slot_v))
					goto imp_linear_li;
				/* 低压锂电预充: 深度过放锂电(pre≈2000~2500)爬升超钳位但未达
				   中压下界; 碳性pre≤DIODE_PRE_DRY_MAX实测上沿隔离 */
				if(DIO_LOW_PRECHG(pre, slot_v))
					goto imp_linear_li;
				type = BAT_TYPE_DRY;
				state = CHG_ERROR;
				g_impCheckSlot = 0xFF;
				g_highVFlag &= ~((unsigned int)1 << idx);
				g_detectLowCnt[idx] = 0;
			}
	}
	break;

	case CHG_ACTIVATE:
		/* charge_ticks已在开头按10ms节拍累加 */
		if(charge_ticks > TIME_ACTIVATE_MAX)
		{
			state = CHG_ERROR;
			break;
		}
		if(slot_v > ADC_V_ACTIVATE)
		{
			state = CHG_PRECHARGE;
			charge_ticks = 0;
			break;
		}
		if(slot_v >= ADC_V_OVER)
		{
			state = CHG_ERROR;
			break;
		}
		break;

	case CHG_PRECHARGE:
		/* charge_ticks已在开头按10ms节拍累加 */
		if(charge_ticks > TIME_PRECHARGE_MAX)
		{
			state = CHG_ERROR;
			break;
		}
		if(slot_v >= ADC_V_OVER)
		{
			g_ovCnt[idx]++;
			if(g_ovCnt[idx] >= OV_DEBOUNCE_CNT)
			{
				state = CHG_ERROR;
				break;
			}
		}
		else
		{
			g_ovCnt[idx] = 0;
		}
		if(slot_v >= ADC_V_PRE_MAX)
		{
			state = CHG_CC_CHARGE;
			charge_ticks = 0;
			g_ccBlocks[idx] = 0;       /* 复位块计数与CC_RETRY_FLAG */
			g_ovCnt[idx] = 0;
			g_slotRefV[idx] = slot_v;
			g_stableCnt[idx] = 0;      /* 复位CC无进展检测闩锁 */
		}
		break;

	case CHG_CC_CHARGE:
		/* charge_ticks已在开头按10ms节拍累加 */
		if(charge_ticks >= CC_BLOCK_TICKS)
		{
			charge_ticks -= CC_BLOCK_TICKS;
			g_ccBlocks[idx]++;
		}
		/* 块计数检查屏蔽CC_RETRY_FLAG(bit7): 标志保留时g_ccBlocks=0x80,
		   若直接与CC_MAX_BLOCKS比较会误判"已充180分钟"→二次入CC瞬间
		   ERROR→重判死循环. */
		if((g_ccBlocks[idx] & 0x7FU) >= CC_MAX_BLOCKS)
		{
			state = CHG_ERROR;
			break;
		}

		/* 伪OPEN过滤: 线性锂电池无charger IC, BxAD电容充电至VCC后放电不足→伪OPEN(4091),
		   伪OPEN不更新g_slotRefV(防4091污染), 不触发CC→CV(等真实电压达标),
		   继续PEAK_DROP/OV/CC_MAX_BLOCKS等安全检查, CC→CV由真实电压触发 */
		if(slot_v >= ADC_V_OPEN && type == BAT_TYPE_LINEAR_LI)
		{
			/* g_slotRefV不更新(跳过4091污染), 继续后续检查 */
		}
		else if(charge_ticks <= CC_NO_PROGRESS_TICKS)
		{
			/* CC无进展检测窗口期内冻结g_slotRefV为CC起点基准v0,
			   不做峰值追踪, 供下方进展判断与PEAK_DROP跌落基准使用
			   (LI_ION与LINEAR_LI均适用). 窗口结束后恢复峰值追踪. */
		}
		else
		{
			if(slot_v > g_slotRefV[idx]) g_slotRefV[idx] = slot_v;
		}

		/* 电压跌落/低压崩溃重判: 分类处理, 避免共用g_detectLowCnt互相清零
		   - LINEAR_LI(碳性误判): slot_v<2000持续33tick→ERROR
		   - LI_ION(碳性/接触不良): 峰值跌落>500或slot_v<2000, 连续2帧→回DETECT重判
		     真实恒压锂电CC中电压只升不跌, 不会长期<2000 */
		if(type == BAT_TYPE_LINEAR_LI)
		{
			if(slot_v < 2000U)
			{
				g_detectLowCnt[idx]++;
				if(g_detectLowCnt[idx] >= 33U)
				{
					g_detectLowCnt[idx] = 0;
					state = CHG_ERROR;
					charge_ticks = 0;
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
		if(charge_ticks >= CC_LINEAR_LI_TICKS)   /* 16s未进CV→回DETECT重判/ERROR锁死 */
		{
			charge_ticks = 0;
			if(slot_v >= 2800U && slot_v < ADC_V_OPEN)
			{
				state = CHG_CV_CHARGE;
				g_ccBlocks[idx] = 0;
				g_slotRefV[idx] = slot_v;
				g_stableCnt[idx] = 0;
			}
			else if(slot_v >= g_slotRefV[idx] + CC_NO_PROGRESS_RISE)
			{
				g_stableCnt[idx] = 1;    /* 真实锂电: CC中有充电进展, 标记后延长 */
				g_slotRefV[idx] = slot_v;     /* 重置起点, 下一轮窗口冻结新基准 */
			}
			else if(g_stableCnt[idx] != 0)
			{
				g_slotRefV[idx] = slot_v;     /* 已确认进展: 继续CC充电, 不循环不ERROR */
			}
			else if(g_ccBlocks[idx] & CC_RETRY_FLAG)
			{
				state = CHG_ERROR;          /* 碳性/异常: 无进展二次超时锁死 */
			}
			else
			{
				g_ccBlocks[idx] |= CC_RETRY_FLAG;
				state = CHG_DETECT;         /* 首次超时无进展: 回DETECT重判 */
				g_slotRefV[idx] = 0;
				g_stableCnt[idx] = 0;
			}
			break;
		}
		}
		else
		{
			/* 跌落检测增加slot_v<g_slotRefV守卫: 无进展窗口期g_slotRefV冻结为
			   起点v0, 电压上升时slot_v>v0, 直接相减会unsigned回绕→误判跌落死循环 */
			if((slot_v < g_slotRefV[idx] && g_slotRefV[idx] - slot_v > PEAK_DROP_THRESH) || slot_v < 2000U)
			{
				g_detectLowCnt[idx]++;
				if(g_detectLowCnt[idx] < 2)
					break;
				g_detectLowCnt[idx] = 0;
				state = CHG_DETECT;
				charge_ticks = 0;
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
			if(charge_ticks <= CC_NO_PROGRESS_TICKS)
			{
				if(slot_v >= g_slotRefV[idx] + CC_NO_PROGRESS_RISE)
					g_stableCnt[idx] = 1;
			}
			if(charge_ticks > CC_NO_PROGRESS_TICKS && g_stableCnt[idx] == 0)
			{
				state = CHG_ERROR;
				charge_ticks = 0;
				break;
			}
		}

		/* 线性锂电池(LC9203DC): 内部电芯VBAT>充电器VOUT时,
		   芯片不激活充电模式→不拉电流→BxAD电容充电至VCC→伪OPEN
		   恒压锂电池(LC9203DB)有charger IC始终拉载, 不会出现此现象
		   LI_ION+OPEN在CC阶段出现 → 电芯已充满 → 跳转FULL
		   线性锂电池排除: 100μs放电不足导致伪OPEN与真实电压交替出现,
		   伪OPEN不代表充满, 走正常CC→CV→FULL路径 */
		if(slot_v >= ADC_V_OPEN && type == BAT_TYPE_LI_ION)
		{
			state = CHG_FULL;
			charge_ticks = 0;
			break;
		}

		/* 过压保护: 线性锂电池排除(无charger IC, ADC读数因电容残留不可靠,
		   伪OPEN(4091)不是真过压, 且已排除伪OPEN→FULL和PEAK_DROP,
		   真过压由电池自身保护板处理) */
		if(slot_v >= ADC_V_OVER && type != BAT_TYPE_LINEAR_LI)
		{
			g_ovCnt[idx]++;
			if(g_ovCnt[idx] >= OV_DEBOUNCE_CNT)
			{
				state = CHG_ERROR;
				break;
			}
		}
		else
		{
			g_ovCnt[idx] = 0;
			/* LINEAR_LI伪OPEN不触发CC→CV: 等真实电压≥FULL时转换 */
			if(slot_v >= ADC_V_FULL && !(slot_v >= ADC_V_OPEN && type == BAT_TYPE_LINEAR_LI))
			{
				state = CHG_CV_CHARGE;
				charge_ticks = 0;
				g_ccBlocks[idx] = 0;    /* 复位CV上爬检测起点锁与CC_RETRY_FLAG */
			}
		}
		break;

	case CHG_CV_CHARGE:
		/* charge_ticks已在开头按10ms节拍累加 */
		if(charge_ticks > TIME_CV_HOLD)
			state = CHG_FULL;

		/* 伪OPEN过滤(必须在g_slotRefV更新之前):
		   线性锂电池(LC9203DC)无charger IC, MOSFET导通时BxAD电容充电至VCC,
		   100μs放电不足→伪OPEN(4091)≠真实电压, 跳过本次ADC读数,
		   保持当前充电状态(cvTimer已累加)继续下一周期, 防止:
		   (a) g_slotRefV被4091污染→后续PEAK_DROP假落差
		   (b) 拔出检测误判→IMP_CHECK↔CV↔IDLE死循环 */
		if(slot_v >= ADC_V_OPEN && type == BAT_TYPE_LINEAR_LI)
			break;

		/* CV上爬检测: 正常满电锂电进CV后电压被PI钳位不再爬升;
		   碳性/碱性/镍氢误判进CV时过充电压持续爬升→窗口(60s)内相对起点
		   上升>CV_NO_PROGRESS_RISE且连续CV_NO_PROGRESS_CNT帧→ERROR,
		   而非等TIME_CV_HOLD(10分钟)后误判FULL.
		   g_ccBlocks复用为"起点已锁定"标志, g_stableCnt复用为上爬消抖计数.
		   仅对恒压锂(LI_ION)启用: 线性锂无charger IC, CV阶段电芯电压
		   自然缓慢爬升, 此检测会误杀. OPEN由下方拔出/满电逻辑处理. */
		if(slot_v < ADC_V_OPEN && charge_ticks <= CV_NO_PROGRESS_TICKS && type == BAT_TYPE_LI_ION)
		{
			if(g_ccBlocks[idx] == 0)
			{
				g_slotRefV[idx] = slot_v;
				g_ccBlocks[idx] = 1;
			}
			else if(slot_v >= g_slotRefV[idx] + CV_NO_PROGRESS_RISE)
			{
				if(++g_stableCnt[idx] >= CV_NO_PROGRESS_CNT)
				{
					g_stableCnt[idx] = 0;
					state = CHG_ERROR;
					charge_ticks = 0;
					break;
				}
			}
			else
			{
				g_stableCnt[idx] = 0;
			}
		}

		/* 电池拔出检测: 2帧消抖
		   仅LI_ION(有charger IC)的伪OPEN代表电芯已满→FULL
		   LINEAR_LI无charger IC, ADC读数可能接近OPEN(3990)但仍在真实电压
		   范围(3900~4050), 直接判IDLE会导致反复重判. 对LINEAR_LI仅当
		   slot_v≥4050(真正空槽)才判拔出, 3990~4050保持CV继续观察. */
		if(slot_v >= ADC_V_OPEN)
		{
			if(type == BAT_TYPE_LI_ION)
			{
				g_detectLowCnt[idx]++;
				if(g_detectLowCnt[idx] < 2)
					break;
				g_detectLowCnt[idx] = 0;
				state = CHG_FULL;
				charge_ticks = 0;
				break;
			}
			if(type == BAT_TYPE_LINEAR_LI)
			{
				break;    /* 线性锂CV高压伪OPEN: 保持CV, 由CT超时进FULL
				              (CV电压可达~4086仍真实在位, 不设上限). */
			}
			g_detectLowCnt[idx]++;
			if(g_detectLowCnt[idx] < 2)
				break;
			g_detectLowCnt[idx] = 0;
			type = BAT_TYPE_UNKNOWN;
			state = CHG_IDLE;
			charge_ticks = 0;
			break;
		}

		/* 低压崩溃/跌落重判:
		   - LINEAR_LI(碳性误判进入CV): slot_v<2000持续33tick→ERROR(电化学崩溃)
		   - LI_ION(碳性/接触不良): 峰值跌落>500, 2帧→回DETECT重判
		   LINEAR_LI排除跌落判据: 100μs放电不足使slot_v交替读真实值/伪OPEN,
		   峰值与真实值的大落差是ADC假象非真跌落 */
		if(type == BAT_TYPE_LINEAR_LI)
		{
			if(slot_v < 2000U)
			{
				g_detectLowCnt[idx]++;
				if(g_detectLowCnt[idx] >= 33U)
				{
					g_detectLowCnt[idx] = 0;
					state = CHG_ERROR;
					charge_ticks = 0;
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
			if(slot_v < g_slotRefV[idx] && g_slotRefV[idx] - slot_v > PEAK_DROP_THRESH)
			{
				g_detectLowCnt[idx]++;
				if(g_detectLowCnt[idx] >= 2)
				{
					g_detectLowCnt[idx] = 0;
					g_ccBlocks[idx]++;    /* CV崩溃计数: 累计≥CV_DROP_LOOP_MAX后
					                        再进CV直接ERROR(碳性/碱性崩溃循环闭环) */
					type = BAT_TYPE_UNKNOWN;
					state = CHG_DETECT;
					charge_ticks = 0;
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
		if(slot_v >= ADC_V_OVER && type == BAT_TYPE_LI_ION)
		{
			g_ovCnt[idx]++;
			if(g_ovCnt[idx] >= OV_DEBOUNCE_CNT)
			{
				state = CHG_ERROR;
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
		if(slot_v >= ADC_V_OPEN)
		{
			g_detectLowCnt[idx]++;
			if(g_detectLowCnt[idx] >= (type == BAT_TYPE_LINEAR_LI ? 50 : 2))
			{
				g_detectLowCnt[idx] = 0;
				state = CHG_IDLE;
				charge_ticks = 0;
			}
			break;
		}
		/* 仅锂电池可补电: NIMH/DRY/AMBIGUOUS/UNKNOWN在DETECT阶段即被拦截,
		   只有LI_ION/LINEAR_LI能经CC→CV到达FULL
		   电压显著回落(slot_v<2800≈1.45V)说明电池已放电, 满电电容稳定后slot_v≈2900~3500不触发 */
		if(slot_v < 2800U)
		{
			g_detectLowCnt[idx]++;
			if(g_detectLowCnt[idx] < 2)
				break;
			g_detectLowCnt[idx] = 0;
			/* 补电循环限制: 满电后反复回落补电(碳性误判CC→CV→FULL循环特征)
			   累计超限→ERROR锁死, 杜绝无限循环. 真锂电满电OCV≈3100稳定不回落,
			   正常补电1次即充满, 不触发. 拔出/新检测周期复位计数. */
			if(++g_fullRefillCnt[idx] > FULL_REFILL_MAX)
			{
				state = CHG_ERROR;
				charge_ticks = 0;
				break;
			}
			state = CHG_CC_CHARGE;
			charge_ticks = 0;
			g_ovCnt[idx] = 0;
			g_ccBlocks[idx] = 0;   /* 补电新CC周期复位块计数/崩溃计数与CC_RETRY_FLAG */
			g_slotRefV[idx] = slot_v;
			g_stableCnt[idx] = 0;      /* 复位CC无进展检测闩锁 */
		}
		else
		{
			g_detectLowCnt[idx] = 0;
		}
		break;

	case CHG_ERROR:
		/* 恢复路径: ADC回OPEN → 电池被拔出 → IDLE, 需连续2帧确认 */
		if(slot_v >= ADC_V_OPEN)
		{
			g_detectLowCnt[idx]++;
			if(g_detectLowCnt[idx] < 2)
				break;
			g_detectLowCnt[idx] = 0;
			type = BAT_TYPE_UNKNOWN;
			state = CHG_IDLE;
			charge_ticks = 0;
			g_ccBlocks[idx] = 0;    /* 电池拔出, 复位CC_RETRY_FLAG */
			g_fullRefillCnt[idx] = 0; /* 电池拔出, 复位补电循环计数 */
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
		if(type == BAT_TYPE_NIMH || type == BAT_TYPE_DRY)
		{
			if(slot_v > 2700U && (g_highVFlag & ((unsigned int)1 << idx)))
			{
				g_detectLowCnt[idx]++;
				if(g_detectLowCnt[idx] < 2)
					break;
				g_detectLowCnt[idx] = 0;
				state = CHG_DETECT;
				charge_ticks = 0;
			}
			else
			{
				g_detectLowCnt[idx] = 0;
			}
			break;
		}
		/* LI_ION/LINEAR_LI/UNKNOWN: 有电压 → 回DETECT重判, 需连续2帧确认 */
		if(slot_v > ADC_V_ACTIVATE)
		{
			g_detectLowCnt[idx]++;
			if(g_detectLowCnt[idx] < 2)
				break;
			g_detectLowCnt[idx] = 0;
			state = CHG_DETECT;
			charge_ticks = 0;
		}
		else
		{
			g_detectLowCnt[idx] = 0;
		}
		break;

	default:
		state = CHG_IDLE;
		break;
	}

	SLOT_WR_ALL(idx, state, type, slot_v, charge_ticks);

	/* --- 依据结果控制本槽 MOSFET(受温度/VCC保护门控) --- */
	if((state == CHG_ACTIVATE || state == CHG_PRECHARGE ||
	    state == CHG_CC_CHARGE || state == CHG_CV_CHARGE ||
	    state == CHG_IMP_CHECK || state == CHG_DETECT) &&
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