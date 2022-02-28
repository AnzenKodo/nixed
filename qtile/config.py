from typing import List
from libqtile import bar, layout, widget, hook, extension
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
import os
import subprocess
import re

from modules.advance import *
from modules.layout import layouts, floating_layout
from modules.screen import screens, widget_defaults
from modules.shortcuts import keys, groups
from modules.mouse import mouse

extension_defaults = widget_defaults.copy()

@ hook.subscribe.startup_once  # Autostart
def autostart():
    home = os.path.expanduser('~/.config/nixed/qtile/autostart.sh')
    subprocess.call([home])
