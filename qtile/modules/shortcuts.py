from libqtile.config import Group, Key
from libqtile.lazy import lazy
from variables.commands import Commands, mod

# A list of available commands that can be bound to keys can be found
# at https://docs.qtile.org/en/latest/manual/config/lazy.html

# Qtile keyboard shortcuts
keys = [
    # Switch Keys
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    # Move Keys
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow Keys
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Qtile
    Key([mod, 'control'], 'r', lazy.reload_config(), 'Reload config Qtile'),
    Key([mod, 'control'], 'q', lazy.shutdown(), 'Quite Qtile'),

    # Window
    Key([mod], 'q',lazy.window.kill(), 'Close window'),
    Key([mod], 'space',lazy.window.toggle_fullscreen(), 'Fullscreen window'),
    Key([mod], 'f', lazy.window.toggle_floating(), 'Floating window'),
    Key([mod], 'Tab', lazy.next_layout(), 'Switch window layout'),
    Key([mod, 'shift'], 'Tab', lazy.layout.toggle_split(), 'Split window'),
    Key([mod, 'control'], 'Tab', lazy.layout.normalize(), 'Normalize window'),

    # Volume
    Key([mod], 'v', lazy.spawn(Commands.volumeUp), 'Increase Volume'),
    Key([mod, 'shift'], 'v', lazy.spawn(Commands.volumeDown),'Decrease Volume'),
    Key([mod, 'control'], 'v', lazy.spawn(Commands.volumeMute), 'Mute Volume'),

    # Mic
    Key([mod], 'm', lazy.spawn(Commands.micUp), 'Increase mic sensitivity'),
    Key([mod, 'shift'], 'm', lazy.spawn(Commands.micDown),
        'Decrease mic sensitivity'),
    Key([mod, 'control'], 'm', lazy.spawn(Commands.micMute), 'Mute mic'),

    # Brightness
    Key([mod], 'b', lazy.spawn(Commands.brightnessUp), 'Increase brightness'),
    Key([mod, 'shift'], 'b', lazy.spawn(Commands.brightnessDown),
        'Decrease brightness'),

    # Screenshot
    Key([mod], 's', lazy.spawn(Commands.screenshort), "Screenshot of area"),
    Key([mod, 'shift'], 's', lazy.spawn(Commands.screenshortFull),
        "Screenshot fullscreen"),

    # Menu
    Key([mod], 'Return', lazy.spawn(Commands.dmenu), 'Menu'),
    Key([mod], 'c', lazy.spawn(Commands.clipboard), desc='Clipboard menu'),

    # Application
    Key([mod], 't', lazy.spawn(Commands.terminal), desc='Terminal'),
    Key([mod], 'i', lazy.spawn(Commands.browser), 'Browser'),
]

# for key in ['up', 'down', 'right', 'left']:
#     keys.extend([
#         Key([mod], key.capitalize(),
#             getattr(lazy.layout, key)(), f'Move window focus {key}'),
#         Key([mod, 'shift'], key.capitalize(),
#             getattr(lazy.layout, 'shuffle_' + key)(), f'Move window {key}'),
#         Key([mod, 'control'], key.capitalize(),
#             getattr(lazy.layout, 'grow_' + key)(), f'Grow window size {key}'),
#     ])

# Keyboard shortcut for Workspaces
groups = [Group(i) for i in '123456789']
for i in groups:
    keys.extend([
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            f'Go to group {i.name}'),
        Key([mod, 'shift'], i.name,
            lazy.window.togroup(i.name, switch_group=True),
            f'Move window & Switch focus to group {i.name}'),
        Key([mod, 'control'], i.name, lazy.window.togroup(i.name),
            f'Move window to group {i.name}'),
    ])
