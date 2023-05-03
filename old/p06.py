import psutil

def is_emacs_server_running(server_name):
    for proc in psutil.process_iter(['pid', 'name']):
        if proc.name() == 'emacs.exe' and '-server' in proc.cmdline() and server_name in proc.cmdline():
            return True
    return False

# 调用函数
if is_emacs_server_running('server-name'):
    print("Emacs server is running.")
else:
    print("Emacs server is not running.")


