from libqtile import layout
from libqtile.config import Match

from variables.style import colors

layout_theme = {
    'border_width': 2,
    'border_focus': colors[1]
}

layouts = [
    # layout.Columns(**layout_theme),
    layout.Max()
]
