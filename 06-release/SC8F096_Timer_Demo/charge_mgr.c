/*-------------------------------------------
  L1211 12槽充电器 - 充电管理模块
  功能: NTC温度检测、电池类型识别、充电状态机、充电使能控制
  温度保护: >=60C停止充电, <=50C恢复充电(10C回差防抖)
  电池类型: 通过电压判断锂电池/镍氢/干电池/短路
  状态机: IDLE->DETECT->ACTIVATE/PRECHARGE/CC_CHARGE->CV_CHARGE->FULL
  注: 12槽独立控制, 每槽独立MOSFET(AO3401 P沟道)
-------------------------------------------*/
#include "config.h"

/*========================================================================
  全局变量
========================================================================*/
unsigned int  g_ntcAdc = 0;          /* NTC ADC原始值 */
unsigned char g_temperature = 25;    /* 当前温度(摄氏度), 默认25度 */
unsigned char g_tempProtect = 0;     /* 温度保护标志: 0=正常, 1=保护中 */

/*========================================================================
  函数: Read_Temperature
  功能: 读取NTC热敏电阻并计算温度
  算法:
    1. 读取NTC ADC值(通道AN21, RC5引脚)
    2. 计算NTC电阻值: Rntc = ADC * 10K / (4096 - ADC)
    3. 查表转换为温度(10K上拉, 10K@25C NTC, B=3950)
    4. 判断温度保护: >=60C保护, <=50C恢复
  返回: 温度值(摄氏度, 10~75)
  说明: NTC型号CMFA103J3950HANT, 与LED IO1共用RC5引脚, 分时复用
========================================================================*/
unsigned char Read_Temperature(void)
{
	unsigned int ntcVal = ADC_ReadChannel(ADC_CH_NTC);
	unsigned int ntcR;
	unsigned char temp = 25;

	g_ntcAdc = ntcVal;

	/* ADC值异常: 开路或短路, 返回上次温度 */
	if(ntcVal == 0 || ntcVal >= 4095)
		return g_temperature;

	/* 计算NTC电阻值: 分压公式 Rntc = ADC * 10K / (Vref - ADC) */
	ntcR = (unsigned int)((unsigned long)ntcVal * 10000UL / (4096UL - ntcVal));

	/* 查表: 根据NTC电阻值反推温度
	   CMFA103J3950HANT: 10K@25C, B=3950
	   电阻值越大温度越低, 电阻值越小温度越高 */
	     if(ntcR > 32950) temp = 10;  /* <10C, 按10C处理 */
	else if(ntcR > 27330) temp = 15;
	else if(ntcR > 22060) temp = 20;
	else if(ntcR > 17950) temp = 25;
	else if(ntcR > 14710) temp = 30;
	else if(ntcR > 12120) temp = 35;
	else if(ntcR > 10000) temp = 40;
	else if(ntcR > 8330)  temp = 45;
	else if(ntcR > 6970)  temp = 50;
	else if(ntcR > 5860)  temp = 55;
	else if(ntcR > 4950)  temp = 60;
	else if(ntcR > 4200)  temp = 65;
	else if(ntcR > 3580)  temp = 70;
	else                  temp = 75;  /* >70C, 按75C处理 */

	g_temperature = temp;

	/* 温度保护判断: 60C停止, 50C恢复(10C回差防抖) */
	if(temp >= TEMP_STOP)
		g_tempProtect = 1;             /* 温度过高, 停止充电 */
	else if(temp <= TEMP_RESUME)
		g_tempProtect = 0;             /* 温度恢复, 允许充电 */

	return temp;
}

/*========================================================================
  函数: Detect_BatteryType
  功能: 根据ADC电压值判断电池类型
  参数: voltage - ADC采样值(0~4095)
  返回: 电池类型(BAT_TYPE_xxx)
  判断逻辑:
    电压<=ADC_V_SHORT(5)  -> 短路, 不充电
    电压<=ADC_V_ACTIVATE(12) -> 锂电池(过放), 需激活
    电压在NIMH范围(136~161) -> 镍氢电池, 不充电
    电压在预充范围(62~满电) -> 锂电池, 正常充电
    电压>满电(188)且<过压(198) -> 锂电池(已充满)
    其他 -> 未知类型
  说明: 通过开路电压区分电池类型, 避免充错电池
========================================================================*/
unsigned char Detect_BatteryType(unsigned int voltage)
{
	/* 电压极低: 短路 */
	if(voltage <= ADC_V_SHORT)
		return BAT_TYPE_SHORT;

	/* 电压很低但非短路: 可能是过放锂电池, 需要激活 */
	if(voltage <= ADC_V_ACTIVATE)
		return BAT_TYPE_LI_ION;

	/* 电压在镍氢电池范围: 1.1V~1.3V, 不充电 */
	if(voltage >= ADC_V_NIMH_LOW && voltage <= ADC_V_NIMH_HIGH)
		return BAT_TYPE_NIMH;

	/* 电压在预充范围: 0.5V~满电, 锂电池 */
	if(voltage >= ADC_V_PRE_MIN && voltage <= ADC_V_FULL)
		return BAT_TYPE_LI_ION;

	/* 电压略高于满电: 已充满的锂电池 */
	if(voltage > ADC_V_FULL && voltage < ADC_V_OVER)
		return BAT_TYPE_LI_ION;

	/* 无法判断: 未知类型 */
	return BAT_TYPE_UNKNOWN;
}

/*========================================================================
  槽位电池数据(拆分为两个数组, 避免单Bank RAM溢出)
  每数组6个槽位*12字节=72字节, 可放入Bank0(96字节)和Bank1(80字节)
========================================================================*/
BatterySlot_t g_slot0[6];       /* B1-B6 槽位数据 */
BatterySlot_t g_slot1[6];       /* B7-B12 槽位数据 */

/*========================================================================
  函数: ChargeProcess_Slot
  功能: 单槽充电状态机处理
  参数: idx - 槽位索引(0~11)
  说明: 每个Timer0中断(250us)调用一次, 处理一个槽位
  状态转换逻辑:
    CHG_IDLE -> CHG_DETECT: 开始检测, 等待2s稳定
    CHG_DETECT -> CHG_ACTIVATE: 电压<0.1V, 过放电池, 脉冲激活(最多60s)
    CHG_DETECT -> CHG_PRECHARGE: 电压0.1V~0.5V, 小电流预充(最多5min)
    CHG_DETECT -> CHG_CC_CHARGE: 电压>0.5V, 直接恒流充电
    CHG_DETECT -> CHG_ERROR: 短路/镍氢/未知电池
    CHG_ACTIVATE -> CHG_PRECHARGE: 电压>0.1V, 激活成功, 转为预充
    CHG_ACTIVATE -> CHG_ERROR: 激活超时60s或电压>=过压
    CHG_PRECHARGE -> CHG_CC_CHARGE: 电压>1.0V, 转为恒流充电
    CHG_PRECHARGE -> CHG_ERROR: 预充超时5min或过压
    CHG_CC_CHARGE -> CHG_CV_CHARGE: 电压>=满电(1.52V), 转为恒压充电
    CHG_CC_CHARGE -> CHG_ERROR: 充电超时3h或过压
    CHG_CV_CHARGE -> CHG_FULL: 保持10min后充电完成
    CHG_CV_CHARGE -> CHG_ERROR: 过压
    CHG_FULL -> CHG_CC_CHARGE: 电压下降超过0.08V, 重新充电
    CHG_ERROR -> CHG_DETECT: 电压恢复正常且锂电池, 重新检测
========================================================================*/
void ChargeProcess_Slot(unsigned char idx)
{
	BatterySlot_t *p = GSLOT(idx);
	unsigned int v = p->voltage;        /* 当前ADC电压值 */
	unsigned int tick = 1;              /* 每次调用算1个tick(250us) */

	switch(p->state)
	{
	/* --- 空闲状态: 初始状态, 立即进入检测 --- */
	case CHG_IDLE:
		p->chargeTimer = 0;             /* 计时器清零 */
		p->stableCnt = 0;               /* 稳定计数器清零 */
		p->state = CHG_DETECT;          /* 进入检测状态 */
		break;

	/* --- 检测状态: 等待2s电压稳定后判断电池类型 --- */
	case CHG_DETECT:
		p->chargeTimer += tick;
		if(p->chargeTimer < TIME_DETECT_WAIT)
			break;                      /* 还没到2s, 继续等待 */

		/* 2s后根据电压判断电池类型 */
		p->type = Detect_BatteryType(v);

		/* 短路/镍氢/未知: 不能充电, 进入错误状态 */
		if(p->type == BAT_TYPE_SHORT || 
		   p->type == BAT_TYPE_NIMH || 
		   p->type == BAT_TYPE_UNKNOWN)
		{
			p->state = CHG_ERROR;
			break;
		}

		/* 电压<=0.1V: 过放电池, 需要脉冲激活 */
		if(v <= ADC_V_ACTIVATE)
		{
			p->state = CHG_ACTIVATE;
			p->chargeTimer = 0;
			p->activatePulseCnt = 0;
		}
		/* 电压0.1V~0.5V: 预充电 */
		else if(v < ADC_V_PRE_MIN)
		{
			p->state = CHG_PRECHARGE;
			p->chargeTimer = 0;
		}
		/* 电压>0.5V: 直接进入恒流充电 */
		else
		{
			p->state = CHG_CC_CHARGE;
			p->chargeTimer = 0;
		}
		break;

	/* --- 激活状态: 脉冲激活过放电池(最多60s) ---
	   注: 激活脉冲由Charging_Control函数控制MOSFET导通/关闭 */
	case CHG_ACTIVATE:
		p->chargeTimer += tick;
		/* 激活超时60s: 进入错误状态 */
		if(p->chargeTimer > TIME_ACTIVATE_MAX)
		{
			p->state = CHG_ERROR;
			break;
		}
		/* 电压恢复到0.1V以上: 激活成功, 转为预充 */
		if(v > ADC_V_ACTIVATE)
		{
			p->state = CHG_PRECHARGE;
			p->chargeTimer = 0;
			break;
		}
		/* 过压保护 */
		if(v >= ADC_V_OVER)
		{
			p->state = CHG_ERROR;
			break;
		}
		break;

	/* --- 预充状态: 小电流预充电(最多5min) --- */
	case CHG_PRECHARGE:
		p->chargeTimer += tick;
		/* 预充超时5min: 进入错误状态 */
		if(p->chargeTimer > TIME_PRECHARGE_MAX)
		{
			p->state = CHG_ERROR;
			break;
		}
		/* 过压保护 */
		if(v >= ADC_V_OVER)
		{
			p->state = CHG_ERROR;
			break;
		}
		/* 电压达到1.0V: 预充完成, 转为恒流充电 */
		if(v >= ADC_V_PRE_MAX)
		{
			p->state = CHG_CC_CHARGE;
			p->chargeTimer = 0;
		}
		break;

	/* --- 恒流充电状态: 主充电阶段(最多3h) --- */
	case CHG_CC_CHARGE:
		p->chargeTimer += tick;
		/* 充电超时3h: 进入错误状态 */
		if(p->chargeTimer > TIME_CHARGE_MAX)
		{
			p->state = CHG_ERROR;
			break;
		}
		/* 过压保护 */
		if(v >= ADC_V_OVER)
		{
			p->state = CHG_ERROR;
			break;
		}
		/* 电压达到满电(1.52V): 转为恒压充电 */
		if(v >= ADC_V_FULL)
		{
			p->state = CHG_CV_CHARGE;
			p->chargeTimer = 0;
		}
		break;

	/* --- 恒压充电状态: 保持满电电压10min --- */
	case CHG_CV_CHARGE:
		p->chargeTimer += tick;
		/* 过压保护 */
		if(v >= ADC_V_OVER)
		{
			p->state = CHG_ERROR;
			break;
		}
		/* 保持10min: 充电完成 */
		if(p->chargeTimer > TIME_CV_HOLD)
		{
			p->state = CHG_FULL;
		}
		break;

	/* --- 充满状态: 绿灯常亮, 监控电压下降 --- */
	case CHG_FULL:
		/* 电压下降到满电-0.08V以下: 电池可能自放电, 重新充电 */
		if(v < (ADC_V_FULL - 10))
		{
			p->state = CHG_CC_CHARGE;
			p->chargeTimer = 0;
		}
		break;

	/* --- 错误状态: 红灯闪烁, 等待电池移除后恢复正常 --- */
	case CHG_ERROR:
		/* 电压恢复正常且是锂电池: 重新检测 */
		if(v > ADC_V_ACTIVATE && v < ADC_V_OVER && 
		   p->type == BAT_TYPE_LI_ION)
		{
			p->state = CHG_DETECT;
			p->chargeTimer = 0;
		}
		break;

	default:
		p->state = CHG_IDLE;
		break;
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
    5. 有充电则置位组控制(CD1/CD2)和PWM, 无充电则关闭
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
		PIN_PWM = 0;                /* 关闭PWM */
		return;
	}

	/* 遍历12个槽位, 根据状态控制MOSFET */
	for(i = 0; i < BATTERY_SLOTS; i++)
	{
		unsigned char s = GSLOT(i)->state;

		/* 充电状态: 激活/预充/恒流/恒压 -> 打开MOSFET充电 */
		if(s == CHG_ACTIVATE || s == CHG_PRECHARGE ||
		   s == CHG_CC_CHARGE || s == CHG_CV_CHARGE)
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

	/* PWM输出: 只要有任一槽位充电就打开PWM */
	if(chargeB1_6 || chargeB7_12)
		PIN_PWM = 1;
	else
		PIN_PWM = 0;
}