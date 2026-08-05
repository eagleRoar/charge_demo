# -*- coding: utf-8 -*-
import re
path = r'e:\1.workspace\7.other\17.charge_demo\charge_demo\06-release\SC8F096_Timer_Demo\charge_mgr.c'
with open(path, 'r', encoding='utf-8') as f:
    text = f.read()
# strip string literals, char literals, comments
text2 = re.sub(r'"([^"\\]|\\.)*"', '', text)
text2 = re.sub(r"'([^'\\]|\\.)*'", '', text2)
text2 = re.sub(r'/\*.*?\*/', '', text2, flags=re.S)
text2 = re.sub(r'//.*', '', text2)
stack = []
line = 1
col = 0
ok = True
for ch in text2:
    if ch == '\n':
        line += 1; col = 0
    else:
        col += 1
    if ch in '{([':
        stack.append((ch, line, col))
    elif ch in '})]':
        if not stack:
            print('unmatched %s at line %d col %d' % (ch, line, col))
            ok = False; break
        p, pl, pc = stack.pop()
        if (p=='{' and ch!='}') or (p=='(' and ch!=')') or (p=='[' and ch!=']'):
            print('mismatch %s at %d:%d vs %s at %d:%d' % (p, pl, pc, ch, line, col))
            ok = False; break
if ok:
    if stack:
        print('remaining:', stack[-5:])
    else:
        print('braces ok')
