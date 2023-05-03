import subprocess

# Write "kk" to 4.txt
with open("4.txt", "w") as f:
    f.write("kk")

# Open 4.txt in Emacs
subprocess.run(["emacsclient", "--no-wait", "4.txt"])