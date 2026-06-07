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
    NTC        : RC5/AN21      温度检测(CMFA103J3950HANT,10K上拉)
    LED IO1    : RC5/AN21      LED电源控制1(与NTC分时复用,与DAT共用)
    LED IO2    : RC4/AN20      LED电源控制2(与CLK共用)
    PWM        : RB7/AN15      PWM总控输出(pin8)
    CD IO1     : RC3/AN19      充电组控制1(B1-B6组)
    CD IO2     : RC2/AN18      充电组控制2(B7-B12组)
    EN         : RB6/AN14      主电源使能(Q3 4435)
    VCC_SW     : RC0           电源切换(Q19 SS8050->Q17 9435A)
    UART TX    : RB3           UART发送(调试用,与B3共用RB3)
    UART RX    : RB4           UART接收
    CLK/DAT    : RC4/RC5       ICSP调试接口(与LED IO2/LED IO1共用RC4/RC5)
-------------------------------------------*/
#ifndef __CONFIG_H__
#define __CONFIG_H__

#include <sc.h>

/* --- 系统时钟配置 --- */
#ifndef _XTAL_FREQ
#define _XTAL_FREQ 16000000     /* 系统时钟: 16MHz */
#endif

/* --- 电源电压检测参数 --- */
/* 电源电压 = ADC值 * 1.2V(内部参考) / 4096 * 1000(转mV) */
#define POWER_RATIO        (4096UL*1.2*1000)
#define UART_PRINT_EN      1       /* UART调试输出开关: 1=启用, 0=禁用 */

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

/*========================================================================
  电池类型枚举
  通过开路电压判断电池类型, 决定是否充电
========================================================================*/
#define BAT_TYPE_UNKNOWN   0       /* 未知类型 */
#define BAT_TYPE_LI_ION    1       /* 锂电池: 正常充电 */
#define BAT_TYPE_NIMH      2       /* 镍氢电池: 不充电, 报错 */
#define BAT_TYPE_DRY       3       /* 干电池: 不充电, 报错 */
#define BAT_TYPE_SHORT     4       /* 短路: 不充电, 报错 */

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
  参考电压: LDO=3V, 12位ADC(0~4095), 电池分压比1/11
  实际电池电压 = ADC值 * 3V / 4096 * 11
  例如: ADC_V_FULL=188 -> 电池电压 = 188*3/4096*11 = 1.52V
========================================================================*/
#define ADC_V_FULL          188    /* 1.52V: 锂电池满电电压 */
#define ADC_V_OVER          198    /* 1.60V: 过充保护阈值 */
#define ADC_V_PRE_MIN       62     /* 0.50V: 预充下限 */
#define ADC_V_PRE_MAX       124    /* 1.00V: 预充上限, 进入恒流充电 */
#define ADC_V_ACTIVATE      12     /* 0.10V: 激活阈值, 低于此值需脉冲激活 */
#define ADC_V_SHORT         5      /* 0.04V: 短路判断阈值 */
#define ADC_V_NIMH_LOW      136    /* 1.10V: 镍氢电池电压下限 */
#define ADC_V_NIMH_HIGH     161    /* 1.30V: 镍氢电池电压上限 */

/*========================================================================
  充电时间阈值
  说明: chargeTimer在ChargeProcess_Slot中每次+1, 每轮扫描(12槽×3阶段=36次Timer0)调用一次
  Timer0周期250us, 每轮扫描=36×250us=9ms, 1秒≈1000/9≈111个tick
========================================================================*/
#define TICK_PER_SEC        111                           /* 1秒对应的扫描tick数 */
#define TIME_ACTIVATE_MAX   (60 * TICK_PER_SEC)            /* 激活超时: 60秒 */
#define TIME_PRECHARGE_MAX  (300 * TICK_PER_SEC)           /* 预充超时: 300秒(5分钟) */
#define TIME_CHARGE_MAX     (10800 * TICK_PER_SEC)         /* 充电超时: 10800秒(3小时) */
#define TIME_DETECT_WAIT    (2 * TICK_PER_SEC)             /* 检测等待: 2秒 */
#define TIME_CV_HOLD        (600 * TICK_PER_SEC)           /* CV恒压保持: 600秒(10分钟) */

/*========================================================================
  温度保护阈值
  NTC型号: CMFA103J3950HANT (10K@25C, B=3950)
  温度>=60C停止充电, 温度<=50C恢复充电(10C回差防抖)
========================================================================*/
#define TEMP_STOP           60      /* 停止充电温度 */
#define TEMP_RESUME         50      /* 恢复充电温度 */

/*========================================================================
  ADC通道定义
  注: B1-B12的ADC通道与MOSFET控制引脚共用同一物理引脚,
  需在扫描时切换模拟/数字模式(分时复用)
========================================================================*/
#define ADC_CH_B1           0       /* B1: RA0/AN0 */
#define ADC_CH_B2           1       /* B2: RA1/AN1 */
#define ADC_CH_B3           11      /* B3: RB3/AN11 */
#define ADC_CH_B4           10      /* B4: RB2/AN10 */
#define ADC_CH_B5           3       /* B5: RA3/AN3 */
#define ADC_CH_B6           2       /* B6: RA2/AN2 */
#define ADC_CH_B7           23      /* B7: RD1/AN23 */
#define ADC_CH_B8           25      /* B8: RD3/AN25 */
#define ADC_CH_B9           8       /* B9: RB0/AN8 */
#define ADC_CH_B10          9       /* B10: RB1/AN9 */
#define ADC_CH_B11          24      /* B11: RD2/AN24 */
#define ADC_CH_B12          22      /* B12: RD0/AN22 */
#define ADC_CH_NTC          21      /* NTC: RC5/AN21 */
#define ADC_CH_VREF         31      /* 内部1.2V参考电压(用于计算VDD) */

/*========================================================================
  GPIO引脚宏定义
========================================================================*/
/* 总控引脚 */
#define PIN_PWM             RB7     /* PWM总控输出(VT_PWM1, pin8=RB7/AN15) */
#define PIN_CD1             RC3     /* 充电组控制1(B1-B6) */
#define PIN_CD2             RC2     /* 充电组控制2(B7-B12) */
#define PIN_LED_IO1         RC5     /* LED电源控制1(与NTC分时复用RC5) */
#define PIN_LED_IO2         RC4     /* LED电源控制2 */
#define PIN_EN              RB6     /* 主电源使能(Q3 4435) */
#define PIN_VCC_SW          RC0     /* 电源切换控制 */

/* B1-B12 独立MOSFET栅极控制引脚
   AO3401 P沟道MOSFET: Gate=Low(0)时导通充电, Gate=High(1)时关闭
   B1=RA0/AN0  B2=RA1/AN1  B3=RB3/AN11  B4=RB2/AN10
   B5=RA3/AN3  B6=RA2/AN2  B7=RD1/AN23  B8=RD3/AN25
   B9=RB0/AN8  B10=RB1/AN9 B11=RD2/AN24 B12=RD0/AN22 */
#define PIN_B1_CTRL         RA0     /* B1: RA0 */
#define PIN_B2_CTRL         RA1     /* B2: RA1 */
#define PIN_B3_CTRL         RB3     /* B3: RB3(与UART TX共用) */
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
/* 单槽电池状态结构体(12字节)
   注: 为节省RAM, stableCnt和activatePulseCnt使用unsigned char */
typedef struct {
	unsigned char type;             /* 电池类型(BAT_TYPE_xxx) */
	unsigned char state;            /* 充电状态(CHG_xxx) */
	unsigned char ledState;         /* LED状态(LED_xxx) */
	unsigned int  voltage;          /* 当前ADC电压值 */
	unsigned int  chargeTimer;      /* 充电计时器(tick) */
	unsigned int  blinkTimer;       /* LED闪烁计时器(tick) */
	unsigned char blinkPhase;       /* LED闪烁相位(0/1交替) */
	unsigned char stableCnt;        /* 稳定计数器 */
	unsigned char activatePulseCnt; /* 激活脉冲计数 */
} BatterySlot_t;

/* 槽位引脚配置表结构体
   用于分时复用: 同一引脚在ADC测量时设为模拟输入,
   在MOSFET控制时设为数字输出 */
typedef struct {
	volatile unsigned char *tris_reg;  /* TRIS寄存器地址 */
	volatile unsigned char *port_reg;  /* PORT寄存器地址 */
	unsigned char pin_mask;            /* 引脚位掩码 */
	volatile unsigned char *ansel_reg; /* ANSEL寄存器地址 */
	unsigned char ansel_mask;          /* 模拟选择位掩码 */
} SlotPinConfig_t;

/*========================================================================
  全局变量声明(extern)
  定义分散在各模块.c文件中, 避免单Bank内存不足
========================================================================*/
extern volatile unsigned int adresult;      /* ADC采样结果(去极值平均后) */
extern volatile unsigned int power_ad;      /* 电源电压(mV) */
extern volatile unsigned char test_adc;     /* ADC采样状态标记 */

/* 槽位数据: 拆分为两个6元素数组, 分别放入不同RAM Bank
   每数组72字节(6*12), 可放入Bank0(96字节)和Bank1(80字节) */
extern BatterySlot_t g_slot0[6];            /* B1-B6 槽位数据 */
extern BatterySlot_t g_slot1[6];            /* B7-B12 槽位数据 */

/* 透明访问宏: 根据索引自动选择对应数组 */
#define GSLOT(idx) (((idx) < 6) ? &g_slot0[(idx)] : &g_slot1[(idx)-6])

/* 系统计时变量 */
extern unsigned int  g_timerTick;           /* Timer0中断计数(250us/tick) */
extern unsigned int  g_systemTick;          /* 系统秒计数(4000tick=1s) */
extern unsigned int  g_ntcAdc;             /* NTC ADC原始值 */
extern unsigned char g_temperature;         /* 当前温度(摄氏度) */
extern unsigned char g_tempProtect;         /* 温度保护标志: 1=保护中, 0=正常 */
extern unsigned char g_scanIndex;           /* 当前扫描槽位索引(0-11) */
extern unsigned char g_scanPhase;           /* 当前扫描阶段(0/1/2) */
extern unsigned int  g_powerOnTimer;        /* 上电自检计时器 */
extern unsigned char g_powerOnPhase;        /* 上电自检阶段(0/1/2) */

/* UART通信变量 */
extern unsigned char RxTable[10];           /* 接收缓冲区 */
extern bit RXOK_f;                          /* 接收完成标志 */

/* 只读配置表(存放于ROM) */
extern const unsigned char s_adcChannels[BATTERY_SLOTS];   /* 12槽ADC通道映射表 */
extern const SlotPinConfig_t s_slotPins[BATTERY_SLOTS];    /* 12槽引脚配置表 */

/*========================================================================
  函数声明
========================================================================*/
/* 系统初始化与引脚控制 */
void System_Init(void);                     /* 系统初始化(时钟/IO/ADC/UART/Timer) */
void SlotPin_ToAnalog(unsigned char idx);   /* 槽位引脚切换为模拟输入(ADC测量) */
void SlotPin_ToDigital(unsigned char idx);  /* 槽位引脚切换为数字输出(MOSFET控制) */

/* ADC驱动 */
void AD_Init(void);                         /* ADC模块初始化 */
unsigned char ADC_Sample(unsigned char adch, unsigned char adldo);  /* ADC单次采样(去极值平均) */
unsigned int  ADC_ReadChannel(unsigned char ch);                    /* 读取指定ADC通道 */

/* 充电管理 */
unsigned char Read_Temperature(void);       /* 读取NTC温度(摄氏度) */
unsigned char Detect_BatteryType(unsigned int voltage); /* 根据电压判断电池类型 */
void ChargeProcess_Slot(unsigned char idx); /* 单槽充电状态机处理 */
void Charging_Control(void);                /* 12路充电使能控制(含温度保护) */

/* LED控制 */
void Update_LED_Slot(unsigned char idx);    /* 根据槽位状态更新LED显示 */
void Led_BlinkProcess(void);                /* LED闪烁计时处理 */
void PowerOnLedSequence(void);              /* 上电LED自检序列 */

/* UART调试输出 */
#if UART_PRINT_EN
void uart_send_char(unsigned char c);       /* 发送单字符 */
void uart_send_string(const unsigned char *str); /* 发送字符串 */
void uart_send_number(unsigned int num);    /* 发送数字 */
void Print_Status(void);                    /* 打印系统状态 */
#endif

#endif