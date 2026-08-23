import zipfile, os, glob

zpath = r"e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\kicad\.history\L1221 TOP V2.3-backups\L1221 TOP V2.3-2026-08-06_144321.zip"
print("zip exists:", os.path.exists(zpath))
if os.path.exists(zpath):
    with zipfile.ZipFile(zpath) as z:
        for n in z.namelist():
            print(" ", n)

print("\n--- kicad-cli search ---")
candidates = [
    r"C:\Program Files\KiCad\8.0\bin\kicad-cli.exe",
    r"C:\Program Files\KiCad\9.0\bin\kicad-cli.exe",
    r"C:\Program Files\KiCad\7.0\bin\kicad-cli.exe",
    r"C:\Program Files\KiCad\6.0\bin\kicad-cli.exe",
]
for c in candidates:
    print(c, os.path.exists(c))

print("\n--- kicad dirs ---")
for d in glob.glob(r"C:\Program Files\KiCad*"):
    print(d, os.path.isdir(d))
    for sub in glob.glob(os.path.join(d, "*")):
        print("   ", sub)
