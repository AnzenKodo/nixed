from libqtile import hook
import subprocess
import os

@ hook.subscribe.startup_once  # Autostart
def autostart():
    home = os.path.expanduser('~/.config/nixed/qtile/autostart.sh')
    subprocess.call([home])
