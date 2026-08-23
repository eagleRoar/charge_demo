@echo off
setlocal
set "EDGE=C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
set "OUT=e:\1.workspace\7.other\17.charge_demo\charge_demo\02-sch\2.update_20260624\pdf_render"
set "PDF=file:///e:/1.workspace/7.other/17.charge_demo/charge_demo/02-sch/2.update_20260624/L1221%%20TOP%%20V2.3.pdf"
"%EDGE%" --headless --disable-gpu --no-sandbox --disable-extensions --hide-scrollbars --screenshot="%OUT%\page1.png" --window-size=1700,1300 "%PDF%"
dir "%OUT%"
