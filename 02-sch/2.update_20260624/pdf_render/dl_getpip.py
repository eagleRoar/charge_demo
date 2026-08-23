import urllib.request, sys

url = "https://bootstrap.pypa.io/pip/3.9/get-pip.py"
out = r"e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\pdf_render\get-pip.py"
try:
    req = urllib.request.Request(url, headers={"User-Agent": "Mozilla/5.0"})
    data = urllib.request.urlopen(req, timeout=30).read()
    print("downloaded bytes:", len(data))
    with open(out, "wb") as f:
        f.write(data)
    print("written OK")
except Exception as e:
    print("ERROR:", repr(e))
