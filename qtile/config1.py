from libqtile import hook
import os
import subprocess

from shortcuts import *
from mouse import *
from layout import *
from bar import *
from advance import *

@ hook.subscribe.startup_once  # Autostart
def autostart():
    home = os.path.expanduser('~/.config/nixed/qtile/autostart.sh')
    subprocess.call([home])
