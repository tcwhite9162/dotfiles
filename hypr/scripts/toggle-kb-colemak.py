#!/usr/bin/python
import subprocess

subprocess.run(["sudo", "cp", "/etc/keyd/colemak", "/etc/keyd/active.conf"])
subprocess.run(["sudo", "keyd", "reload"])

with open("/home/tcwhite/.config/waybar/kb_layout", "w") as f:
    f.write("dh")
