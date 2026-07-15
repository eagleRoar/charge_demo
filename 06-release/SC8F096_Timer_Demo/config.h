/*-------------------------------------------
  L1211 12槽充电器 - 全局配置文件
  MCU: SC8F096AD832 QFN32
  功能: 12通道恒压锂电池脉冲充电管理
  版本: 2026/06/01 <V2.0>

  原理图参考: L1211 TOP V2.0
  需求参考: requirement_20260518.xlsx
  资源分配参考: resource_allocation.txt

  引脚分配:
    B1~B12  MOSFET栅极控制(AO3401 P沟道, Gate=Low导通, Gate=High关闭)
    B1  = RA0/AN0  /PWMA0  (pin31)
    B2  = RA1/AN1  /PWMA1  (pin30)
    B3  = RB3/AN11 /PWMD2  (pin12)
    B4  = RB2/AN10 /PWMD4  (pin13)
    B5  = RA3/AN3  /PWMA3  (pin28)
    B6  = RA2/AN2  /PWMA2  (pin29)
    B7  = RD1/AN23 /PWMD1  (pin22)
    B8  = RD3/AN25 /PWMD3  (pin20)
    B9  = RB0/AN8  /PWMD0  (pin15)
    B10 = RB1/AN9  /PWMD1  (pin14)
    B11 = RD2/AN24 /PWMD2  (pin21)
    B12 = RD0/AN22 /PWMD0  (pin23)
    注: B1~B12为纯数字输出(仅控制MOSFET开关), ADC采样由独立BxAD引脚完成
    B1AD    : RC1/AN17      B1电压采样(独立ADC通道, 不受MOSFET状态影响)
    B2AD    : RC0/AN16      B2电压采样
    B3AD    : RB4/AN12      B3电压采样
    B4AD    : RB5/AN13      B4电压采样
    B5AD    : RA5/AN5       B5电压采样
    B6AD    : RA4/AN4       B6电压采样
    B7AD    : AN28          B7电压采样(高通道, 模拟专用)
    B8AD    : AN29          B8电压采样(高通道, 模拟专用)
    B9AD    : AN27          B9电压采样(高通道, 模拟专用)
    B10AD   : AN26          B10电压采样(高通道, 模拟专用)
    B11AD   : RA7/AN7       B11电压采样
    B12AD   : RA6/AN6       B12电压采样
    NTC     : RC2/AN18      温度检测(CMFA103J3950HANT,10K上拉至VDD)
    LED IO1    : RC5/AN21      LED电源控制1(与DAT共用)
    LED IO2    : RC4/AN20      LED电源控制2(与CLK/UART TX共用)
    PWM        : RB7/AN15      PWM总控输出(pin8)
    CD IO1     : RC3/AN19      充电组控制1(B1-B6组)
    CD IO2     : RC5/AN21      充电组控制2(B7-B12组)
    EN         : RB6/AN14      主电源使能(Q3 4435)
    SW UART TX : RC4/AN20      UART发送(软件模拟9600bps, 复用CLK引脚, 仅TX)
-------------------------------------------*/
#ifndef __CONFIG_H__
#define __CONFIG_H__

#include <sc.h>

/* 抑制良性编译器警告(8-bit MCU通用类型转换) */
#pragma warning disable 752   /* conversion to shorter data type */
#pragma warning disable 765   /* degenerate unsigned comparison */
#pragma warning disable 764   /* mismatched comparison */

/* --- 系统时钟配置 --- */
#ifndef _XTAL_FREQ
#define _XTAL_FREQ 16000000     /* 系统时钟: 16MHz */
#endif

/* --- 电源电压检测参数 --- */
/* 电源电压 = ADC值 * 1.2V(内部参考) / 4096 * 1000(转mV) */
#define POWER_RATIO        (4096UL * 1200UL)   /* 4096 * 1.2 * 1000 = VREF反推VCC */

/* --- 电池电压双参数线性标定 ---
   标定点: ADC=1885→1.33V(NiMH), ADC=3307→1.55V(恒压锂) @VCC≈5070mV
   公式: V_BAT_mV = (124 * V_BxAD_mV + 206 * VCC_mV) / 1000
   验证: NiMH 1.33V→1331mV, 恒压锂 1.55V→1552mV
   ⚠TODO: 低压区(<1.0V)外推不可靠, 需补充深度过放恒压锂标定点 */
#define ALPHA_NUM           124UL    /* α * 1000 */
#define BETA_NUM            206UL    /* β * 1000 (注意: 公式改为加法, β为正) */
#define CAL_DEN             1000UL
#define UART_PRINT_EN      1       /* UART调试输出开关: 1=启用, 0=禁用 */
#define SW_TX              RC4     /* 软件UART TX引脚(复用CLK, 9600bps) */
#define BIT_TIME           104     /* 9600bps @16MHz */

/* --- 充电槽位数量 --- */
#define BATTERY_SLOTS      12      /* 12路独立充电槽位 */

/*========================================================================
  充电状态枚举
  状态转换流程: IDLE -> DETECT -> ACTIVATE/PRECHARGE/CC_CHARGE -> CV_CHARGE -> FULL
  异常状态: ERROR(短路/镍氢/未知电池/超时/过压)
========================================================================*/
#define CHG_IDLE           0       /* 空闲: 初始状态, 等待插入电池 */
#define CHG_DETECT         1       /* 检测: 等待2s稳定后判断电池类型 */
#define CHG_ACTIVATE       2       /* 激活: 过放电池脉冲激活(电压<0.1V) */
#define CHG_PRECHARGE      3       /* 预充: 小电流预充电(0.1V~0.5V) */
#define CHG_CC_CHARGE      4       /* 恒流充电: 正常充电阶段(0.5V~满电) */
#define CHG_CV_CHARGE      5       /* 恒压充电: 到达满电后保持10min */
#define CHG_FULL           6       /* 充满: 充电完成, 绿灯常亮 */
#define CHG_ERROR          7       /* 错误: 异常状态, 红灯闪烁 */
#define CHG_IMP_CHECK      8       /* 阻抗检测: 短脉冲MOSFET测量内阻 */
#define CHG_IMP_DIODE_TEST 9       /* 体二极管检测: MOSFET关断, 观察电容充电爬升区分线性锂/干电池 */

/*========================================================================
  电池类型枚举
  通过开路电压判断电池类型, 决定是否充电
========================================================================*/
#define BAT_TYPE_UNKNOWN     0       /* 未知类型 */
#define BAT_TYPE_LI_ION      1       /* 恒压锂电池(含charger IC): 正常充电 */
#define BAT_TYPE_NIMH        2       /* 镍氢电池: 不充电, 报错 */
#define BAT_TYPE_DRY         3       /* 干电池: 不充电, 报错 */
#define BAT_TYPE_SHORT       4       /* 短路: 不充电, 报错 */
#define BAT_TYPE_AMBIGUOUS   5       /* 模糊: 电压在镍氢范围, 需阻抗+监视判断 */
#define BAT_TYPE_LINEAR_LI   6       /* 线性锂电池(无charger IC): 正常充电, 
                                       在IMP_CHECK中VCC不塌但电压稳定, 
                                       区别于碳性去极化大跳变 */

/*========================================================================
  LED状态枚举
  红灯亮=充电中, 绿灯亮=充满, 红灯闪=错误
========================================================================*/
#define LED_OFF            0       /* LED关闭 */
#define LED_RED_ON         1       /* 红灯常亮(充电中) */
#define LED_GREEN_ON       2       /* 绿灯常亮(充满) */
#define LED_RED_FLASH      3       /* 红灯闪烁(错误) */

/*========================================================================
  电压阈值(ADC原始值)
  标定: V_BAT = (124×BxAD_mV + 206×VCC_mV)/1000, 反推 ADC = (1000×V_BAT/VCC - 206)×4096/124
  基准 VCC=5070mV (典型值)
  空槽: Bx被100K上拉到VCC, ADC≈4095
  ⚠TODO: 低压阈值(SHORT/ACTIVATE/PRE_MIN/PRE_MAX)仅2点标定外推, 需补采标定点修正
========================================================================*/
#define ADC_V_FULL          3100   /*  1.52V 满电阈值(CV切入), 公式: bat_mV≈1518 */
#define ADC_V_OVER          3850   /*  1.64V 过压保护, 恒压锂charger IC高阻抗特性导致
                                       ADC读数偏高(实测~3766), 3850留足裕量同时
                                       低于OPEN(3990), 确保真实过压仍可检出 */
#define ADC_V_OPEN          3990   /*  空槽判为开路(ADC=4095≈VCC) */

/* TODO: 低压阈值基于2点标定外推, 准确性有限, 需补充低压标定点后修正 */
#define ADC_V_PRE_MIN       1200   /* ~0.70V 预充下限(估算值) */
#define ADC_V_PRE_MAX       2700   /* ~1.00V 预充上限(估算值, 达到后进入CC) */
#define ADC_V_ACTIVATE       750   /* ~0.30V 激活阈值(估算值, 过放电池) */
#define ADC_V_SHORT          500   /* ~0.00V 短路阈值(估算值) */

/* ── NiMH 电压窗口(基于 1.33V NiMH 标定点: ADC=1885) ── */
#define ADC_V_NIMH_LOW      1015   /* ~1.20V NiMH电压范围下限 */
#define ADC_V_NIMH_MAX      2900   /* NiMH开路电压上限(~1.45V@VCC=5V时ADC≈2775, 留余量)
                                      高于此值的电池不进入IMP_CHECK, 直接作LI_ION处理
                                      碳性/碱性若漏入CC, PEAK_DROP会在数秒内纠正 */
#define ADC_V_NIMH_HIGH     ADC_V_OVER  /* 扩展至过压上限, 覆盖碳性/碱性~1.60V */

/* --- DETECT路由用校准mV阈值(替代原始ADC判断) ---
   ⚠TODO: 2点标定公式在低压区外推不可靠, bat_mv最低约1.0V
   导致ACTIVATE(100mV)/PRECHARGE(900mV)阈值暂时无法触发
   低压电池将直接进入CC_CHARGE, 需补采标定点后修正 */
#define BAT_MV_ACTIVATE      100    /* 0.10V: 激活阈值(脉冲激活过放电池) [暂不可达] */
#define BAT_MV_PRECHARGE     900    /* 0.90V: 低于此值进入预充电 [暂不可达] */
#define BAT_MV_FULL         1520    /* 1.52V: 满电阈值(DETECT中检测到满电直接进CV) */

/*========================================================================
  充电时间阈值
  说明: chargeTimer在ChargeProcess_Slot中每次+1, 每轮扫描(12槽×3阶段=36次Timer0)调用一次
  Timer0周期125us, 但部分ISR阶段(Phase0/Phase2)耗时>125us导致扫描周期拉长
   每轮扫描实测≈7.9ms, 1秒≈1000/7.9≈126个tick, 取100(留余量)
  ========================================================================*/
#define TICK_PER_SEC        100         /* 1秒对应的扫描tick数(校准值) */
#define TIME_ACTIVATE_MAX   (60 * TICK_PER_SEC)            /* 激活超时: 60秒 */
#define TIME_PRECHARGE_MAX  (300 * TICK_PER_SEC)           /* 预充超时: 300秒(5分钟) */
#define TIME_CHARGE_MAX     (10800UL * TICK_PER_SEC)       /* 充电超时: 10800秒(3h), 16bit溢出→由CC_BLOCK机制实现 */
#define TIME_DETECT_WAIT    (2 * TICK_PER_SEC)             /* 检测等待: 2秒(初始) */
#define TIME_DETECT_SETTLE  (8 * TICK_PER_SEC)             /* 高内阻电池额外稳定等待: 最多8秒 */
#define DETECT_SETTLE_DROP  50                             /* 稳定判定: ADC下降<50视为已稳定 */
#define TIME_CV_HOLD        (600 * TICK_PER_SEC)           /* CV恒压保持: 600秒(10分钟) */

#define CC_BLOCK_TICKS      (600 * TICK_PER_SEC)   /* CC超时分块: 10分钟tick数(60000<65535) */
#define CC_MAX_BLOCKS       18                     /* 18块=180分钟=3小时 */

#define OV_DEBOUNCE_CNT     5                      /* 过压消抖次数: 连续N次过压才报ERROR */
#define DETECT_LOW_DEBOUNCE 5                      /* DETECT低电压消抖: 连续N次读到低ADC才判UNKNOWN */

/* CC/CV电压跌落重判: 充电中电压从峰值跌落超过此阈值 → 回DETECT重新判断
   B1 NiMH接触不良实测: ADC从3949(误判为LI_ION)跌至1899(真实NiMH), 跌落2050 */
#define PEAK_DROP_THRESH    500     /* ADC跌落阈值: >500counts≈610mV 触发重判 */

/*========================================================================
  CC-CV 充电控制参数
========================================================================*/
/* 软件PWM参数 (RB7/VT_PWM1, 基于Timer0 ISR生成)
   PWM周期 = 32 × 125us = 4ms, 频率 = 250Hz, 占空比分辨率: 3.125%/step */
#define PWM_RESOLUTION      32     /* PWM分辨率(32级) */
#define PWM_MAX             32     /* 100%占空比 */

/* CC恒流阶段: 固定占空比(无电流检测时用电压监控替代闭环) */
#define CC_DUTY_INITIAL     25     /* CC初始占空比(25/32≈78%), 软启动起点 */
#define CC_DUTY_TARGET      25     /* CC目标占空比(25/32≈78%) */
#define CC_DUTY_RAMP_STEP   3      /* 软启动每步增量 */

/* PRECHARGE预充阶段: 低占空比(仅ACTIVATE/PRECHARGE槽位, 无CC槽时生效)
   8/32=25%, 避免78%PWM对高内阻深度过放电池造成充电异常 */
#define PRE_DUTY_TARGET     8      /* 预充目标占空比(8/32=25%) */
#define PRE_DUTY_INITIAL    5      /* 预充初始占空比(5/32≈16%), 软启动起点 */

/* CV恒压阶段: PI闭环控制参数
   error = ADC_V_FULL - 当前电压
   duty += error * CV_KP / CV_DIV
   CV_KI用于慢速积分修正 */
#define CV_KP               4      /* 比例系数 */
#define CV_KI               1      /* 积分系数 */
#define CV_KI_LIMIT         200    /* 积分限幅, 防止积分饱和 */

/* --- 调试配置 --- */
#define NIMH_DETECT_ENABLE  1       /* 1=识别镍氢/干电池并拒充, 0=所有电池按锂电池处理 */

/*========================================================================
  多阶段电池识别参数(NIMH_DETECT_ENABLE=1时生效)
  流程: 电压分区 → 阻抗脉冲(区分干电池/NiMH/Li-ion)
  ========================================================================*/
/* 脉冲方向检测: 短暂导通MOSFET(1tick≈9ms), 判断电特性
   NiMH: 极低内阻→B1AD被拉至近VCC→ADC飙至≥3990(且脉冲前<3990)
   Li-ion: 充电管理芯片切模式→电压小幅上升
   干电池: 高内阻→B1AD无飙升, 电压不上升 */
#define IMP_PULSE_TICKS     1       /* 脉冲持续tick数(1轮≈9ms) */
#define IMP_NOISE_THRESH     50      /* 电压上升判定阈值: 碳性电池噪声~40, 锂电激活>100 */

/* 体二极管检测(IMP_CHECK方法3): MOSFET关断后BxAD电容通过100K上拉充电,
   线性锂(体二极管阻断)→电压持续爬升, 干电池(体二极管导通)→电压稳定 */
#define DIODE_TEST_TICKS     TICK_PER_SEC   /* 最长等待100tick≈1秒 */
#define DIODE_RISE_THRESH    100            /* 电压上升>100ADC判为爬升 */

/*========================================================================
  温度保护阈值
  NTC型号: CMFA103J3950HANT (10K@25C, B=3950)
  温度>=60C停止充电, 温度<=50C恢复充电(10C回差防抖)
========================================================================*/
#define TEMP_STOP           60      /* 停止充电温度 */
#define TEMP_RESUME         50      /* 恢复充电温度 */

/* VCC 低压保护: 电源过载时 VCC 跌落 → 关闭所有充电防止 ADC 读数异常连锁误判
   B1 NiMH 被误判为 LI_ION 时实测 VCC 从 5061mV 跌至 4032mV (跌落>1000mV) */
#define VCC_UVLO_STOP       4400    /* VCC低于此值(mV): 停止所有充电 */
#define VCC_UVLO_RESUME     4600    /* VCC高于此值(mV): 恢复充电(200mV回差) */

/* NTC ADC配置 (RC5分时复用LED/NTC, C12=22uF滤波, τ≈110ms, 5τ≈550ms) */
#define NTC_SETTLE_ROUNDS    60
#define TEMP_READ_INTERVAL   200

/*========================================================================
  ADC通道定义
  B1AD~B12AD: 独立ADC采样引脚(纯模拟输入), 与B1~B12 MOSFET控制引脚分离
  注: B1~B12为纯数字输出，无需分时复用切换模拟/数字模式
========================================================================*/
#define ADC_CH_B1AD         17    /* B1AD: RC1/AN17 */
#define ADC_CH_B2AD         16    /* B2AD: RC0/AN16 */
#define ADC_CH_B3AD         12    /* B3AD: RB4/AN12 */
#define ADC_CH_B4AD         13    /* B4AD: RB5/AN13 */
#define ADC_CH_B5AD         5     /* B5AD: RA5/AN5 */
#define ADC_CH_B6AD         4     /* B6AD: RA4/AN4 */
#define ADC_CH_B7AD         28    /* B7AD: AN28(高通道, 模拟专用) */
#define ADC_CH_B8AD         29    /* B8AD: AN29(高通道, 模拟专用) */
#define ADC_CH_B9AD         27    /* B9AD: AN27(高通道, 模拟专用) */
#define ADC_CH_B10AD        26    /* B10AD: AN26(高通道, 模拟专用) */
#define ADC_CH_B11AD        7     /* B11AD: RA7/AN7 */
#define ADC_CH_B12AD        6     /* B12AD: RA6/AN6 */
#define ADC_CH_NTC          18    /* NTC: RC2/AN18, VDD参考 */
#define ADC_CH_VREF         31    /* 内部1.2V参考电压(用于计算VDD) */

#define ADC_OK              0xA5  /* ADC采样完成标志: 移位累加32次后返回 */

/*========================================================================
  GPIO引脚宏定义
========================================================================*/
/* 总控引脚 */
#define PIN_PWM             RB7     /* PWM总控输出(VT_PWM1, pin8=RB7/AN15) */
#define PIN_CD1             RC3     /* 充电组控制1(B1-B6) */
#define PIN_CD2             RC5     /* 充电组控制2(B7-B12) */
#define PIN_LED_IO1         RC5     /* LED电源控制1(与CD2分时复用RC5) */
#define PIN_LED_IO2         RC4     /* LED电源控制2 */
#define PIN_EN              RB6     /* 主电源使能(Q3 4435) */

/* B1-B12 独立MOSFET栅极控制引脚
   AO3401 P沟道MOSFET: Gate=Low(0)时导通充电, Gate=High(1)时关闭
   B1=RA0/AN0  B2=RA1/AN1  B3=RB3/AN11  B4=RB2/AN10
   B5=RA3/AN3  B6=RA2/AN2  B7=RD1/AN23  B8=RD3/AN25
   B9=RB0/AN8  B10=RB1/AN9 B11=RD2/AN24 B12=RD0/AN22 */
#define PIN_B1_CTRL         RA0     /* B1: RA0 */
#define PIN_B2_CTRL         RA1     /* B2: RA1 */
#define PIN_B3_CTRL         RB3     /* B3: RB3 */
#define PIN_B4_CTRL         RB2     /* B4: RB2 */
#define PIN_B5_CTRL         RA3     /* B5: RA3 */
#define PIN_B6_CTRL         RA2     /* B6: RA2 */
#define PIN_B7_CTRL         RD1     /* B7: RD1 */
#define PIN_B8_CTRL         RD3     /* B8: RD3 */
#define PIN_B9_CTRL         RB0     /* B9: RB0 */
#define PIN_B10_CTRL        RB1     /* B10: RB1 */
#define PIN_B11_CTRL        RD2     /* B11: RD2 */
#define PIN_B12_CTRL        RD0     /* B12: RD0 */

/*========================================================================
  每槽独立MOSFET控制宏
  AO3401 P沟道: Gate=0时导通充电, Gate=1时关闭
========================================================================*/
/* 打开指定槽位充电(Gate=0, MOSFET导通) */
#define SLOT_CHARGE_ON(idx)    do { \
	switch(idx) { \
	case 0: PIN_B1_CTRL=0; break;  case 1: PIN_B2_CTRL=0; break; \
	case 2: PIN_B3_CTRL=0; break;  case 3: PIN_B4_CTRL=0; break; \
	case 4: PIN_B5_CTRL=0; break;  case 5: PIN_B6_CTRL=0; break; \
	case 6: PIN_B7_CTRL=0; break;  case 7: PIN_B8_CTRL=0; break; \
	case 8: PIN_B9_CTRL=0; break;  case 9: PIN_B10_CTRL=0; break; \
	case 10: PIN_B11_CTRL=0; break; case 11: PIN_B12_CTRL=0; break; \
	} \
} while(0)

/* 关闭指定槽位充电(Gate=1, MOSFET关闭) */
#define SLOT_CHARGE_OFF(idx)   do { \
	switch(idx) { \
	case 0: PIN_B1_CTRL=1; break;  case 1: PIN_B2_CTRL=1; break; \
	case 2: PIN_B3_CTRL=1; break;  case 3: PIN_B4_CTRL=1; break; \
	case 4: PIN_B5_CTRL=1; break;  case 5: PIN_B6_CTRL=1; break; \
	case 6: PIN_B7_CTRL=1; break;  case 7: PIN_B8_CTRL=1; break; \
	case 8: PIN_B9_CTRL=1; break;  case 9: PIN_B10_CTRL=1; break; \
	case 10: PIN_B11_CTRL=1; break; case 11: PIN_B12_CTRL=1; break; \
	} \
} while(0)

/* 关闭所有槽位充电(温度保护时使用) */
#define SLOT_ALL_OFF()  do { \
	PIN_B1_CTRL=1; PIN_B2_CTRL=1; PIN_B3_CTRL=1; PIN_B4_CTRL=1; \
	PIN_B5_CTRL=1; PIN_B6_CTRL=1; PIN_B7_CTRL=1; PIN_B8_CTRL=1; \
	PIN_B9_CTRL=1; PIN_B10_CTRL=1; PIN_B11_CTRL=1; PIN_B12_CTRL=1; \
} while(0)

/*========================================================================
  数据结构定义
========================================================================*/
/* 核心充电状态结构体(6字节) - 仅包含状态机必需字段 */
typedef struct {
	unsigned char state;            /* 充电状态(CHG_xxx) */
	unsigned char type;             /* 电池类型(BAT_TYPE_xxx) */
	unsigned int  voltage;          /* 当前ADC电压值 */
	unsigned int  chargeTimer;      /* 充电计时器(tick) */
} BatterySlot_t;

/* LED闪烁: 全局统一计数器, 所有ERROR槽共用, 替代原3个per-slot数组节省35B RAM */
extern unsigned char g_blinkTick;

/*========================================================================
  全局变量声明(extern)
  定义分散在各模块.c文件中, 避免单Bank内存不足
========================================================================*/
extern volatile unsigned int adresult;      /* ADC采样结果(去极值平均后) */
extern volatile unsigned char test_adc;     /* ADC采样状态标记 */

extern volatile BatterySlot_t g_slot[12];

#define S_STATE(i) g_slot[(unsigned char)(i)].state
#define S_TYPE(i)  g_slot[(unsigned char)(i)].type
#define S_VOLT(i)  g_slot[(unsigned char)(i)].voltage
#define S_TIMER(i) g_slot[(unsigned char)(i)].chargeTimer

/* 系统计时变量 */
extern unsigned int g_temperature;          /* 当前温度(0.1°C), 存储temp_x10 */
extern unsigned char g_tempProtect;         /* 温度保护标志: 1=保护中, 0=正常 */
extern unsigned char g_ccBlocks[12];        /* CC阶段10分钟块计数 */
extern unsigned char g_ovCnt[12];           /* 过压消抖计数器 */
/* g_slotRefV[12]: 槽位参考电压(DETECT初始值+CC/CV峰值), g_capFlag: 电容虚高标记, g_impData: IMP_CHECK共享数据 */
extern unsigned char g_impCheckSlot;        /* IMP_CHECK串行锁: 0xFF=空闲, 其他=持有锁的槽号 */
extern volatile unsigned char g_scanIndex;   /* 当前扫描槽位索引(0-11) */
extern volatile unsigned char g_scanPhase;   /* 当前扫描阶段(0/1/2) */
extern volatile unsigned int  g_vcc_mv;       /* 系统电压(mV), 由VREF反推, ISR定期更新 */
extern volatile unsigned int  g_powerOnTimer;  /* 上电自检计时器 */
extern volatile unsigned char g_powerOnPhase;  /* 上电自检阶段(0/1/2) */

/* NTC读温状态机变量 */
extern volatile unsigned char g_tempPhase;     /* NTC读温状态: 0=等待间隔, 1=建立中 */
extern volatile unsigned int  g_tempSettleCnt; /* NTC建立等待计数器(轮) */
extern volatile unsigned int  g_tempReadRoundCnt; /* 温度读取间隔计数器(轮) */

extern volatile bit g_doAdcSample;          /* ADC采样请求标志 */
extern volatile bit g_adcBusy;              /* ADC忙标志: 主循环采样中, ISR不重复请求 */

/* PWM/CC-CV 控制变量 */
extern volatile unsigned char g_pwmDuty;       /* 当前PWM占空比(0~PWM_MAX) */
extern volatile unsigned char g_pwmCounter;    /* PWM计数器(ISR中递增, 0~31循环) */
extern signed int g_cvIntegral;                /* CV PI积分累加器 */

/* UART通信变量 */
extern volatile bit g_printFlag;

/* 电池检测日志变量(charge_mgr.c中设置, main.c中打印) */
extern volatile bit g_detectLogFlag;        /* 检测日志标志: 检测到NiMH/干电池时置1 */
extern volatile unsigned char g_detectLogSlot;   /* 检测日志槽位(0~11) */
extern volatile unsigned char g_detectLogType;   /* 检测日志电池类型(BAT_TYPE_NIMH/DRY) */

/* 只读配置表(存放于ROM) */
extern const unsigned char s_adcChannels[BATTERY_SLOTS];   /* 12槽BxAD ADC通道映射表 */

/*========================================================================
  函数声明
========================================================================*/
/* 系统初始化与引脚控制 */
void System_Init(void);                     /* 系统初始化(时钟/IO/ADC/UART/Timer) */

/* ADC驱动 */
void AD_Init(void);                         /* ADC模块初始化 */
unsigned char ADC_Sample(unsigned char adch, unsigned char adldo);  /* ADC单次采样(去极值平均) */

/* 充电管理 */
unsigned int Read_Temperature(void);        /* 读取NTC温度(0.1°C), 返回temp_x10 */
unsigned char Detect_BatteryType(unsigned int voltage); /* 根据电压判断电池类型 */
void ChargeProcess_Slot(unsigned char idx); /* 单槽充电状态机处理 */
void Charging_Control(void);                /* 12路充电使能控制(含温度保护) */
void CCCV_Control(void);                    /* CC-CV恒流恒压PWM占空比调节 */

/* LED控制 */
void Update_LED_Slot(unsigned char idx);    /* 根据槽位状态更新LED显示 */
void Led_BlinkProcess(void);                /* LED闪烁计时处理 */
void PowerOnLedSequence(void);              /* 上电LED自检序列 */

/* UART调试输出 */
#if UART_PRINT_EN
void uart_init(void);                       /* 软件UART初始化(RC4) */
void uart_send_char(unsigned char c);       /* 发送单字符 */
void uart_send_string(const unsigned char *str); /* 发送字符串 */
void uart_send_number(unsigned int num);    /* 发送数字 */
#endif

#endif