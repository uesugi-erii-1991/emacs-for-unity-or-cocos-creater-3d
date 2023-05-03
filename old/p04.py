import subprocess

def start_emacs():
    # Check if the service mode is running
    cmd = "emacsclient -e '(featurep 'your-service-mode)'"
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    
    if "t" in result.stdout:
        # Service mode is running, start Emacs client
        subprocess.run("emacsclient -c", shell=True)
    else:
        # Service mode is not running, start Emacs server and client
        subprocess.run("emacs --daemon", shell=True)
        subprocess.run("emacsclient -c", shell=True)