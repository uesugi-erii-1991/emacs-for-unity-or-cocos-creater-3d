import subprocess
import sys
import os
import logging

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
file_path = ""
line_num = ""
server_name = "my_server"

def start_emacs_server():
    subprocess.run(["emacs", "--daemon=" + server_name])

try:
    # 从配置文件或命令行参数中获取文件路径信息
    file_path = sys.argv[4]
    line_num = "+"+sys.argv[3]
except Exception as e:
    logging.exception("获取命令行参数失败！错误信息：%s" % str(e))
    sys.exit(0)

# 检测 Emacs server 是否正在运行
if subprocess.run(["emacsclient", "-s", server_name, "--eval", "(+ 2 2)"]).returncode != 0:
    # 如果Emacs server未运行，则启动之
    start_emacs_server()

try:
    # 使用 emacsclient 打开文件
    subprocess.Popen(["emacsclient" ,"-s", server_name, "-c", "-n", file_path, line_num])
    logging.info("成功打开文件 %s ，指定行号为：%s" % (file_path, line_num))
except Exception as e:
    logging.exception("打开文件失败！错误信息：%s" % str(e))
    sys.exit(0)