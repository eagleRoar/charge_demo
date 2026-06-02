import fitz

doc = fitz.open(r'e:\1.workspace\7.other\17.charge_demo\charge_demo\01-data\SC8F096AD832NPR_QFN32开发资料\SC8F096用户手册_V1.0.3.pdf')
print('Pages:', len(doc))

for i in range(20):
    text = doc[i].get_text()
    if len(text.strip()) > 100:
        print(f'\n===PAGE {i+1} (len={len(text)})===')
        print(text[:5000])
doc.close()