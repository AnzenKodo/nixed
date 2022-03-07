from modules.advance import *
from modules.layout import layouts
from modules.screen import screens, widget_defaults
from modules.shortcuts import keys, groups
from modules.floating_layout import floating_layout, mouse
# from modules.hooks import *
import sys

# Enable this to don't create unnecessary files
sys.dont_write_bytecode = True

# Sets the default style for wigets from file `screen.py`
extension_defaults = widget_defaults.copy()
