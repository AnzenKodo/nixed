from libqtile.config import Group, Key
from libqtile.lazy import lazy
from variables.commands import Commands, mod

# A list of available commands that can be bound to keys can be found
# at https://docs.qtile.org/en/latest/manual/config/lazy.html

# Qtile keyboard shortcuts
keys = [
    # Qtile
    Key(
        [mod, 'control'], 'r',
        # lazy.reload_config(),
        lazy.restart(),
        desc='Reload config Qtile'
    ),
    Key(
        [mod, 'control'], 'q',
        lazy.shutdown(),
        desc='Quite Qtile'
    ),

    # Window
    Key(
        [mod], 'q',
        lazy.window.kill(),
        desc='Close window'
    ),
    Key(
        [mod], 'space',
        #lazy.layout.next(),
        lazy.window.toggle_fullscreen(),
        desc='Fullscreen window'
    ),
    Key(
        [mod], 'f',
        lazy.window.toggle_floating(),
        desc='Floating window'
    ),
    Key(
        [mod], 'Tab',
        lazy.next_layout(),
        desc='Switch window layout'
    ),
    Key(
        [mod, 'shift'], 'Tab',
        lazy.layout.toggle_split(),
        desc='Split window'
    ),
    Key(
        [mod, 'control'], 'Tab',
        lazy.layout.normalize(),
        desc='Normalize window'
    ),

    # Volume
    Key(
        # [], 'XF86AudioRaiseVolume',
        [mod], 'v',
        lazy.spawn(Commands.volumeUp),
        desc='Increase Volume'
    ),
    # [], 'XF86AudioLowerVolume',
    Key(
        [mod, 'shift'], 'v',
        lazy.spawn(Commands.volumeDown),
        desc='Decrease Volume'
    ),
    Key(
        # [], 'XF86AudioMute',
        [mod, 'control'], 'v',
        lazy.spawn(Commands.volumeMute),
        desc='Mute Volume'
    ),

    # Mic
    Key(
        [mod], 'm',
        lazy.spawn(Commands.micUp),
        desc='Increase mic sensitivity'
    ),
    Key(
        [mod, 'shift'], 'm',
        lazy.spawn(Commands.micDown),
        desc='Decrease mic sensitivity'
    ),
    Key(
        [mod, 'control'], 'm',
        lazy.spawn(Commands.micMute),
        desc='Mute mic'
    ),
    # Brightness
    Key(
        # [mod], 'XF86MonBrightnessUp',
        [mod], 'b',
        lazy.spawn(Commands.brightnessUp),
        desc='Increase brightness'
    ),
    Key(
        # [], 'XF86MonBrightnessDown',
        [mod, 'shift'], 'b',
        lazy.spawn(Commands.brightnessDown),
        desc='Decrease brightness'
    ),
    # Screenshot
    Key(
        [mod], 's',
        lazy.spawn(Commands.screenshort),
        desc="Screenshot of specific area"
    ),
    Key(
        [mod, 'shift'], 's',
        lazy.spawn(Commands.screenshortFull),
        desc="Screenshot of full screen"
    ),
    # Menu
    Key(
        [mod], 'Return',
        lazy.spawn(Commands.dmenu),
        desc='Menu'
    ),
    Key(
        [mod], 'e',
        lazy.spawn('kitty'),
        desc='Emoji menu'
    ),
    Key(
        [mod], 'c',
        lazy.spawn(Commands.clipboard),
        desc='Clipboard menu'
    ),
    # Application
    Key(
        [mod], 't',
        lazy.spawn(Commands.terminal),
        desc='Terminal'
    ),
    Key(
        [mod], 'i',
        lazy.spawn(Commands.browser),
        desc='Browser'
    ),
]

for key in ['up', 'down', 'left', 'right']:
    keys.extend([
        Key(
            [mod], key.capitalize(),
            getattr(lazy.layout, key)(),
            desc=f'Move window focus {key}'
        ),
        Key(
            [mod, 'shift'], key.capitalize(),
            getattr(lazy.layout, 'shuffle_' + key)(),
            desc=f'Move window {key}'
        ),
        Key(
            [mod, 'control'], key.capitalize(),
            getattr(lazy.layout, 'grow_' + key)(),
            desc=f'Grow window size {key}'
        ),
    ])

# Keyboard shortcut for Workspaces
groups = [Group(i) for i in '123456789']
for i in groups:
    keys.extend([
        Key(
            [mod], i.name,
            lazy.group[i.name].toscreen(),
            desc=f'Go to group {i.name}'
        ),
        Key(
            [mod, 'shift'], i.name,
            lazy.window.togroup(i.name, switch_group=True),
            desc=f'Move window & Switch focus to group {i.name}'
        ),
        Key(
            [mod, 'control'], i.name,
            lazy.window.togroup(i.name),
            desc=f'Move window to group {i.name}'
        ),
    ])
