/*-------------------------------------------
  L1211 12槽充电器 - 充电管理模块
-------------------------------------------*/
#include "config.h"

/* --- 本地常量(不依赖config.h的微调参数) --- */
#define DETECT_STABLE_TICKS      20    /* 高压稳定确认tick数: 20tick=200ms无显著下跌→真锂电 */
#define DIODE_CLAMP_MARGIN       150   /* DIODE_TEST钳位判据: 相对脉冲前电压的最大允许爬升(ADC).
                                          超过说明电容未被电池/体二极管钳位→干电池高内阻特征 */
#define CC_RETRY_FLAG            0x80  /* V54K: g_ccBlocks bit7 复用为LINEAR_LI CC超时循环标记.
                                          0=首次超时回DETECT重判, 1=再次超时直接ERROR锁死,
                                          避免B3碳性误判LINEAR_LI后16s超时→ERROR→DET的无限循环.
                                          进CV/新CC周期/电池拔出时清零. */

/*========================================================================
  全局变量
========================================================================*/
unsigned int g_temperature = 250;
unsigned char g_tempProtect = 0;
unsigned char g_vccProtect  = 0;         /* VCC低压保护标志: 1=VCC过低, 关闭充电 */
unsigned int g_slotRefV[BATTERY_SLOTS];  /* 槽位参考电压: DETECT存初始值/稳定基准, CC/CV存峰值 */
unsigned char g_ccBlocks[12];           /* CC阶段10分钟块计数(解决16bit chargeTimer溢出);
                                           V54K复用bit7作为LINEAR_LI CC超时循环标记 */
unsigned char g_ovCnt[12];              /* 过压消抖计数器: 连续过压次数 */
unsigned char g_detectLowCnt[12];       /* 通用消抖计数器(短路消抖/AMBIGUOUS消抖/LI_ION消抖) */
unsigned char g_impCheckSlot = 0xFF;    /* IMP_CHECK串行锁: 0xFF=空闲, 其他=持有锁的槽号
                                           同一时间只允许一个槽做IMP_CHECK,
                                           避免NiMH拉垮VCC导致其他槽误判 */
unsigned char g_stableCnt[12];           /* DETECT高压稳定循环专用计数器 */
unsigned int g_capFlag;                  /* 电容虚高标记位掩码: bit[i]=1表示槽i需扩展等待电容放电 */
unsigned int g_impData;                  /* IMP_CHECK共享数据: 低12位脉冲前电压+高4位VCC编码(100mV步进)
                                           因IMP_CHECK串行化, 同一时间仅一个槽使用 */
unsigned char g_diodeTrace[4];         /* DIODE_TEST v轨迹(V54G): 4点(ct=7,14,21,28),
                                         每点1字节存相对pre偏移/4+128(±127*4 ADC, clamp),
                                         单槽共享缓冲(IMP_CHECK串行锁保证同时仅一槽在DIODE_TEST),
                                         仅ISR写数组供主循环打印, 不阻塞UART */
unsigned char g_diodeTraceCnt;         /* DIODE_TEST v轨迹采样点数, 主循环打印后清零 */
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
        归一化后 raw*5000/vcc 使同一电池在不同槽位/不同电源下读数一致,
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
	return (unsigned int)(((unsigned long)raw * VCC_REF_MV) / (unsigned long)g_vcc_mv);
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
	unsigned long vx_mv = (unsigned long)(v) * VCC_REF_MV / 4096UL; \
	unsigned long bat_mv_long = ALPHA_NUM * vx_mv + BETA_NUM * VCC_REF_MV; \
	unsigned int  bat_mv = (unsigned int)((bat_mv_long + CAL_DEN/2UL) / CAL_DEN); \
	if(bat_mv <= BAT_MV_ACTIVATE) { \
		st = CHG_ACTIVATE; \
	} else if(bat_mv < BAT_MV_PRECHARGE) { \
		st = CHG_PRECHARGE; \
	} else if(bat_mv >= BAT_MV_FULL) { \
		if(g_ccBlocks[idx] >= CV_DROP_LOOP_MAX) { \
			st = CHG_ERROR; \
		} else { \
			st = CHG_CV_CHARGE; \
			g_slotRefV[idx] = v; \
			g_ccBlocks[idx] = 0; \
			g_stableCnt[idx] = 0; \
		} \
	} else { \
		st = CHG_CC_CHARGE; \
		g_ccBlocks[idx] &= CC_RETRY_FLAG; /* V54V: 保留CC_RETRY_FLAG(仅清块计数),
		                                     使CC超时重判循环能累计到再次超时ERROR.
		                                     V54T曾回退为=0导致B3碳性中压被V54U中压钳位
		                                     放行后16s超时→DETECT→再CC无限循环不ERROR. */ \
		g_slotRefV[idx] = v; \
		g_stableCnt[idx] = 0; \
	} \
	ct = 0; \
	g_ovCnt[idx] = 0; \
	g_detectLowCnt[idx] = 0; \
} while(0)

/* IMP_CHECK阶段VCC解码: 从g_impData高4位还原脉冲前VCC(mV), 误差≤50mV */
#define IMP_VCC_DECODE(data)  (((((data) >> 12) & 0x0FU) + 38U) * 100U)

void Slot_Charge_Ctrl(unsigned char idx)
{
	unsigned char st, ty;                   /* st: 充电状态, ty: 电池类型 */
	unsigned int  v, ct;                   /* v: ADC电压(归一化), ct: 充电计时器 */
	unsigned char dly;                     /* 稳定延时循环计数 */

	SLOT_RD_ALL(idx, st, ty, v, ct);

	/* --- 单槽同步采样: 关MOSFET → 稳定延时 → 采样并归一化 --- */
	SLOT_CHARGE_OFF(idx);
	if(st == CHG_DETECT || st == CHG_IMP_CHECK || st == CHG_IMP_DIODE_TEST)
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
		if(!(ty == BAT_TYPE_LINEAR_LI &&
		     (st == CHG_CC_CHARGE || st == CHG_CV_CHARGE) &&
		     newv >= ADC_V_OPEN))
		{
			v = newv;
		}
	}

	switch(st)
	{
	case CHG_IDLE:
		/* V51C: 空槽轮询停留. 空槽(v≥OPEN)停留IDLE_POLL_TICKS后再转DETECT,
		   避免空槽在 DETECT(130tick红灯)→IMP_CHECK→IDLE 间循环导致红灯
		   常亮(修复后空槽大部分时间灯灭, 全IDLE→LED全灭).
		   插入电池(v<OPEN)立即转DETECT, 响应不受影响. */
		if(v >= ADC_V_OPEN)
		{
			if(ct < IDLE_POLL_TICKS)
			{
				ct++;
				break;
			}
		}
		ct = 0;
		st = CHG_DETECT;
		g_ccBlocks[idx] = 0;      /* V51C: 新检测周期复位CV崩溃计数(防ERROR后换电池死循环)
		                           V54K: 同时清CC_RETRY_FLAG */
		g_highVFlag &= ~((unsigned int)1 << idx);
		/* 记录IDLE→DETECT初始电压, 用于ct<TIME_DETECT_WAIT期间
		   检测碳性/空槽电容被串扰充电(电压大幅上升>1000ADC) */
		if(v < ADC_V_OPEN)
			g_slotRefV[idx] = v;
		else
			g_slotRefV[idx] = 0;
		break;

	case CHG_DETECT:
		ct++;

		/* 首次进入DETECT(ct==1): 重置本槽专用计数器, 清除可能残留的电容标记 */
		if(ct == 1)
		{
			g_stableCnt[idx] = 0;
			g_capFlag &= ~((unsigned int)1 << idx); /* 通过idx清除可能残留的电容标记 */
		}

		if(ct < TIME_DETECT_WAIT)
		{
			/* V54I: 停用"串扰充电快速检测"(原: ref>2500 && v>ref+1000 && v<OPEN → 判DRY).
			   V54H实测误杀B5恒压锂: ref=2533∈(2500,2990), DETECT中charger IC输出电容
			   BxAD电压建立慢, 从2533持续爬升至真实值(~3879), v>ref+1000被误判为
			   "电容被串扰充电"→DRY永久锁死(ct=17, g_highVFlag被清无法回DETECT).
			   该检查与ct≥30后的高压稳定流程功能重叠且必然误杀ref∈(2500,2990)的真锂电,
			   停用后干电池/碱性改走 IMP_CHECK(VCC不塌+脉冲后v大跌>1000→DRY) 或
			   DIODE_TEST(爬升不足超时→DRY) 正常拒充链路, 仅拒充时间变长数秒. */
			break;
		}

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
			   但电压>NEAR_OPEN(3500)时已接近OPEN, 不可能是碳性噪声,
			   应继续高压稳定流程, 避免高压线性锂/恒压锂(B11等)卡死.
			   接触改善导致电压真上升会在重置后ct=TIME_DETECT_WAIT时正确置cap标记
			   ty=AMBIGUOUS跳过: amb_shortcut清除g_capFlag后ty已标记
			   为AMBIGUOUS(确认高压稳定), 门禁不应重置ct→丢失进度 */
			if(!(g_capFlag & ((unsigned int)1 << idx)) && ty != BAT_TYPE_AMBIGUOUS &&
			   v <= ADC_V_NEAR_OPEN)
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
			   碳性电池电容放电至≤2900实测R6P约3秒, 保守等
			   25tick(≈2s)后仍>2900→真锂电, 直接IMP_CHECK.
			   V54F方案B回退: V54E曾放宽至60tick, 但平衡点型碳性
			   稳态分压降不下, 多等无益; 异常环境误入由DIODE_TEST
			   判据及CC/CV崩溃锁定兜底 */
				if((g_highVFlag & ((unsigned int)1 << idx)) &&
				   ct >= TIME_DETECT_WAIT + 25U)
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
			/* V51C: 空槽OPEN超时直接进IMP_CHECK(修复B1永远卡DETECT)
			   原逻辑在UNKNOWN分支v≥OPEN超时后goto amb_check, 但ty每轮被
			   Detect_BatteryType(v≥OPEN→UNKNOWN)覆盖回UNKNOWN→消抖计数被清零
			   →永远进不了IMP_CHECK. 现此处强制ty=AMBIGUOUS, 复用amb_check的
			   2帧消抖+串行锁+VCC重采样进入IMP_CHECK, 空槽脉冲前后v均≥OPEN→IDLE,
			   恒压/线性锂负载下v跌至真实值→正常充电. 仅需2帧消抖(无害), 省ROM. */
			if(ty == BAT_TYPE_UNKNOWN && v >= ADC_V_OPEN &&
			   ct >= TIME_DETECT_WAIT + TIME_DETECT_SETTLE)
				ty = BAT_TYPE_AMBIGUOUS;
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
			Get_Vcc();
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
			/* UNKNOWN: 分辨空槽(OPEN)和不可识别电池(SHORT/异常)
			   注: v≥OPEN且等待超时的空槽已由上方ty强制AMBIGUOUS接管(V51C),
			   此分支的OPEN等待仅在超时前短暂出现(电容放电中) */
			if(v >= ADC_V_OPEN)
				break;                /* 继续等待电压下降 */
			st = CHG_ERROR;           /* 电压异常或无法识别 → 报错 */
			g_detectLowCnt[idx] = 0;
		}
		else if(ty == BAT_TYPE_NIMH || ty == BAT_TYPE_DRY)
		{
			st = CHG_ERROR;
			g_detectLowCnt[idx] = 0;
		}
		break;

	case CHG_IMP_CHECK:
		ct++;
		if(ct < IMP_PULSE_TICKS)
			break;

		{
			/* 实时VCC采样: IMP_CHECK期间MOSFET已导通~80ms */
			Get_Vcc();

			/* ── 电池拔出检测（最高优先级） ──
			   脉冲前、后电压均≥OPEN → 确实空槽/已被拔出
			   V54L修复B1: 高压碱性满电电压~3967~4005, 与OPEN接近但<4050,
			   仅当双值均≥4050才判空槽, 避免高压电池被误拔入IDLE死循环. */
			if(v >= 4050U && (g_impData & 0x0FFFU) >= 4050U)
			{
				ty = BAT_TYPE_UNKNOWN;
				st = CHG_IDLE;
				g_impCheckSlot = 0xFF;
				g_highVFlag &= ~((unsigned int)1 << idx);
				break;
			}

			/* ── NiMH VCC塌陷检测 ──
			   VCC跌落>300mV 且 脉冲后电池端被拉到OPEN
			   恒压锂电charger IC也会拉低VCC, 但电池端不会飙升到OPEN, 避免误判 */
			if(IMP_VCC_DECODE(g_impData) > g_vcc_mv + 300U && v >= ADC_V_OPEN)
			{
				ty = BAT_TYPE_NIMH;
				st = CHG_ERROR;
				g_impCheckSlot = 0xFF;
				g_highVFlag &= ~((unsigned int)1 << idx);
				break;
			}

			/* ── 恒压锂电: VCC跌落>200mV ──
			   V54M修复B1: 高压碱性/碳性(pre≥OPEN)在IMP脉冲时VCC波动易超200mV,
			   被误判为恒压锂进CV过充. 对pre≥OPEN的电池禁用此判据.
			   V54O修复B3: 中压碳性(pre 3100~3900)同样因VCC波动被误判为恒压锂,
			   上限从OPEN降到3100, 中压段统一走DIODE_TEST用爬升区分. */
			if(IMP_VCC_DECODE(g_impData) > g_vcc_mv + 200U &&
			   (g_impData & 0x0FFFU) < 3100U)
				goto imp_li_ion;

			/* ── 碳性/碱性干电池: 脉冲后电压比脉冲前低>1000ADC ──
			   V54J: 加g_highVFlag保护: DETECT已确认高压稳定(≥20tick>2900)的真锂电
			   跳过此判据, 避免pre虚高被误判DRY永久锁死.
			   V54I实测B9恒压锂ref=3840(高压稳定确认), IMP脉冲后电容放电回真实值
			   ~2745, pre差1095>1000被误杀. 真锂电脉冲前读数是电容虚高并非电池真值;
			   碳性/碱性在DETECT无法连续20tick稳定(内阻大充电慢), flag不置位仍正常拒充 */
			if(!(g_highVFlag & ((unsigned int)1 << idx)) &&
			   ((g_impData & 0x0FFFU) > v) &&
			   ((g_impData & 0x0FFFU) - v) > 1000U)
			{
				ty = BAT_TYPE_DRY;
				st = CHG_ERROR;
				g_impCheckSlot = 0xFF;
				g_highVFlag &= ~((unsigned int)1 << idx);
				g_detectLowCnt[idx] = 0;
				break;
			}

			/* ── 高压锂电保护: pre>NEAR_OPEN 且 VCC不塌(<200mV)
			   不直接判DRY, 先进DIODE_TEST确认, 避免高压恒压锂/线性锂
			   (B10/B11/B12等)被误拒充 */
			if(((g_impData & 0x0FFFU) > ADC_V_NEAR_OPEN) &&
			   (IMP_VCC_DECODE(g_impData) <= g_vcc_mv + 200U))
			{
				goto imp_diode_test_entry;
			}

			/* ── 脉冲后≥OPEN → 进DIODE_TEST进一步确认 ──
			   可能是线性锂/恒压锂/镍氢, DIODE_TEST用爬升区分Li与DRY/NiMH */
			if(v >= ADC_V_OPEN)
				goto imp_diode_test_entry;

		imp_diode_test_entry:
			/* ── 进入DIODE_TEST ──
			   保持IMP_CHECK串行锁不释放, 防止g_impData基准被其它槽改写 */
			st = CHG_IMP_DIODE_TEST;
			ct = 0;
			g_diodeTraceCnt = 0;        /* V54G: 新一轮检测开始, 清v轨迹(单槽共享缓冲) */
			g_diodeTraceSlot = (unsigned char)idx;
			g_highVFlag &= ~((unsigned int)1 << idx);
		}
		break;

	/* ── Li-ion路由(共用代码, goto跳转节省RAM) ── */
	imp_li_ion:
		g_impCheckSlot = 0xFF;
		g_highVFlag &= ~((unsigned int)1 << idx);
		ty = BAT_TYPE_LI_ION;
		DETECT_LI_ROUTE(idx, v, st, ct);
		break;

	/* ── 线性锂电池路由(无charger IC, VCC不塌) ──
	   检测: (1)脉冲后≥OPEN(体二极管阻断) (2)DIODE_TEST爬升>DIODE_RISE_THRESH
	   用脉冲前电压(g_impData低12位)做DETECT_LI_ROUTE:
	   线性锂无charger IC拉载, IMP_CHECK PWM脉冲后电容充电至VCC,
	   体二极管被阻断无法放电→v读伪OPEN(4091), 若用v做路由会误入CV
	   且g_slotRefV被设为4091, 后续PEAK_DROP必然触发
	   脉冲前电压来自DETECT(MOSFET导通→电容跟踪Vbat→读数准确) */
	imp_linear_li:
		g_impCheckSlot = 0xFF;
		g_highVFlag &= ~((unsigned int)1 << idx);
		ty = BAT_TYPE_LINEAR_LI;
		DETECT_LI_ROUTE(idx, (unsigned int)(g_impData & 0x0FFFU), st, ct);
		break;

	/*========================================================================
	  CHG_IMP_DIODE_TEST: 体二极管被动检测 (V48A)
	  MOSFET关断, BxAD电容通过100K上拉充电, 观察电压爬升
	  线性锂(体二极管阻断): 电容持续爬升>DIODE_RISE_THRESH
	  镍氢/干电池(体二极管导通或内阻大): 电压被钳位, 爬升不足
	========================================================================*/
	case CHG_IMP_DIODE_TEST:
		ct++;
		/* V54G: 记录v相对pre的偏移轨迹(ct=7,14,21,28共4点, 每点1字节:
		   (v-pre)/4+128, 覆盖±508ADC并clamp), 供主循环打印分析
		   爬升/回落形态后设计鲁棒判据. 仅写数组不打印:
		   避免ISR内UART阻塞(GIE关闭1ms/字符)破坏PWM/扫描时序 */
		if((ct == 7U || ct == 14U || ct == 21U || ct == 28U) &&
		   g_diodeTraceCnt < 4U)
		{
			signed int diff = (signed int)v - (signed int)(g_impData & 0x0FFFU);
			diff >>= 2;                       /* /4 */
			if(diff > 127) diff = 127;
			if(diff < -128) diff = -128;
			g_diodeTrace[g_diodeTraceCnt++] = (unsigned char)(diff + 128);
		}
		{
			/* 电池拔出检查: 线性锂误插后拔出→电压回落至OPEN */
			if(v >= ADC_V_OPEN && (g_impData & 0x0FFFU) < ADC_V_OPEN)
			{
				/* 预脉冲非OPEN但当前OPEN: 电容正在充电中, 不是真拔出 */
			}

			/* 电压爬升检测: 当前电压-脉冲前电压 > DIODE_RISE_THRESH → Li */
			if(v > (g_impData & 0x0FFFU) + DIODE_RISE_THRESH)
			{
				/* 用IMP_CHECK期间记录的VCC跌落区分CV锂与线性锂:
				   跌落>150mV → 恒压锂, 否则 → 线性锂 */
				if(IMP_VCC_DECODE(g_impData) > g_vcc_mv + 150U)
					goto imp_li_ion;
				else
					goto imp_linear_li;
			}

			/* 高压锂电回落识别 (V48H, V54F恢复V51C阈值3000)
		   IMP_CHECK时MOSFET导通, BxAD电容被充到偏高电压;
		   进入DIODE_TEST后MOSFET关断, 真实高压锂电(低内阻)会把电容
		   电压迅速拉回电池本体电压 → v明显低于pre但仍>NIMH_MAX.
		   碱性/碳性内阻大, 电容会被100K继续拉向VCC, 不会出现此回落.
		   pre阈值从NEAR_OPEN(3500)降至3000, 覆盖B12等电压稍低的恒压锂电.
		   V54F回退: V54E曾恢复3500拦截B3 pre≈3016误判, 但3500存在拒充
		   pre∈(3000,3500)回落型中压锂电的理论风险; B3异常环境误入CC
		   由崩溃检测锁定为ERROR, 不循环 */
		if(((g_impData & 0x0FFFU) > 3000U) &&
		   (v > ADC_V_NIMH_MAX) &&
		   (v < (g_impData & 0x0FFFU)))
			goto imp_linear_li;

			/* NiMH上拉虚高保护:
			   脉冲前≤2300但DIODE_TEST期间电压>2900, 说明是100K上拉把电池/电容
			   充起来的虚假高电平, 判DRY拒充, 避免镍氢被误判为LINEAR_LI. */
			if((v > ADC_V_NIMH_MAX) &&
			   ((g_impData & 0x0FFFU) <= 2300U))
			{
				ty = BAT_TYPE_DRY;
				st = CHG_ERROR;
				g_impCheckSlot = 0xFF;
				g_highVFlag &= ~((unsigned int)1 << idx);
				g_detectLowCnt[idx] = 0;
				break;
			}

			/* 低压锂电兜底: DIODE_TEST满20tick后, 电压仍稳定在>2100
			   且与脉冲前电压基本持平(下跌<160, 爬升≤DIODE_CLAMP_MARGIN),
			   说明体二极管/电池本体将电容钳位在电池电压附近 → 真锂电放行.
			   干电池(碳性/碱性)高内阻, 100K上拉能把电容持续推离电池电压:
			   B3碳性实测pre=2635→ct26时v=2902(爬升>250ADC), 不满足钳位
			   判据 → 超时判DRY拒充, 不再误入CC.
			   V54D修复: 原V54C的pre≤2300界限误杀中压锂电(B9 pre2949/v2895,
			   B12 pre3030/v3084, B8 pre3480/v3481 均稳定钳位在电池电压),
			   现改为钳位判据覆盖全电压段; 碱性B1/镍氢B2/B7在DIODE_TEST中
			   电压显著下跌(<2100)不满足v>2100, 天然拒充, 不误触发.
			   V54K修复B3: 碳性中压(2300~2900)在DIODE_TEST中v≈pre也会触发兜底,
			   加pre≤2300限制, 仅对真实低压锂电放行; 中压锂电由爬升>900或
			   高压回落识别覆盖, 不受影响.
			   V54U修复B5: 恒压锂充电中v从pre上升>100(实测pre=1911→v=2071~2282,
			   差160)不满足v+100>=pre被误判DRY, 差值放宽到160. */
			if(ct >= 20U && v > 2100U &&
			   (g_impData & 0x0FFFU) <= 2300U &&
			   v + 160U >= (g_impData & 0x0FFFU) &&
			   v <= (g_impData & 0x0FFFU) + DIODE_CLAMP_MARGIN)
				goto imp_linear_li;

			/* 超时: 无爬升 → 干电池
			   V54K修复B5/B9: 高压锂电(pre>NEAR_OPEN或v>NEAR_OPEN)在DIODE_TEST中
			   可能仅因电容/体二极管特性爬升不足(<900), 直接判DRY会误杀.
			   V54L修复B12: 中压锂电(pre 2300~3100)爬升缓慢(32~80ADC)无法达900,
			   放宽为"v>2800且与pre差<150(稳定钳位)"即放行LINEAR_LI.
			   碳性中压也会被放行, 但后续CC16s超时循环(V54K)会锁定ERROR,
			   比直接拒充多一轮验证, 真实锂电不受影响. */
			if(ct >= DIODE_TEST_TICKS)
			{
				unsigned int pre = (unsigned int)(g_impData & 0x0FFFU);
				/* V54R修复B3高压误进CV: 高压段pre>3500时用"VCC跌落+爬升"双判据:
				   1. VCC跌落>150mV → 恒压锂(charger IC负载), 放行
				   2. VCC不塌但有爬升≥32ADC → 线性锂, 放行
				   3. VCC不塌且无爬升 → 碳性/碱性(内阻大电压被钳位), 判DRY
				   (V54Q仅用爬升, 误杀了恒压锂B5/B9/B12; 本方案恢复之) */
				if(pre > ADC_V_NEAR_OPEN && pre < ADC_V_OPEN)
				{
					unsigned char tc;
					unsigned char hasRise = 0;
					for(tc = 0; tc < g_diodeTraceCnt; tc++)
					{
						if(g_diodeTrace[tc] >= 136U)   /* (v-pre)/4>=8 */
						{
							hasRise = 1;
							break;
						}
					}
					if(IMP_VCC_DECODE(g_impData) > g_vcc_mv + 150U)
						goto imp_li_ion;              /* 恒压锂 */
					if(!hasRise)
					{
						ty = BAT_TYPE_DRY;
						st = CHG_ERROR;
						g_impCheckSlot = 0xFF;
						g_highVFlag &= ~((unsigned int)1 << idx);
						g_detectLowCnt[idx] = 0;
						break;
					}
					goto imp_linear_li;               /* 线性锂 */
				}
				if(v > ADC_V_NEAR_OPEN && v < ADC_V_OPEN)
				{
					goto imp_linear_li;
				}
				/* V54U修复B4/B8/B9: 中压钳位范围从(2800~3100)拓宽到(2300~3500),
				   消除VCC异常时VCC跌落判据失效导致的盲区:
				   - pre 2300~2800(B9 pre=2722/B8 pre=2856/第三次B4 pre=2362)原不满足
				     低压兜底(pre≤2300)与中压钳位(v>2800)双条件 → 误判DRY
				   - pre 3100~3500(第二次B4 pre=3425)原不满足VCC跌落(pre<3100)、
				     高压段(pre>3500)、中压钳位(v<3100) → 误判DRY
				   真实锂电稳定钳位在电池电压附近(v与pre差<150)即放行.
				   碳性B3中压若被放行, 仍由CC 16s超时循环(V54K/V54T)兜底. */
				if(v > 2300U && v < 3500U && pre < 3500U &&
				   v + 150U >= pre && pre + 150U >= v)
				{
					goto imp_linear_li;
				}
				ty = BAT_TYPE_DRY;
				st = CHG_ERROR;
				g_impCheckSlot = 0xFF;
				g_highVFlag &= ~((unsigned int)1 << idx);
				g_detectLowCnt[idx] = 0;
			}
	}
	break;

	case CHG_ACTIVATE:
		ct++;
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
		ct++;
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
			g_ccBlocks[idx] = 0;       /* V51C/V54K: 复位块计数与CC_RETRY_FLAG */
			g_ovCnt[idx] = 0;
			g_slotRefV[idx] = v;
			g_stableCnt[idx] = 0;      /* V50E: 复位CC无进展检测闩锁 */
		}
		break;

	case CHG_CC_CHARGE:
		ct++;
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
		else if(ct <= CC_NO_PROGRESS_TICKS)
		{
			/* V50E: CC无进展检测窗口期内冻结g_slotRefV为CC起点基准v0,
			   不做峰值追踪, 供下方进展判断与PEAK_DROP跌落基准使用.
			   窗口结束后(进展已确认或超时报ERROR)恢复峰值追踪.
			   V54W: 冻结窗口从LI_ION扩展到LINEAR_LI, 使16s超时能用
			   起点ref判断充电进展(区分真实锂电与碳性B3, 见下方注释). */
		}
		else
		{
			if(v > g_slotRefV[idx]) g_slotRefV[idx] = v;
		}

		/* 电压跌落/低压崩溃重判 (V50D):
		   分类处理, 避免共用g_detectLowCnt互相清零
		   (V50C缺陷: LINEAR_LI低压计数每帧被原PEAK_DROP的else分支
		   复位为0, 33tick低压崩溃保护从未生效, 仅200tick超时在起作用):
		   - LINEAR_LI(碳性误判): v<2000持续33tick(~2.6s@12.5tick/s)→ERROR
		   - LI_ION(碳性/接触不良): 峰值跌落>500或v<2000, 连续2帧→回DETECT重判
		     真实恒压锂电CC中电压只升不跌, 不会长期<2000, 安全 */
		if(ty == BAT_TYPE_LINEAR_LI)
		{
			if(v < 2000U)
			{
				g_detectLowCnt[idx]++;
				if(g_detectLowCnt[idx] >= 33U)
				{
					g_detectLowCnt[idx] = 0;
					st = CHG_ERROR;
					ct = 0;
					break;
				}
			}
			else
			{
				g_detectLowCnt[idx] = 0;
			}

			/* CC超时: LINEAR_LI在CC超过200tick(~16s@12.5tick/s)未进CV→循环重判
		   首次超时置CC_RETRY_FLAG并回DETECT重判(给真实线性锂/误判电池一次机会);
		   再次超时(标志已置)直接ERROR锁死, 避免B3碳性被钳位判据误判为LINEAR_LI后
		   16s超时直接ERROR→DET重判的无限循环. 真实线性锂电CC阶段
		   电压应快速升过ADC_V_FULL进CV, 不会触发此循环.
		   V54T修复B4: 满电边缘线性锂(CC末期v缓升, 16s内到不了3100)反复超时
		   回DETECT无法进CV. 超时时若v已≥2800(接近满电), 直接进CV由CV钳位
		   电压, 不再循环/ERROR. B3碳性中压(2800~3100)若被放行进CC, 此判据
		   也会放行进CV, 但CV上爬/拔出检测仍可兜底, 且B3主要经DIODE_TEST
		   判DRY(高压)或低压<2800走flag循环, 影响可控.
		   V54W修复低压锂电误杀: V54V恢复flag保留后, 低压锂电(v 2100~2800)
		   进CC若16s内升不到2800会被二次超时ERROR误杀(如B4第三次v=2260~2324).
		   现用起点ref(窗口期冻结)判断充电进展: v已上升≥30ADC(充电中) →
		   置进展标记并延长CC, 直到v≥2800进CV, 不循环不ERROR; 无进展(碳性
		   B3电压不升)才走flag循环→二次ERROR. 伪OPEN(4091)不满足v<OPEN
		   分支, 按有进展延长, 由真实电压后续判定. */
		if(ct >= 200U)
		{
			ct = 0;
			if(v >= 2800U && v < ADC_V_OPEN)
			{
				st = CHG_CV_CHARGE;
				g_ccBlocks[idx] = 0;
				g_slotRefV[idx] = v;
				g_stableCnt[idx] = 0;
			}
			else if(v >= g_slotRefV[idx] + CC_NO_PROGRESS_RISE)
			{
				g_stableCnt[idx] = 1;    /* 真实锂电: CC中有充电进展, 标记后延长 */
				g_slotRefV[idx] = v;     /* 重置起点, 下一轮窗口冻结新基准 */
			}
			else if(g_stableCnt[idx] != 0)
			{
				g_slotRefV[idx] = v;     /* 已确认进展: 继续CC充电, 不循环不ERROR */
			}
			else if(g_ccBlocks[idx] & CC_RETRY_FLAG)
			{
				st = CHG_ERROR;          /* 碳性/异常: 无进展二次超时锁死 */
			}
			else
			{
				g_ccBlocks[idx] |= CC_RETRY_FLAG;
				st = CHG_DETECT;         /* 首次超时无进展: 回DETECT重判 */
				g_slotRefV[idx] = 0;
				g_stableCnt[idx] = 0;
			}
			break;
		}
		}
		else
		{
			/* V50E: 跌落检测增加v<g_slotRefV守卫. 无进展窗口期g_slotRefV
			   冻结为CC起点v0, 电压上升时v>v0, 若直接相减会unsigned回绕
			   成巨大值→误判跌落→回DETECT死循环 */
			if((v < g_slotRefV[idx] && g_slotRefV[idx] - v > PEAK_DROP_THRESH) || v < 2000U)
			{
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

			/* CC无进展检测(V50E): 漏洞A闭环
			   真实恒压锂电在CC阶段电压应持续上升至≥ADC_V_FULL进CV.
			   若进入CC后CC_NO_PROGRESS_TICKS(~60s)内电压上升
			   <CC_NO_PROGRESS_RISE(30ADC), 即维持中压高位(2000~3100)
			   不升不降 → 误判LI_ION的碳性/异常电池 → ERROR,
			   而非等CC_MAX_BLOCKS(最长3h)超时.
			   窗口期内g_slotRefV冻结为起点基准v0; g_stableCnt做进展闩锁
			   (1=已上升≥30ADC), 该数组仅DETECT阶段使用, 进入CC时已在
			   DETECT_LI_ROUTE/PRECHARGE/FULL路径复位 */
			if(ct <= CC_NO_PROGRESS_TICKS)
			{
				if(v >= g_slotRefV[idx] + CC_NO_PROGRESS_RISE)
					g_stableCnt[idx] = 1;
			}
			if(ct > CC_NO_PROGRESS_TICKS && g_stableCnt[idx] == 0)
			{
				st = CHG_ERROR;
				ct = 0;
				break;
			}
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
				g_ccBlocks[idx] = 0;    /* V51C: 复位CV上爬检测起点锁/闩锁
				                           V54K: 同时清CC_RETRY_FLAG */
			}
		}
		break;

	case CHG_CV_CHARGE:
		ct++;
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

		/* V51C: CV上爬检测(漏洞B加固)
		   正常满电锂电进CV后电压被PI钳位不再爬升;
		   碳性/碱性/镍氢误判进CV时过充电压持续爬升→窗口(60s)内相对起点
		   上升>CV_NO_PROGRESS_RISE且连续CV_NO_PROGRESS_CNT帧→ERROR,
		   而非等TIME_CV_HOLD(10分钟)后误判FULL绿灯.
		   g_ccBlocks复用为"起点已锁定"标志(首帧非伪OPEN读数锁定起点基准),
		   g_stableCnt复用为上爬消抖计数(DETECT/CC已用完, 进CV时已复位).
		   排除v≥OPEN: OPEN由下方拔出/满电逻辑处理.
		   V54K修复B6: 线性锂电(LINEAR_LI)无charger IC, CV阶段电芯电压自然
		   会持续缓慢爬升, 此检测会误杀正常线性锂; 仅对恒压锂(LI_ION)启用. */
		if(v < ADC_V_OPEN && ct <= CV_NO_PROGRESS_TICKS && ty == BAT_TYPE_LI_ION)
		{
			if(g_ccBlocks[idx] == 0)
			{
				g_slotRefV[idx] = v;
				g_ccBlocks[idx] = 1;
			}
			else if(v >= g_slotRefV[idx] + CV_NO_PROGRESS_RISE)
			{
				if(++g_stableCnt[idx] >= CV_NO_PROGRESS_CNT)
				{
					g_stableCnt[idx] = 0;
					st = CHG_ERROR;
					ct = 0;
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
		   V54L修复: LINEAR_LI在CV阶段因无charger IC, ADC读数可能接近OPEN(3990)
		   但仍在真实电池电压范围(3900~4050), 直接判IDLE会导致反复重判.
		   对LINEAR_LI仅当v≥4050(真正空槽)才判拔出, 3990~4050保持CV继续观察. */
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
			if(ty == BAT_TYPE_LINEAR_LI)
			{
				break;    /* 线性锂CV高压伪OPEN: 保持CV, 由CT超时进FULL.
				              V54N: 移除4050上限, B6实测CV电压达4086仍真实在位. */
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

		/* 低压崩溃/跌落重判 (V50D):
		   - LINEAR_LI(碳性误判进入CV): v<2000持续33tick(~2.6s)→ERROR
		     碳性被恒压充电后电化学崩溃, 电压跌至中压以下且无法恢复
		   - LI_ION(碳性/接触不良): 峰值跌落>500, 2帧→回DETECT重判
		   LINEAR_LI排除跌落判据: 100μs放电不足导致v交替读真实值/伪OPEN,
		   g_slotRefV跟踪峰值(伪OPEN)与真实值之间大落差是ADC假象非真跌落 */
		if(ty == BAT_TYPE_LINEAR_LI)
		{
			if(v < 2000U)
			{
				g_detectLowCnt[idx]++;
				if(g_detectLowCnt[idx] >= 33U)
				{
					g_detectLowCnt[idx] = 0;
					st = CHG_ERROR;
					ct = 0;
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
			if(v < g_slotRefV[idx] && g_slotRefV[idx] - v > PEAK_DROP_THRESH)
			{
				g_detectLowCnt[idx]++;
				if(g_detectLowCnt[idx] >= 2)
				{
					g_detectLowCnt[idx] = 0;
					g_ccBlocks[idx]++;    /* V51C: CV崩溃计数, 累计≥CV_DROP_LOOP_MAX
					                        后DETECT_LI_ROUTE再进CV直接ERROR
					                        (碳性/碱性误判CV崩溃循环闭环) */
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
		}

		/* 过压保护: CV阶段电压不应超过ADC_V_OVER
		   V54L修复B6/B9/B10: 线性锂电(LINEAR_LI)无charger IC, CV阶段电芯电压
		   自然爬升且ADC读数因VCC波动偏高, 过压保护会误杀. 仅对恒压锂(LI_ION)
		   启用; 恒压锂有charger IC钳位, 正常不会超3850. */
		if(v >= ADC_V_OVER && ty == BAT_TYPE_LI_ION)
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
			g_ccBlocks[idx] = 0;   /* V51C: 补电新CC周期复位块计数(防旧CV锁/崩溃计数遗留)
			                           V54K: 同时清CC_RETRY_FLAG */
			g_slotRefV[idx] = v;
			g_stableCnt[idx] = 0;      /* V50E: 复位CC无进展检测闩锁 */
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
			g_ccBlocks[idx] = 0;    /* V54K: 电池拔出, 复位CC_RETRY_FLAG */
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

	/* --- 依据结果控制本槽 MOSFET(受温度/VCC保护门控) --- */
	if((st == CHG_ACTIVATE || st == CHG_PRECHARGE ||
	    st == CHG_CC_CHARGE || st == CHG_CV_CHARGE ||
	    st == CHG_IMP_CHECK || st == CHG_DETECT) &&
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