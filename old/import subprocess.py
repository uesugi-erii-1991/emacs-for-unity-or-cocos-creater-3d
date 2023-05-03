import subprocess
import sys

from subprocess import *
subprocess.run(["emacsclient.exe"] + sys.argv[4:])



import subprocess
import sys
import os

from subprocess import *
file_path = sys.argv[4]
print((" --no-wait  "+ sys.argv[4:]))
subprocess.Popen(["emacsclient.exe"] +(" --no-wait  "+ sys.argv[4:]))