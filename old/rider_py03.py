import subprocess
import sys
import os

print(sys.argv)
from subprocess import *
print(sys.argv)
file_path = sys.argv[4]
# 打开文件的行号
line="+"+sys.argv[3]
print(line)
line2=sys.argv[0]
print(line2)
print(["emacsclient.exe" ,"-n",line,file_path])

subprocess.Popen(["emacsclient" ,"-s","server-name"])

subprocess.Popen(["emacsclient.exe" ,"-n",line,file_path])




# print((" --no-wait  "+ sys.argv[4:]))
# subprocess.Popen(["emacsclient.exe"] +(" --no-wait  "+ sys.argv[4:]))
# subprocess.Popen(["emacsclient.exe" ,"--no-wait",file_path])
# subprocess.Popen(["emacsclient.exe" ,file_path])
# output, error = process.communicate()
# subprocess.Popen(["emacsclient.exe"],"--no-wait",sys.argv[4:])