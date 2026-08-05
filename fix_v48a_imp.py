# -*- coding: utf-8 -*-
new_imp = '''\tcase CHG_IMP_CHECK:
\t\tct += tick;
\t\tif(ct < IMP_PULSE_TICKS)
\t\t\tbreak;

\t\t{
\t\t\t/* 实时VCC采样: IMP_CHECK期间MOSFET已导通~80ms */
\t\t\tif(ADC_OK == ADC_Sample(ADC_CH_VREF, 0))
\t\t\t\tg_vcc_mv = (unsigned int)(POWER_RATIO / adresult);

\t\t\t/* ── 电池拔出检测（最高优先级） ──
\t\t\t   脉冲前、后电压均≥OPEN → 确实空槽/已被拔出
\t\t\t   放在pre-voltage shortcut之前, 避免空槽/接触不良被误判为LINEAR_LI并充电 */
\t\t\tif(v >= ADC_V_OPEN && (g_impData & 0x0FFFU) >= ADC_V_OPEN)
\t\t\t{
\t\t\t\tty = BAT_TYPE_UNKNOWN;
\t\t\t\tst = CHG_IDLE;
\t\t\t\tg_impCheckSlot = 0xFF;
\t\t\t\tg_highVFlag &= ~((unsigned int)1 << idx);
\t\t\t\tbreak;
\t\t\t}

\t\t\t/* ── NiMH VCC塌陷检测 ──
\t\t\t   VCC跌落>300mV 且 脉冲后电池端被拉到OPEN
\t\t\t   恒压锂电charger IC也会拉低VCC, 但电池端不会飙升到OPEN, 避免误判 */
\t\t\tif(IMP_VCC_DECODE(g_impData) > g_vcc_mv + 300U && v >= ADC_V_OPEN)
\t\t\t{
\t\t\t\tty = BAT_TYPE_NIMH;
\t\t\t\tst = CHG_ERROR;
\t\t\t\tg_impCheckSlot = 0xFF;
\t\t\t\tg_highVFlag &= ~((unsigned int)1 << idx);
\t\t\t\tg_detectLogSlot = idx;
\t\t\t\tg_detectLogType = BAT_TYPE_NIMH;
\t\t\t\tg_detectLogFlag = 1;
\t\t\t\tbreak;
\t\t\t}

\t\t\t/* ── 恒压锂电: VCC跌落>200mV ── */
\t\t\tif(IMP_VCC_DECODE(g_impData) > g_vcc_mv + 200U)
\t\t\t\tgoto imp_li_ion;

\t\t\t/* ── 碳性/碱性干电池: 脉冲后电压比脉冲前低>1000ADC ── */
\t\t\tif(((g_impData & 0x0FFFU) > v) &&
\t\t\t   ((g_impData & 0x0FFFU) - v) > 1000U)
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

\t\t\t/* ── 高压锂电保护: pre>NEAR_OPEN 且 VCC不塌(<200mV)
\t\t\t   不直接判DRY, 先进DIODE_TEST确认, 避免高压恒压锂/线性锂
\t\t\t   (B10/B11/B12等)被误拒充 */
\t\t\tif(((g_impData & 0x0FFFU) > ADC_V_NEAR_OPEN) &&
\t\t\t   (IMP_VCC_DECODE(g_impData) <= g_vcc_mv + 200U))
\t\t\t{
\t\t\t\tgoto imp_diode_test_entry;
\t\t\t}

\t\t\t/* ── 脉冲后≥OPEN → 进DIODE_TEST进一步确认 ──
\t\t\t   可能是线性锂/恒压锂/镍氢, DIODE_TEST用爬升区分Li与DRY/NiMH */
\t\t\tif(v >= ADC_V_OPEN)
\t\t\t\tgoto imp_diode_test_entry;

\t\timp_diode_test_entry:
\t\t\t/* ── 进入DIODE_TEST ──
\t\t\t   保持IMP_CHECK串行锁不释放, 防止g_impData基准被其它槽改写 */
\t\t\tst = CHG_IMP_DIODE_TEST;
\t\t\tct = 0;
\t\t\tg_highVFlag &= ~((unsigned int)1 << idx);
\t\t}
\t\tbreak;
'''
path = r'e:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\charge_mgr.c'
with open(path, 'r', encoding='utf-8') as f:
    lines = f.readlines()
# Replace lines 401..520 (0-based) inclusive: from case CHG_IMP_CHECK to break before imp_li_ion
lines[401:521] = [new_imp]
with open(path, 'w', encoding='utf-8') as f:
    f.writelines(lines)
print('imp replaced')
