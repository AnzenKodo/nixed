import libqtile.config import Drag,
from libqtile.lazy import lazy
# import shortcut import mod

mod = 'mod4'

mouse = [
    Drag(
        [mod],
        'Button1',
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
        # desc="Make window float & Move the window"
    ),
    Drag(
        [mod],
        'Button3',
        lazy.window.set_size_floating(),
        start=lazy.window.get_size(),
        # desc="Set window size"
    ),
    Click(
        [mod],
        'Button2',
        lazy.window.bring_to_front(),
        # desc="Bring window to front"
    )
]
