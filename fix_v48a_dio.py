# -*- coding: utf-8 -*-
new_dio = '''\t/*========================================================================
\t  CHG_IMP_DIODE_TEST: 体二极管被动检测 (V48A)
\t  MOSFET关断, BxAD电容通过100K上拉充电, 观察电压爬升
\t  线性锂(体二极管阻断): 电容持续爬升>DIODE_RISE_THRESH
\t  镍氢/干电池(体二极管导通或内阻大): 电压被钳位, 爬升不足
\t========================================================================*/
\tcase CHG_IMP_DIODE_TEST:
\t\tct += tick;
\t\t{
\t\t\t/* 电池拔出检查: 线性锂误插后拔出→电压回落至OPEN */
\t\t\tif(v >= ADC_V_OPEN && (g_impData & 0x0FFFU) < ADC_V_OPEN)
\t\t\t{
\t\t\t\t/* 预脉冲非OPEN但当前OPEN: 电容正在充电中, 不是真拔出 */
\t\t\t}

\t\t\t/* 电压爬升检测: 当前电压-脉冲前电压 > DIODE_RISE_THRESH → Li */
\t\t\tif(v > (g_impData & 0x0FFFU) + DIODE_RISE_THRESH)
\t\t\t{
\t\t\t\t/* 用IMP_CHECK期间记录的VCC跌落区分CV锂与线性锂:
\t\t\t\t   跌落>150mV → 恒压锂, 否则 → 线性锂 */
\t\t\t\tif(IMP_VCC_DECODE(g_impData) > g_vcc_mv + 150U)
\t\t\t\t\tgoto imp_li_ion;
\t\t\t\telse
\t\t\t\t\tgoto imp_linear_li;
\t\t\t}

\t\t\t/* NiMH上拉虚高保护:
\t\t\t   脉冲前≤2300但DIODE_TEST期间电压>2900, 说明是100K上拉把电池/电容
\t\t\t   充起来的虚假高电平, 判DRY拒充, 避免镍氢被误判为LINEAR_LI. */
\t\t\tif((v > ADC_V_NIMH_MAX) &&
\t\t\t   ((g_impData & 0x0FFFU) <= 2300U))
\t\t\t{
\t\t\t\tty = BAT_TYPE_DRY;
\t\t\t\tst = CHG_ERROR;
\t\t\t\tg_impCheckSlot = 0xFF;
\t\t\t\tg_highVFlag &= ~((unsigned int)1 << idx);
\t\t\t\tg_detectLowCnt[idx] = 0;
\t\t\t\tg_detectLogSlot = idx;
\t\t\t\tg_detectLogType = BAT_TYPE_DRY;
\t\t\t\tg_detectLogFlag = 1;
\t\t\t\tbreak;
\t\t\t}

\t\t\t/* 超时: 无爬升 → 干电池 */
\t\t\tif(ct >= DIODE_TEST_TICKS)
\t\t\t{
\t\t\t\tty = BAT_TYPE_DRY;
\t\t\t\tst = CHG_ERROR;
\t\t\t\tg_impCheckSlot = 0xFF;
\t\t\t\tg_highVFlag &= ~((unsigned int)1 << idx);
\t\t\t\tg_detectLowCnt[idx] = 0;
\t\t\t\tg_detectLogSlot = idx;
\t\t\t\tg_detectLogType = BAT_TYPE_DRY;
\t\t\t\tg_detectLogFlag = 1;
\t\t\t}
\t\t}
\t\tbreak;
'''
path = r'e:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\charge_mgr.c'
with open(path, 'r', encoding='utf-8') as f:
    lines = f.readlines()
# Replace lines 510..589 (0-based) inclusive: the old DIODE_TEST case block
lines[510:590] = [new_dio]
with open(path, 'w', encoding='utf-8') as f:
    f.writelines(lines)
print('dio replaced')
