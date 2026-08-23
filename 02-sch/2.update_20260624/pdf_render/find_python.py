import os, glob, sys

print("== user profile python ==")
for p in glob.glob(os.path.expandvars(r"%LOCALAPPDATA%\Programs\Python\*\python.exe")):
    print(p)
print("== C:\\Python* ==")
for p in glob.glob(r"C:\Python*\python.exe"):
    print(p)
print("== conda ==")
for c in [r"C:\ProgramData\anaconda3\python.exe", r"C:\ProgramData\miniconda3\python.exe",
          os.path.expandvars(r"%USERPROFILE%\anaconda3\python.exe"),
          os.path.expandvars(r"%USERPROFILE%\miniconda3\python.exe"),
          os.path.expandvars(r"%USERPROFILE%\AppData\Local\anaconda3\python.exe"),
          os.path.expandvars(r"%USERPROFILE%\AppData\Local\miniconda3\python.exe")]:
    print(c, os.path.exists(c))
print("== D: python ==")
for p in glob.glob(r"D:\*\python.exe"):
    print(p)
for p in glob.glob(r"D:\*\*\python.exe"):
    print(p)
