from libqtile import hook
import subprocess
import os

# Run commands or spawn some applications when Qtile starts.
@ hook.subscribe.startup_once
def autostart():
    # create an executable file ~/.config/nixed/qtile/autostart.sh that will
    # start a few programs when Qtile first runs.
    home = os.path.expanduser('~/.config/nixed/qtile/autostart.sh')
    subprocess.call([home])
