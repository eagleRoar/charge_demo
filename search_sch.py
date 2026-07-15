import re

# Search for key patterns in the UTF-16 text
with open(r'e:\1.workspace\7.other\17.charge_demo\charge_demo\temp_utf16.txt', 'r', encoding='utf-8') as f:
    text = f.read()

keywords = [
    'AN0', 'AN1', 'AN2', 'AN3', 'AN4', 'AN5', 'AN6', 'AN7', 'AN8', 'AN9',
    'AN10', 'AN11', 'AN12', 'AN13', 'AN14', 'AN15', 'AN16', 'AN17', 'AN18', 'AN19',
    'AN20', 'AN21', 'AN22', 'AN23', 'AN24', 'AN25', 'AN26', 'AN27', 'AN28', 'AN29', 'AN30', 'AN31',
    'B1AD', 'B2AD', 'B3AD', 'B4AD', 'B5AD', 'B6AD', 'B7AD', 'B8AD', 'B9AD', 'B10AD', 'B11AD', 'B12AD',
    'NTC', 'RC0', 'RC1', 'RC2', 'RC3', 'RC4', 'RC5', 'RC6', 'RC7',
    'RA0', 'RA1', 'RA2', 'RA3', 'RA4', 'RA5', 'RA6', 'RA7',
    'RB0', 'RB1', 'RB2', 'RB3', 'RB4', 'RB5', 'RB6', 'RB7',
    'RD0', 'RD1', 'RD2', 'RD3', 'RD4', 'RD5', 'RD6', 'RD7',
    'SENSE', 'ADC', 'VOLTAGE', 'BATTERY', 'VDD', 'VSS',
    '10K', '100K', '分压', '电池',
]

print('=== Searching keyword matches (UTF-16 text) ===')
for kw in keywords:
    pattern = re.compile(re.escape(kw), re.IGNORECASE)
    found = False
    for m in re.finditer(pattern, text):
        start = max(0, m.start() - 60)
        end = min(len(text), m.end() + 60)
        ctx = text[start:end].replace('\n', ' ').replace('\r', ' ').strip()
        ctx = ' '.join(ctx.split())
        if not found:
            found = True
        print(f'  [{kw}] ...{ctx}...')
    if not found:
        print(f'  [{kw}] NOT FOUND')
