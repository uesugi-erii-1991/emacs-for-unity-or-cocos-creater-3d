import subprocess

try:
    output = subprocess.check_output("ps -ef | grep /usr/bin/emacs", shell=True)
except subprocess.CalledProcessError as e:
    output = e.output
    
if "emacs --daemon" in output:
    # emacs server is already running
else:
    # start emacs server


import os

if "emacs --daemon" in output:
    # start emacs client with arguments
    os.system("emacsclient -n /path/to/file")
else:
    # start emacs server and then start emacs client with arguments
    os.system("emacs --daemon")
    os.system("emacsclient -n /path/to/file")
