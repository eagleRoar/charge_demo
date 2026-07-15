import zipfile, re

docx_path = r'e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\L1221 TOP V2.3.docx'
try:
    z = zipfile.ZipFile(docx_path, 'r')
    xml = z.read('word/document.xml').decode('utf-8')
except:
    # Try the other file
    docx_path = r'e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\原理图.docx'
    z = zipfile.ZipFile(docx_path, 'r')
    xml = z.read('word/document.xml').decode('utf-8')

# Find all text in w:t tags (standard Word text)
texts = re.findall(r'<w:t[^>]*>([^<]+)</w:t>', xml)
print("=== Word text content ===")
for t in texts:
    if t.strip():
        print(t)

# Find alt text in drawings  
alttext = re.findall(r'descr="([^"]*)"', xml)
print("\n=== Alt text ===")
for a in alttext:
    if a.strip():
        print(a)

# Find image references
images = re.findall(r'r:embed="([^"]*)"', xml)
print("\n=== Image refs ===", images)

z.close()
