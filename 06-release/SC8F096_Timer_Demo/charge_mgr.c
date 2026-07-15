/*-------------------------------------------
  L1211 12槽充电器 - 充电管理模块
-------------------------------------------*/
#include "config.h"

/* --- 本地常量(不依赖config.h的微调参数) --- */
#define DETECT_STABLE_TICKS      20    /* 高压稳定确认tick数: 20tick=200ms无显著下跌→真锂电 */

/*========================================================================
  全局变量
========================================================================*/
unsigned int g_temperature = 250;
unsigned char g_tempProtect = 0;
unsigned char g_vccProtect  = 0;         /* VCC低压保护标志: 1=VCC过低, 关闭充电 */
unsigned int g_slotRefV[BATTERY_SLOTS];  /* 槽位参考电压: DETECT存初始值/稳定基准, CC/CV存峰值 */
unsigned char g_ccBlocks[12];           /* CC阶段10分钟块计数(解决16bit chargeTimer溢出) */
unsigned char g_ovCnt[12];              /* 过压消抖计数器: 连续过压次数 */
unsigned char g_detectLowCnt[12];       /* 通用消抖计数器(短路消抖/AMBIGUOUS消抖/LI_ION消抖) */
unsigned char g_impCheckSlot = 0xFF;    /* IMP_CHECK串行锁: 0xFF=空闲, 其他=持有锁的槽号
                                           同一时间只允许一个槽做IMP_CHECK,
                                           避免NiMH拉垮VCC导致其他槽误判 */
unsigned char g_stableCnt[12];           /* DETECT高压稳定循环专用计数器 */
unsigned int g_capFlag;                  /* 电容虚高标记位掩码: bit[i]=1表示槽i需扩展等待电容放电 */
unsigned int g_impData;                  /* IMP_CHECK共享数据: 低12位脉冲前电压+高4位VCC编码(100mV步进)
                                           因IMP_CHECK串行化, 同一时间仅一个槽使用 */
unsigned int g_highVFlag;                /* DETECT高压确认标记: bit[i]=1表示槽i在高压稳定循环中
                                           连续≥DETECT_STABLE_TICKS维持V>2900, 用于IMP_CHECK
                                           区分恒压锂电池charger IC断开(false low)和真干电池 */

/* LED闪烁: 全局统一计数器, 所有ERROR槽共用(省35B RAM) */
unsigned char g_blinkTick = 0;

volatile bit g_detectLogFlag = 0;
volatile unsigned char g_detectLogSlot = 0;
volatile unsigned char g_detectLogType = 0;

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
	   用VCC跌落脉冲区分:
	   - VCC跌>300mV → NiMH(极低内阻拉垮VCC)
	   - VCC跌>200mV → LI_ION(charger IC拉载)
	   - VCC不塌+电压>2300 → LINEAR_LI(无charger IC)
	   - VCC不塌+电压≤2300 → DRY(干电池拒充)
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
#define SLOT_RD_ALL(idx, st, ty, v, ct)  do { \
	st = g_slot[(idx)].state; ty = g_slot[(idx)].type; \
	v  = g_slot[(idx)].voltage; ct = g_slot[(idx)].chargeTimer; \
} while(0)

#define SLOT_WR_ALL(idx, st, ty, v, ct)  do { \
	g_slot[(idx)].state = st; g_slot[(idx)].type = ty; \
	g_slot[(idx)].voltage = v; g_slot[(idx)].chargeTimer = ct; \
} while(0)

/* 锂电池DETECT后统一充电路由: 计算bat_mv→按电压档位跳转ACTIVATE/PRECHARGE/CV/CC */
#define DETECT_LI_ROUTE(idx, v, st, ct)  do { \
	unsigned long vx_mv = (unsigned long)(v) * (unsigned long)g_vcc_mv / 4096UL; \
	unsigned long bat_mv_long = ALPHA_NUM * vx_mv + BETA_NUM * (unsigned long)g_vcc_mv; \
	unsigned int  bat_mv = (unsigned int)((bat_mv_long + CAL_DEN/2UL) / CAL_DEN); \
	if(bat_mv <= BAT_MV_ACTIVATE) { \
		st = CHG_ACTIVATE; \
	} else if(bat_mv < BAT_MV_PRECHARGE) { \
		st = CHG_PRECHARGE; \
	} else if(bat_mv >= BAT_MV_FULL) { \
		st = CHG_CV_CHARGE; \
		g_slotRefV[idx] = v; \
	} else { \
		st = CHG_CC_CHARGE; \
		g_ccBlocks[idx] = 0; \
		g_slotRefV[idx] = v; \
	} \
	ct = 0; \
	g_ovCnt[idx] = 0; \
	g_detectLowCnt[idx] = 0; \
} while(0)

/* IMP_CHECK阶段VCC解码: 从g_impData高4位还原脉冲前VCC(mV), 误差≤50mV */
#define IMP_VCC_DECODE(data)  (((((data) >> 12) & 0x0FU) + 38U) * 100U)

void ChargeProcess_Slot(unsigned char idx)
{
	unsigned char st, ty;                   /* st: 充电状态, ty: 电池类型 */
	unsigned int  v, ct;                   /* v: ADC电压, ct: 充电计时器 */
	unsigned int  tick = 1;
	unsigned char old_st;                  /* 调试: 保存旧状态 */

	SLOT_RD_ALL(idx, st, ty, v, ct);
	old_st = st;                           /* 记录进入状态机前的状态 */

	switch(st)
	{
	case CHG_IDLE:
		ct = 0;
		st = CHG_DETECT;
		g_highVFlag &= ~((unsigned int)1 << idx);
		break;

	case CHG_DETECT:
		ct += tick;

		/* 首次进入DETECT(ct==1): 重置本槽专用计数器, 清除可能残留的电容标记 */
		if(ct == 1)
		{
			g_stableCnt[idx] = 0;
			g_capFlag &= ~((unsigned int)1 << idx); /* 通过idx清除可能残留的电容标记 */
		}

		if(ct < TIME_DETECT_WAIT)
			break;

		/* 高内阻电池(碳性/碱性)开槽放电稳定检测:
		   OPEN→DETECT时槽位电容充满近VCC电荷, 高内阻电池放电慢,
		   初始ADC读数偏高(碳性R6P实测: 3745→1972需约8秒)
		   ct=200时标记>2900, 稳定后若降至≤2900→电容放电→g_capFlag清除
		   高压区间(>2900): 连续稳定tick=真锂电池→放行;
		   否则延至≤2900直接判DRY或超时(碳性电容放电至2900约3秒) */
		if(ct == TIME_DETECT_WAIT)
		{
			g_slotRefV[idx] = v;
			if(v > ADC_V_NIMH_MAX)
				g_capFlag |= (unsigned int)1 << idx;  /* 标记: 初始电压>2900(可能是电容放电) */
			break;
		}
		if(v > ADC_V_NIMH_MAX && v < ADC_V_OPEN)
		{
			/* 门禁: 仅ct=TIME_DETECT_WAIT时电压已>2900(g_capFlag置位)
			   才进入高压稳定路径. 若初始电压≤2900(无cap标记)后电压
			   异常跳升>2900: 多槽IMP_CHECK排队等待期间其他槽充电噪声/
			   串扰导致ADC读值异常(碳性1960→3769), 重置DETECT重读.
			   接触改善导致电压真上升会在重置后ct=200时正确置cap标记
			   ty=AMBIGUOUS跳过: amb_shortcut清除g_capFlag后ty已标记
			   为AMBIGUOUS(确认高压稳定), 门禁不应重置ct→丢失进度 */
			if(!(g_capFlag & ((unsigned int)1 << idx)) && ty != BAT_TYPE_AMBIGUOUS)
			{
				ct = 0;
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
				if(v <= ADC_V_NIMH_MAX)
				{
					/* 电压降至2900以下 → 电容放电确认, 清除所有高压标记 */
					g_capFlag &= ~((unsigned int)1 << idx);
					g_stableCnt[idx] = 0;
					g_highVFlag &= ~((unsigned int)1 << idx);
				}
				else if(ct < TIME_DETECT_WAIT + TIME_DETECT_SETTLE)
				{
					/* 高压锂电提前放行: g_highVFlag已确认V>2900稳定,
					   碳性电池电容放电至≤2900仅需1~2秒(实测R6P:约3秒),
					   保守等2秒(200tick)后仍>2900→真锂电, 直接IMP_CHECK */
					if((g_highVFlag & ((unsigned int)1 << idx)) &&
					   ct >= TIME_DETECT_WAIT + 200U)
						goto amb_shortcut;
					/* 继续等待, 更新基准跟踪当前值 */
					g_slotRefV[idx] = v;
					break;
				}
					else
				{
				amb_shortcut:
					/* 超时仍>2900: 走AMBIGUOUS→IMP_CHECK用VCC跌落做最后区分:
					有charger IC(VCC跌落>200mV)→LI_ION, 无→LINEAR_LI
					必须goto amb_check, 否则后续Detect_BatteryType(v)会
					将ty覆盖为LI_ION(>2900), 导致IMP_CHECK被跳过 */
					g_capFlag &= ~((unsigned int)1 << idx);
					g_stableCnt[idx] = 0;
					ty = BAT_TYPE_AMBIGUOUS;
					goto amb_check;
				}
			}
			else
			{
				/* ── 阶段[1]: 稳定循环 ── */
				if(v + DETECT_SETTLE_DROP < v_init)
				{
					/* 电压显著下跌: 仍在放电, 更新基准并重置稳定计数 */
					g_slotRefV[idx] = v;
					g_stableCnt[idx] = 0;
				}
				else
				{
					/* 电压稳定(或小幅上升): 更新基准跟踪当前值, 递增稳定计数 */
					g_slotRefV[idx] = v;
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
		else if(ct < TIME_DETECT_WAIT + TIME_DETECT_SETTLE && v < ADC_V_OPEN)
		{
			unsigned int v_ref = g_slotRefV[idx];
			if(v_ref < ADC_V_OPEN && v + DETECT_SETTLE_DROP < v_ref)
			{
				g_slotRefV[idx] = v;
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
			ty = BAT_TYPE_AMBIGUOUS;                  /* 强制AMBIGUOUS→IMP_CHECK */
		}
		else
		{
			ty = Detect_BatteryType(v);
		}

		/* 消抖: 高内阻电池ADC读数可能跳动到极低值,
		   连续N次低值才判定为UNKNOWN, 避免单次噪点误触发ERROR */
		if(v < ADC_V_SHORT)
		{
			g_detectLowCnt[idx]++;
			if(g_detectLowCnt[idx] < DETECT_LOW_DEBOUNCE)
				break;
		}
		/* 仅对UNKNOWN/NIMH/DRY重置计数器, AMBIGUOUS和LI_ION各自维护消抖计数 */
		else if(ty != BAT_TYPE_AMBIGUOUS && ty != BAT_TYPE_LI_ION && ty != BAT_TYPE_LINEAR_LI)
		{
			g_detectLowCnt[idx] = 0;
		}

	amb_check:
		if(ty == BAT_TYPE_AMBIGUOUS)
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
			if(ADC_OK == ADC_Sample(ADC_CH_VREF, 0))
				g_vcc_mv = (unsigned int)(POWER_RATIO / adresult);
			/* VCC打包至g_impData: 低12位=脉冲前电压v(0~4095), 高4位=脉冲前VCC编码
			   VCC编码 = (g_vcc_mv+50)/100 - 38, 四舍五入到100mV, 覆盖3800~5100mV范围
			   IMP_CHECK串行锁保证单槽访问, 无需数组 */
			g_impData = v | ((unsigned int)(((g_vcc_mv + 50U) / 100U) - 38U) << 12);
			st = CHG_IMP_CHECK;
			ct = 0;
			g_detectLowCnt[idx] = 0;
		}
		if(ty == BAT_TYPE_LI_ION || ty == BAT_TYPE_LINEAR_LI)
		{
			/* LI_ION/LINEAR_LI: 连续2帧确认, 防止碳性/碱性电池ADC尖峰越过NIMH_HIGH误判 */
			g_detectLowCnt[idx]++;
			if(g_detectLowCnt[idx] < 2)
				break;
			DETECT_LI_ROUTE(idx, v, st, ct);
		}
		else if(ty == BAT_TYPE_UNKNOWN)
		{
			/* UNKNOWN: 分辨空槽(OPEN)和不可识别电池(SHORT/异常) */
			if(v >= ADC_V_OPEN)
			{
				/* 扩展稳定等待: 恒压锂电池等插入后B1AD电容需放电,
				   初始电压≥OPEN, 延长TIME_DETECT_SETTLE让电容放电到正常值 */
				if(ct < TIME_DETECT_WAIT + TIME_DETECT_SETTLE)
					break;                /* 继续等待电压下降 */
				/* 超时仍≥OPEN: 不能直接判IDLE(Linear Li 3.85V长期≥OPEN→死循环),
				   走AMBIGUOUS→IMP_CHECK用VCC跌落脉冲区分:
				   空槽IMP_CHECK时v仍≥OPEN→IDLE, 锂电池负载下v跌至真实值→LINEAR_LI */
				ty = BAT_TYPE_AMBIGUOUS;
				goto amb_check;
			}
			else
			{
				st = CHG_ERROR;           /* 电压异常或无法识别 → 报错 */
			}
			g_detectLowCnt[idx] = 0;
		}
		else if(ty == BAT_TYPE_NIMH || ty == BAT_TYPE_DRY)
		{
			st = CHG_ERROR;
			g_detectLowCnt[idx] = 0;
			g_detectLogSlot = idx;
			g_detectLogType = ty;
			g_detectLogFlag = 1;
		}
		break;

	case CHG_IMP_CHECK:
		ct += tick;
		if(ct < IMP_PULSE_TICKS)
			break;

		{
			/* 实时VCC采样: IMP_CHECK期间MOSFET已导通~80ms,
			   NiMH极低内阻会拉低VCC, 此处采样获取当前真实VCC
			   不声明局部变量, 用内联计算节省RAM */
			if(ADC_OK == ADC_Sample(ADC_CH_VREF, 0))
				g_vcc_mv = (unsigned int)(POWER_RATIO / adresult);

			/* ── NiMH VCC塌陷检测(优先级最高) ──
			   g_impData编码: 低12位=脉冲前电压v, 高4位=脉冲前VCC编码(100mV分辨率)
			   还原公式: (解码值+38)*100
			   NiMH极低内阻(0.02~0.1Ω)在78%PWM下等效短路, VCC跌落>300mV
			   碳性/碱性高内阻不会导致VCC塌陷, 杜绝误判 */
			if(IMP_VCC_DECODE(g_impData) > g_vcc_mv + 300U)
			{
				ty = BAT_TYPE_NIMH;
				st = CHG_ERROR;
				g_impCheckSlot = 0xFF;
				g_highVFlag &= ~((unsigned int)1 << idx);
				g_detectLogSlot = idx;
				g_detectLogType = BAT_TYPE_NIMH;
				g_detectLogFlag = 1;
				break;
			}

			/* ── 电池拔出检测 ──
			   脉冲前电压(g_impData低12位)已是OPEN且脉冲后也是OPEN → 确实空槽/被拔出
			   仅当脉冲前电压≥OPEN时才判拔出:
			   线性锂电池(无charger IC)在MOSFET导通时BxAD电容充电至VCC,
			   短暂关断后100μs电容放电不足, ADC读到伪OPEN, 但脉冲前电压远低于OPEN,
			   必须用脉冲前电压区分真拔出(脉冲前也是OPEN)和伪OPEN(脉冲前有电池) */
			if(v >= ADC_V_OPEN && (g_impData & 0x0FFFU) >= ADC_V_OPEN)
			{
				ty = BAT_TYPE_UNKNOWN;
				st = CHG_IDLE;
				g_impCheckSlot = 0xFF;
				g_highVFlag &= ~((unsigned int)1 << idx);
				break;
			}

			/* ── VCC跌落>200mV → Li-ion(充电管理芯片拉载) ──
			   恒压锂电池内部TP4056类charger IC在78%PWM下启动充电,
			   拉载电流导致VCC跌落200~300mV(远小于NiMH的>300mV)
			   碳性/碱性无charger IC, 不会拉载VCC
			   VCC分辨率100mV, 200mV阈值有足够噪声裕量 */
			if(IMP_VCC_DECODE(g_impData) > g_vcc_mv + 200U)
				goto imp_li_ion;

			/* ── 高压区间(VCC不塌 → NiMH物理不可达) → 线性锂电池 ──
			   仅用脉冲前电压判断(NiMH上限~2775≈1.45V, 2300≈1.25V留有裕量)
			   VCC无跌落=无charger IC拉载=线性锂电池(区别于恒压锂电>200mV VCC跌落)
			   ⚠不检查脉冲后v: 碳性去极化可产生200+真实电压跳升(实测2016→2623),
			   若用脉冲后v会被碳性去极化误判 */
			if((g_impData & 0x0FFFU) > 2300U)
				goto imp_linear_li;

			/* ── VCC不塌 + 低压 → 干电池(碳性/碱性) ──
			   不依赖电压上升判断(碳性去极化会产生200+真实上升),
			   纯凭VCC sag区分: 无sag=高内阻=DRY
			   注: 线性锂电池在此区间与碱性电特性高度相似
			   (均无charger IC, VCC不塌, 电压稳定),
			   当前硬件(无电流检测)暂无法可靠区分,
			   保守判为DRY拒充, 避免碱性误充 */

			/* 高压回溯检查: 若DETECT阶段V>2900稳定≥20tick(g_highVFlag置位),
			   说明电池真实电压可达锂电水平, 当前IMP_CHECK读低压是charger IC
			   在IMP_CHECK等待期间断开输出导致的假象. 真干电池物理电压上限
			   ~1.65V≈ADC3150, 无法在高压区间连续20tick保持稳定 */
			if(g_highVFlag & ((unsigned int)1 << idx))
			{
				g_highVFlag &= ~((unsigned int)1 << idx);
				goto imp_li_ion;
			}

			ty = BAT_TYPE_DRY;
			st = CHG_ERROR;
			g_impCheckSlot = 0xFF;
			g_highVFlag &= ~((unsigned int)1 << idx);
			g_detectLowCnt[idx] = 0;
			g_detectLogSlot = idx;
			g_detectLogType = BAT_TYPE_DRY;
			g_detectLogFlag = 1;
		}
		break;

		/* ── Li-ion路由(共用代码, goto跳转节省RAM) ── */
		imp_li_ion:
			g_impCheckSlot = 0xFF;
			g_highVFlag &= ~((unsigned int)1 << idx);
			ty = BAT_TYPE_LI_ION;
			DETECT_LI_ROUTE(idx, v, st, ct);
			break;

		/* ── 线性锂电池路由(无charger IC, VCC不塌但电压>2300) ──
		   用脉冲前电压(g_impData低12位)做DETECT_LI_ROUTE:
		   线性锂无charger IC拉载, MOSFET导通后BxAD电容充电至VCC,
		   100μs放电不足导致v读为伪OPEN(4091), 若用v做路由会误入CV
		   且g_slotRefV被设为4091, 后续PEAK_DROP必然触发 */
		imp_linear_li:
			g_impCheckSlot = 0xFF;
			g_highVFlag &= ~((unsigned int)1 << idx);
			ty = BAT_TYPE_LINEAR_LI;
			DETECT_LI_ROUTE(idx, (unsigned int)(g_impData & 0x0FFFU), st, ct);
			break;



	case CHG_ACTIVATE:
		ct += tick;
		if(ct > TIME_ACTIVATE_MAX)
		{
			st = CHG_ERROR;
			break;
		}
		if(v > ADC_V_ACTIVATE)
		{
			st = CHG_PRECHARGE;
			ct = 0;
			break;
		}
		if(v >= ADC_V_OVER)
		{
			st = CHG_ERROR;
			break;
		}
		break;

	case CHG_PRECHARGE:
		ct += tick;
		if(ct > TIME_PRECHARGE_MAX)
		{
			st = CHG_ERROR;
			break;
		}
		if(v >= ADC_V_OVER)
		{
			g_ovCnt[idx]++;
			if(g_ovCnt[idx] >= OV_DEBOUNCE_CNT)
			{
				st = CHG_ERROR;
				break;
			}
		}
		else
		{
			g_ovCnt[idx] = 0;
		}
		if(v >= ADC_V_PRE_MAX)
		{
			st = CHG_CC_CHARGE;
			ct = 0;
			g_ccBlocks[idx] = 0;
			g_ovCnt[idx] = 0;
			g_slotRefV[idx] = v;
		}
		break;

	case CHG_CC_CHARGE:
		ct += tick;
		if(ct >= CC_BLOCK_TICKS)
		{
			ct -= CC_BLOCK_TICKS;
			g_ccBlocks[idx]++;
		}
		if(g_ccBlocks[idx] >= CC_MAX_BLOCKS)
		{
			st = CHG_ERROR;
			break;
		}

		/* 伪OPEN过滤: 线性锂电池无charger IC, BxAD电容充电至VCC后放电不足→伪OPEN(4091),
		   伪OPEN不更新g_slotRefV(防4091污染), 不触发CC→CV(等真实电压达标),
		   继续PEAK_DROP/OV/CC_MAX_BLOCKS等安全检查, CC→CV由真实电压触发 */
		if(v >= ADC_V_OPEN && ty == BAT_TYPE_LINEAR_LI)
		{
			/* g_slotRefV不更新(跳过4091污染), 继续后续检查 */
		}
		else
		{
			if(v > g_slotRefV[idx]) g_slotRefV[idx] = v;
		}

		/* 电压跌落重判: 接触不良导致误判为LI_ION时, 电压会从虚高值跌回真实值
		   例: B1 NiMH接触不良→ADC=3949→误判LI_ION→CV, 接触恢复后ADC=1899(跌落2050)
		   g_slotRefV[idx] 追踪CC/CV阶段电压峰值
		   消抖: 连续2帧跌落才触发, 防单帧VCC污染误中断充电 */
		if(g_slotRefV[idx] - v > PEAK_DROP_THRESH && ty != BAT_TYPE_LINEAR_LI)
		{
			/* 线性锂电池无charger IC稳压, 充电时电压波动正常, 不触发跌落重判 */
			g_detectLowCnt[idx]++;
			if(g_detectLowCnt[idx] < 2)
				break;
			g_detectLowCnt[idx] = 0;
			st = CHG_DETECT;
			ct = 0;
			break;
		}
		else
		{
			g_detectLowCnt[idx] = 0;
		}

		/* 线性锂电池(LC9203DC): 内部电芯VBAT>充电器VOUT时,
		   芯片不激活充电模式→不拉电流→BxAD电容充电至VCC→伪OPEN
		   恒压锂电池(LC9203DB)有charger IC始终拉载, 不会出现此现象
		   LI_ION+OPEN在CC阶段出现 → 电芯已充满 → 跳转FULL
		   线性锂电池排除: 100μs放电不足导致伪OPEN与真实电压交替出现,
		   伪OPEN不代表充满, 走正常CC→CV→FULL路径 */
		if(v >= ADC_V_OPEN && ty == BAT_TYPE_LI_ION)
		{
			st = CHG_FULL;
			ct = 0;
			break;
		}

		/* 过压保护: 线性锂电池排除(无charger IC, ADC读数因电容残留不可靠,
		   伪OPEN(4091)不是真过压, 且已排除伪OPEN→FULL和PEAK_DROP,
		   真过压由电池自身保护板处理) */
		if(v >= ADC_V_OVER && ty != BAT_TYPE_LINEAR_LI)
		{
			g_ovCnt[idx]++;
			if(g_ovCnt[idx] >= OV_DEBOUNCE_CNT)
			{
				st = CHG_ERROR;
				break;
			}
		}
		else
		{
			g_ovCnt[idx] = 0;
			/* LINEAR_LI伪OPEN不触发CC→CV: 等真实电压≥FULL时转换 */
			if(v >= ADC_V_FULL && !(v >= ADC_V_OPEN && ty == BAT_TYPE_LINEAR_LI))
			{
				st = CHG_CV_CHARGE;
				ct = 0;
			}
		}
		break;

	case CHG_CV_CHARGE:
		ct += tick;
		if(ct > TIME_CV_HOLD)
			st = CHG_FULL;

		/* 伪OPEN过滤(必须在g_slotRefV更新之前):
		   线性锂电池(LC9203DC)无charger IC, MOSFET导通时BxAD电容充电至VCC,
		   100μs放电不足→伪OPEN(4091)≠真实电压, 跳过本次ADC读数,
		   保持当前充电状态(cvTimer已累加)继续下一周期, 防止:
		   (a) g_slotRefV被4091污染→后续PEAK_DROP假落差
		   (b) 拔出检测误判→IMP_CHECK↔CV↔IDLE死循环 */
		if(v >= ADC_V_OPEN && ty == BAT_TYPE_LINEAR_LI)
			break;

		/* PEAK_DROP峰值追踪: 跟踪CV阶段电压峰值, 供跌落检测用 */
		if(v > g_slotRefV[idx]) g_slotRefV[idx] = v;

		/* 电池拔出检测: 2帧消抖
		   仅LI_ION(有charger IC)的伪OPEN代表电芯已满→FULL
		   其他类型(非LINEAR_LI, 已达此处v≥OPEN)的OPEN是真拔出→IDLE */
		if(v >= ADC_V_OPEN)
		{
			if(ty == BAT_TYPE_LI_ION)
			{
				g_detectLowCnt[idx]++;
				if(g_detectLowCnt[idx] < 2)
					break;
				g_detectLowCnt[idx] = 0;
				st = CHG_FULL;
				ct = 0;
				break;
			}
			g_detectLowCnt[idx]++;
			if(g_detectLowCnt[idx] < 2)
				break;
			g_detectLowCnt[idx] = 0;
			ty = BAT_TYPE_UNKNOWN;
			st = CHG_IDLE;
			ct = 0;
			break;
		}

		/* PEAK_DROP跌落重判: 捕获碳性/碱性电池漏入CV后电压崩溃
		   例: B2碳性误判LINEAR_LI→CV, 3757→2047(碳性电化学无法承受充电电流)
		   2帧消抖防VCC瞬降误触发, 确认跌落则重置类型回DETECT重新识别
		   线性锂电池排除: 100μs放电不足导致v交替读真实值/伪OPEN,
		   g_slotRefV跟踪峰值(伪OPEN)与真实值之间大落差是ADC假象非真跌落 */
		if(g_slotRefV[idx] - v > PEAK_DROP_THRESH && ty != BAT_TYPE_LINEAR_LI)
		{
			g_detectLowCnt[idx]++;
			if(g_detectLowCnt[idx] >= 2)
			{
				g_detectLowCnt[idx] = 0;
				ty = BAT_TYPE_UNKNOWN;
				st = CHG_DETECT;
				ct = 0;
				break;
			}
		}
		else
		{
			g_detectLowCnt[idx] = 0;
		}

		/* 过压保护: CV阶段电压不应超过ADC_V_OVER */
		if(v >= ADC_V_OVER)
		{
			g_ovCnt[idx]++;
			if(g_ovCnt[idx] >= OV_DEBOUNCE_CNT)
			{
				st = CHG_ERROR;
				break;
			}
		}
		else
		{
			g_ovCnt[idx] = 0;
		}
		break;

	case CHG_FULL:
		/* 电池拔出检测: 连续N帧v≥OPEN退出FULL回IDLE
		   LINEAR_LI(无charger IC)100μs放电不足→伪OPEN(4091)与真实值
		   交替出现, 2帧消抖容易被伪OPEN连续命中→误判拔出→IDLE→DETECT
		   →FULL死循环. 改用50帧(0.5秒)消抖:
		   真拔出时V持续≈VCC, 50帧全部≥OPEN→可靠判定;
		   电池在位时真实V(<OPEN)出现在else→g_detectLowCnt复位→永不误判 */
		if(v >= ADC_V_OPEN)
		{
			g_detectLowCnt[idx]++;
			if(g_detectLowCnt[idx] >= (ty == BAT_TYPE_LINEAR_LI ? 50 : 2))
			{
				g_detectLowCnt[idx] = 0;
				st = CHG_IDLE;
				ct = 0;
			}
			break;
		}
		/* 仅锂电池可补电: NIMH/DRY/AMBIGUOUS/UNKNOWN在DETECT阶段即被拦截,
		   只有LI_ION/LINEAR_LI能经CC→CV到达FULL
		   电压显著回落(v<2800≈1.45V)说明电池已放电, 满电电容稳定后v≈2900~3500不触发 */
		if(v < 2800U)
		{
			g_detectLowCnt[idx]++;
			if(g_detectLowCnt[idx] < 2)
				break;
			g_detectLowCnt[idx] = 0;
			st = CHG_CC_CHARGE;
			ct = 0;
			g_ovCnt[idx] = 0;
			g_slotRefV[idx] = v;
		}
		else
		{
			g_detectLowCnt[idx] = 0;
		}
		break;

	case CHG_ERROR:
		/* 恢复路径: ADC回OPEN → 电池被拔出 → IDLE, 需连续2帧确认 */
		if(v >= ADC_V_OPEN)
		{
			g_detectLowCnt[idx]++;
			if(g_detectLowCnt[idx] < 2)
				break;
			g_detectLowCnt[idx] = 0;
			ty = BAT_TYPE_UNKNOWN;
			st = CHG_IDLE;
			ct = 0;
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
		if(ty == BAT_TYPE_NIMH || ty == BAT_TYPE_DRY)
		{
			if(v > 2700U && (g_highVFlag & ((unsigned int)1 << idx)))
			{
				g_detectLowCnt[idx]++;
				if(g_detectLowCnt[idx] < 2)
					break;
				g_detectLowCnt[idx] = 0;
				st = CHG_DETECT;
				ct = 0;
			}
			else
			{
				g_detectLowCnt[idx] = 0;
			}
			break;
		}
		/* LI_ION/LINEAR_LI/UNKNOWN: 有电压 → 回DETECT重判, 需连续2帧确认 */
		if(v > ADC_V_ACTIVATE)
		{
			g_detectLowCnt[idx]++;
			if(g_detectLowCnt[idx] < 2)
				break;
			g_detectLowCnt[idx] = 0;
			st = CHG_DETECT;
			ct = 0;
		}
		else
		{
			g_detectLowCnt[idx] = 0;
		}
		break;

	default:
		st = CHG_IDLE;
		break;
	}

	SLOT_WR_ALL(idx, st, ty, v, ct);

	/* 调试: 追踪 slot 0~5 的每一次状态跳转(扩展至B6用于调试) */
	if(idx <= 5 && st != old_st)
	{
		g_dbgSlot = idx;
		g_dbgOldState = old_st;
		g_dbgNewState = st;
		g_dbgNewType = ty;
		g_dbgVoltage = v;
		g_dbgDetectFlag = 1;
	}
}

/*========================================================================
  函数: Charging_Control
  功能: 12路充电使能控制(含温度保护)
  说明: 每轮扫描结束后调用一次(在槽位0的Phase2中)
  流程:
    1. 温度保护检查: 温度>=60C则关闭所有充电
    2. 遍历12个槽位, 根据状态决定是否充电
    3. 充电状态(ACTIVATE/PRECHARGE/CC_CHARGE/CV_CHARGE): 打开MOSFET
    4. 其他状态: 关闭MOSFET
    5. 有充电则置位组控制(CD1/CD2), PWM占空比由CCCV_Control单独计算
  MOSFET控制: AO3401 P沟道, Gate=Low导通, Gate=High关闭
========================================================================*/
void Charging_Control(void)
{
	unsigned char i;
	unsigned char chargeB1_6 = 0;    /* B1-B6组是否有充电: 0=无, 1=有 */
	unsigned char chargeB7_12 = 0;   /* B7-B12组是否有充电: 0=无, 1=有 */

	/* 温度保护: 温度过高, 关闭所有充电 */
	if(g_tempProtect)
	{
		SLOT_ALL_OFF();             /* 关闭所有MOSFET(Gate=High) */
		PIN_CD1 = 0;                /* 关闭组1充电 */
		PIN_CD2 = 0;                /* 关闭组2充电 */
		g_pwmDuty = 0;              /* ISR中自动输出PWM=0 */
		return;
	}

	/* VCC低压保护: 电源过载时VCC跌落 → 关闭所有充电
	   防止ADC读数异常导致空槽被误判为有电池(VCC崩溃时实测ADC可从4095跌至~2700)
	   200mV回差防抖, 避免临界电压反复开关 */
	if(g_vccProtect)
	{
		if(g_vcc_mv < VCC_UVLO_RESUME)
		{
			SLOT_ALL_OFF();
			PIN_CD1 = 0;
			PIN_CD2 = 0;
			g_pwmDuty = 0;
			return;
		}
		g_vccProtect = 0;          /* VCC恢复, 解除保护 */
	}
	else
	{
		if(g_vcc_mv < VCC_UVLO_STOP)
		{
			g_vccProtect = 1;      /* VCC过低, 触发保护 */
			SLOT_ALL_OFF();
			PIN_CD1 = 0;
			PIN_CD2 = 0;
			g_pwmDuty = 0;
			return;
		}
	}

	/* 遍历12个槽位, 根据状态控制MOSFET */
	for(i = 0; i < BATTERY_SLOTS; i++)
	{
		unsigned char s = S_STATE(i);

		/* 充电状态: 激活/预充/恒流/恒压/阻抗检测 -> 打开MOSFET */
		if(s == CHG_ACTIVATE || s == CHG_PRECHARGE ||
		   s == CHG_CC_CHARGE || s == CHG_CV_CHARGE ||
		   s == CHG_IMP_CHECK)
		{
			SLOT_CHARGE_ON(i);       /* Gate=Low, MOSFET导通 */

			/* 标记所属组有充电 */
			if(i < 6)
				chargeB1_6 = 1;
			else
				chargeB7_12 = 1;
		}
		else
		{
			SLOT_CHARGE_OFF(i);      /* Gate=High, MOSFET关闭 */
		}
	}

	/* 组控制输出: 控制CD1(B1-B6组)和CD2(B7-B12组) */
	PIN_CD1 = chargeB1_6;
	PIN_CD2 = chargeB7_12;

	/* PWM占空比由CCCV_Control()计算, ISR中自动生成波形, 此处不直接操作PIN_PWM */
}

/*========================================================================
  函数: CCCV_Control
  功能: CC-CV恒流恒压PWM占空比自动调节
  说明: 每轮扫描结束后调用(在Charging_Control之后)
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