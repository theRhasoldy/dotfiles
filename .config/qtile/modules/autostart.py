import os
import subprocess
from libqtile import hook


@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser("~/.config/scripts/autostart.sh")
    subprocess.Popen([home])
