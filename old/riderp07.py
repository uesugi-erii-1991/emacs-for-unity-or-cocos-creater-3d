import subprocess
import sys
import os

from subprocess import *
file_path = sys.argv[4]
# 打开文件的行号
line="+"+sys.argv[3]
line2=sys.argv[0]
server_name="server_name"
def start_emacs_server(server_name):
    subprocess.run(["emacs", "--daemon=" + server_name])

if subprocess.run(["emacsclient", "-s", server_name, "--eval", "(+ 2 2)"]).returncode != 0:
    # Emacs server not running, start it
    start_emacs_server("server-name")
# Open file using emacsclient
subprocess.Popen(["emacsclient" ,"-s",server_name,"-c", "-n", file_path, line])
