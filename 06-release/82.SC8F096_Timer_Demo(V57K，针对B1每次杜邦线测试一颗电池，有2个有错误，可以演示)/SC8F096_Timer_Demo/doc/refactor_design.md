# L1211 12槽充电器 · 单槽同步控制架构重构设计

> 版本：V54X（基于 V54W 重构）
> 目标：消除跨槽串扰与时序问题，增加 VCC 归一化，简化控制流。

## 1. 问题与目标

### 1.1 现状痛点

1. 扫描由 Timer0 ISR 的三阶段状态机驱动（Phase0 请求 ADC → Phase1 LED → Phase2 仅在槽0做 VCC/充电控制/PWM），主循环再异步执行 `Do_AdcSample()` + `ChargeProcess_Slot(i)`。
2. 单槽的 ADC 采样、VCC 采样、MOSFET 控制被拆散在不同 ISR 阶段/不同槽位，`pre/now` 实际跨越多个扫描轮，其他槽充电噪声会污染当前槽。
3. VCC 每轮只在槽0采样一次，其他槽 IMP_CHECK 使用滞后 VCC。
4. 所有阈值（`ADC_V_FULL/OPEN/NEAR_OPEN/...`）都是 VCC≈5000mV 的原始 ADC 值，但 ADC 参考是 VDD（比例式），VCC 在 4600~5180 波动时，同一物理电压读出的 ADC 不同 → 同一颗镍氢放 B2 与 B11 读数不一致。

### 1.2 目标

- 每个槽一个完整函数 `Slot_Charge_Ctrl(i)`，控制第几个槽就调用 `Slot_Charge_Ctrl(i)`。
- 函数内实时采集 BxAD 与 VCC，`pre=get_adc(); ... now=get_adc();`，消除跨槽串扰与跨轮时序问题。
- 全部 ADC 值先归一化到 VCC=5000 基准再判阈值。
- 代码简洁、参数少、无复杂扫描状态机；保留 V54K~V54W 全部判定逻辑/阈值/修正，行为理论上等价。
- 删除不再使用的变量/死代码，节省 RAM。

## 2. 新架构总览

去掉 ISR 三阶段扫描状态机，改为 main loop 顺序轮询：

```c
while(1) {
    asm("clrwdt");

    Get_Vcc();                        /* 每轮一次：归一化基准（慢变量，8ms 级延迟无影响） */

    for(i = 0; i < BATTERY_SLOTS; i++) {
        Slot_Charge_Ctrl(i);          /* 单槽：关 MOSFET → 稳定 → 采样归一化 → 状态机 → 控制 MOSFET */
    }

    CCCV_Control();                   /* 全局 PWM 占空比（保留） */
    Update_LED_Global();              /* 全局 LED（保留，改名） */

    /* NTC 采样 / UART 打印按间隔触发 */
}
```

ISR 只保留：软件 PWM 生成、上电自检 LED、喂狗、NTC 计时、UART 计时。

## 3. 单槽函数 `Slot_Charge_Ctrl(i)`

```c
void Slot_Charge_Ctrl(unsigned char idx)
{
    unsigned char st, ty;
    unsigned int  v, ct;
    unsigned char dly;

    SLOT_RD_ALL(idx, st, ty, v, ct);

    /* 1. 关本槽 MOSFET，按状态稳定延时 */
    SLOT_CHARGE_OFF(idx);
    if(st == CHG_DETECT || st == CHG_IMP_CHECK || st == CHG_IMP_DIODE_TEST) {
        for(dly = 0; dly < 20; dly++) __delay_us(100);   /* 2000us */
    } else {
        __delay_us(100);
    }

    /* 2. 采样 BxAD 并归一化到 VCC=5000（伪OPEN时保留旧值） */
    {
        unsigned int newv = Adc_Norm(s_adcChannels[idx]);
        if(!(ty == BAT_TYPE_LINEAR_LI && (st == CHG_CC_CHARGE || st == CHG_CV_CHARGE)
             && newv >= ADC_V_OPEN)) {
            v = newv;
        }
    }

    /* 3. 状态机：IDLE/DETECT/IMP/DIODE/ACT/PRE/CC/CV/FULL/ERROR（沿用 V54W 判定） */
    switch(st) { ... }

    /* 4. 写回 */
    SLOT_WR_ALL(idx, st, ty, v, ct);

    /* 5. 依据结果控制本槽 MOSFET */
    if(st == CHG_ACTIVATE || st == CHG_PRECHARGE || st == CHG_CC_CHARGE ||
       st == CHG_CV_CHARGE || st == CHG_IMP_CHECK || st == CHG_DETECT)
        SLOT_CHARGE_ON(idx);
    else
        SLOT_CHARGE_OFF(idx);
}
```

## 4. VCC 归一化（核心）

```c
#define VCC_REF_MV  5000UL

unsigned int Get_Vcc(void)                    /* 采样 VREF → 真实 VCC(mV) */
{
    if(ADC_OK == ADC_Sample(ADC_CH_VREF, 0)) {
        unsigned long pt = POWER_RATIO / adresult;
        g_vcc_mv = (unsigned int)pt;
    }
    return g_vcc_mv;
}

unsigned int Adc_Norm(unsigned char ch)       /* 采样通道 → 归一化到 VCC=5000 */
{
    unsigned int raw;
    if(ADC_OK != ADC_Sample(ch, 0)) return 0;
    raw = adresult;
    if(g_vcc_mv == 0) return raw;             /* 防除0 */
    return (unsigned int)(((unsigned long)raw * VCC_REF_MV) / (unsigned long)g_vcc_mv);
}
```

**应用规则**

- 内部所有电压变量（`S_VOLT`、`g_slotRefV`、`pre/now`）一律存归一化 ADC。
- 阈值 `ADC_V_*`、`NIMH_*`、`PEAK_DROP_THRESH` 等全部保持现状不变。
- 显示时打印归一化 ADC + 实时 VCC，可直接对比不同槽。

**关键修正：`DETECT_LI_ROUTE` 与 `Print_SystemStatus` 改用固定基准 5000，防双重 VCC**

```c
vx_mv      = (unsigned long)v * VCC_REF_MV / 4096UL;
bat_mv_long = ALPHA_NUM * vx_mv + BETA_NUM * VCC_REF_MV;
bat_mv     = (bat_mv_long + CAL_DEN/2UL) / CAL_DEN;
```

## 5. 与现有代码映射

| 现有 | 处理 |
|---|---|
| ISR 三阶段扫描（`g_scanIndex/g_scanPhase`） | 删除 |
| `Do_AdcSample()` | 并入 `Slot_Charge_Ctrl` |
| `ChargeProcess_Slot(idx)` | 改造为 `Slot_Charge_Ctrl(idx)` |
| `Charging_Control()` | 删除（MOSFET 开关并入单槽函数） |
| `CCCV_Control()` | 保留，每轮调用一次 |
| `Update_LED_Slot(idx)` | 改名 `Update_LED_Global()`，每轮一次 |
| `Detect_BatteryType()` | 保留，输入改归一化电压 |
| `g_impData`/`g_impCheckSlot` | 保留（IMP/DIODE 跨轮仍需共享 pre 与串行锁） |
| `g_doAdcSample`/`g_adcBusy` | 删除 |

## 6. 时序与串扰说明

- main loop 顺序处理 12 槽，任一时刻只有当前槽在采样，天然无跨槽 ADC 串扰。
- 归一化基准 VCC 每轮采样一次（慢变量），IMP_CHECK 内仍单独实时采 VCC 判跌落。
- 阻塞式稳定延时（100/2000us）期间 ISR 仍运行生成 PWM，其他槽充电不受影响。
- `__delay_us` 不关 GIE，保证 ISR 喂狗 + PWM 不中断。

## 7. 风险与验证

**风险**

1. main loop 单轮周期可能变化，`TICK_PER_SEC` 需上板重校。
2. `DETECT_LI_ROUTE` 双重 VCC 补偿（已在 §4 修正）。
3. 大改后需回归 V54K~V54W 的 B1~B12 已知误判/误杀案例。

**验证**

1. SCMCU IDE 单文件合并编译通过。
2. 串口：同颗镍氢放 B2 与 B11，归一化后 ADC 应一致。
3. VCC 4600 / 5180 两组电源下，检测与充电行为一致。
4. 回归 B1 碱性 / B3 碳性 / B4·B6·B8·B10·B11 线性锂 / B5·B9·B12 恒压锂。

## 8. 迁移步骤

1. 新增 `Get_Vcc()` / `Adc_Norm()`，`config.h` 加 `VCC_REF_MV` 与声明。
2. 改 `main.c`：去三阶段扫描，main loop 轮询；ISR 精简。
3. 改 `charge_mgr.c`：`ChargeProcess_Slot` → `Slot_Charge_Ctrl`，`DETECT_LI_ROUTE` 固定基准，删 `Charging_Control`。
4. 改 `led.c`：`Update_LED_Slot` → `Update_LED_Global`。
5. 编译 + 上板串口验证 + 重校 tick 时间常数。
