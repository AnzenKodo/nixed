from typing import List
from libqtile import bar, layout, widget, hook, extension
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
import os
import subprocess
import re

colors = []
cache = f"/home/{os.getlogin()}/.cache/wal/colors"
wallpaper_location = f"/home/{os.getlogin()}/.cache/background.jpg"

def load_colors(cache):
    with open(cache, 'r') as file:
        for i in range(8):
            colors.append(file.readline().strip())
    colors.append('#ffffff')
    lazy.reload()


load_colors(cache)

class Style:
    background = colors[0]
    line = colors[1]
    important = [colors[2], colors[3]]
    heighlight = [colors[4], colors[5]]
    other = colors[6]
    fontColor = [colors[8], colors[7]]
    font = 'JetBrains Mono'


class Commands:
    terminal = guess_terminal()
    browser = 'brave'
    distribution = 'NixOS'
    network_interface = 'wlo1'
    backlight_name = 'intel_backlight'
    volumeUp = 'amixer -q sset Master 5%+'
    volumeDown = 'amixer -q sset Master 5%-'
    volumeMute = 'amixer -c 0 -q set Master toggle'
    brightnessUp = 'bright +'
    brightnessDown = 'bright -'
    micUp = 'amixer set Capture 5%+'
    micDown = 'amixer set Capture 5%-'
    dmenu = f'dmenu_run -i -b -p "☰" -fn "{Style.font}" -nb {Style.background} -nf {colors[7]} -sb {Style.line} -sf {colors[8]}'
    clipboard = f'clipmenu -i -b -p "✀" -fn "{Style.font}" -nb {Style.background} -nf {colors[7]} -sb {Style.line} -sf {colors[8]}'


mod = 'mod4'

keys = [
    # WM
    Key(
        [mod], 'space',
        #lazy.layout.next(),
        lazy.window.toggle_fullscree(),
        desc='Move window focus to other window'
    ),
    Key(
        [mod], 'f',
        lazy.window.toggle_floating(),
        desc='Make floating window'
    ),
    Key(
        [mod], 'r',
        lazy.layout.normalize(),
        desc='Reset all window sizes'
    ),
    Key(
        [mod, 'shift'], 'r',
        lazy.layout.toggle_split(),
        desc='Toggle between split and unsplit sides of stack'
    ),
    Key(
        [mod], 'Tab',
        lazy.next_layout(),
        desc='Toggle between layouts'
    ),
    Key(
        [mod], 'q',
        lazy.window.kill(),
        desc='Kill focused window'
    ),
    Key(
        [mod, 'control'], 'r',
        lazy.reload_config(),
        # lazy.spawn('qtile-cmd -o cmd -f restart &> /dev/null'),
        desc='Reload the config'
    ),
    Key(
        [mod, 'control'], 'q',
        lazy.shutdown(),
        desc='Shutdown Qtile'
    ),
    # Volume
    Key(
        # [], 'XF86AudioRaiseVolume',
        [mod], 'v',
        lazy.spawn(Commands.volumeUp),
        desc='Increase the Volume'
    ),
    Key(
        # [], 'XF86AudioLowerVolume',
        [mod, 'shift'], 'v',
        lazy.spawn(Commands.volumeDown),
        desc='Lower the Volume'
    ),
    Key(
        # [], 'XF86AudioMute',
        [mod, 'control'], 'v',
        lazy.spawn(Commands.volumeMute),
        desc='Mute the Volume'
    ),
    # Mic Volume
    Key(
        [mod], 'm',
        lazy.spawn(Commands.micUp),
        desc='Increase the Volume'
    ),
    Key(
        # [], 'XF86AudioLowerVolume',
        [mod, 'shift'], 'm',
        lazy.spawn(Commands.micDown),
        desc='Lower the Volume'
    ),
    # Brightness
    Key(
        # [mod], 'XF86MonBrightnessUp',
        [mod], 'b',
        lazy.spawn(Commands.brightnessUp),
        desc='Brightness up'
    ),
    Key(
        # [], 'XF86MonBrightnessDown',
        [mod, 'shift'], 'b',
        lazy.spawn(Commands.brightnessDown),
        desc='Brightness down'
    ),

    # Menu
    Key(
        [mod], 'Return',
        lazy.spawn(Commands.dmenu),
        desc='Open application starter'
    ),
    Key(
        [mod], 'e',
        lazy.spawn('kitty'),
        desc='Emoji selector'
    ),
    Key(
        [mod], 'c',
        lazy.spawn(Commands.clipboard),
        desc='Clipboard'
    ),
    # Application
    Key(
        [mod], 't',
        lazy.spawn(Commands.terminal),
        desc='Open terminal'
    ),
    Key(
        [mod], 'i',
        lazy.spawn(Commands.browser),
        desc='Open browser'
    ),
]

for key in ['up', 'down', 'left', 'right']:
    keys.extend([
        Key(
            [mod], key.capitalize(),
            getattr(lazy.layout, key)(),
            desc=f"Move focus {key}"
        ),
        Key(
            [mod, 'shift'], key.capitalize(),
            getattr(lazy.layout, "shuffle_" + key)(),
            desc=f"Move window {key}"
        ),
        Key(
            [mod, 'control'], key.capitalize(),
            getattr(lazy.layout, "grow_" + key)(),
            desc=f'Grow window {key}'
        ),
    ])

groups = [Group(i) for i in '123456789']
for i in groups:
    keys.extend([
        Key(
            [mod], i.name,
            lazy.group[i.name].toscreen(),
            desc=f'Switch to group {i.name}'
        ),
        Key(
            [mod, 'shift'], i.name,
            lazy.window.togroup(i.name, switch_group=True),
            desc=f'Switch to & move focused window to group {i.name}'
        ),
        Key(
            [mod, 'shift'], i.name,
            lazy.window.togroup(i.name),
            desc=f'move focused window to group {i.name}'
        ),
    ])

layout_theme = {
    "border_width": 2,
    "border_focus": colors[1]
}

layouts = [
    layout.Columns(**layout_theme),
    layout.Max()
]

mouse = [
    Drag(
        [mod], "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position()
    ),
    Drag(
        [mod], "Button3",
        lazy.window.set_size_floating(),
        start=lazy.window.get_size()
    ),
    Click(
        [mod], "Button2",
        lazy.window.bring_to_front()
    )
]

widget_defaults = dict(
    background=Style.background,
    foreground=Style.fontColor,
    font=Style.font,
    fontsize=14,
    padding=0,
)
extension_defaults = widget_defaults.copy()


# Notification format
def format_text(text):
    return re.sub(' +', ' ', text.strip().replace('\n', ' '))


screens = [
    Screen(
        wallpaper=wallpaper_location,
        wallpaper_mode='fill',
        top=bar.Bar(
            [
                widget.CurrentLayoutIcon(),
                widget.GroupBox(
                    inactive=Style.fontColor,
                    this_current_screen_border=Style.heighlight,
                    urgent_border=Style.important,
                    padding=0,
                    highlight_method='block',
                    rounded=False,
                    hide_unused=True,
                    disable_drag=True,
                    use_mouse_wheel=False
                ),
                # widget.Prompt(
                #     foreground=Style.fontColor,
                # ),
                # widget.Chord(
                #     chords_colors={
                #         'launch': ('#ff0000', '#ffffff'),
                #     },
                #     name_transform=lambda name: name.upper(),
                # ),
                widget.Notify(
                    background=Style.line,
                    foreground=Style.fontColor,
                    foreground_low=Style.other,
                    foreground_urgent=Style.important,
                    fmt=' 💬 {} ',
                    fontsize=15,
                    action=False,
                    parse_text=format_text
                ),
                widget.Spacer(
                    background=Style.line
                ),
                widget.Systray(),
                # widget.Pomodoro(
                #     fmt=' {} ',
                #     color_active=Colors.green,
                #     color_break=Style.red,
                #     prefix_paused='⏸️',
                #     prefix_inactive='🍅',
                #     prefix_break='🧘',
                #     prefix_active='👨‍💻',
                #     prefix_long_break='🎉',
                # ),
                widget.Volume(
                    fmt=' 🔊 {} |',
                    # emoji=True,
                ),
                # widget.Backlight(
                #     backlight_name=Commands.backlight_name,
                #     format=' ☀️ {percent:1.0%} |',
                # ),
                widget.Battery(
                    foreground=Style.fontColor,
                    background=Style.background,
                    low_background=Style.important,
                    format=' {char} {percent:2.0%}',
                    notify_below=30,
                    discharge_char='🔋',
                    charge_char='⚡',
                    full_char='🔌',
                    empty_char='',
                    unknown_char='',
                    show_short_text=False
                ),
                widget.Memory(
                    format='| 📊{MemUsed: .0f}MB |',
                ),
                widget.Net(
                    interface=Commands.network_interface,
                    format=' {down} 🔻🔺 {up} |'
                ),
                widget.Clock(
                    format=' 📅 %Y-%b-%d %a | 🕒 %I:%M%p '
                ),
                # widget.CheckUpdates(
                #     display_format=' ⬆️ {updates} Updates ',
                #     background=Style.important,
                #     distro=Commands.distribution,
                # ),
                # widget.StatusNotifier()
            ],
            25,
            margin=[5, 5, 0, 5],
            opacity=0.8
        ),
        left=bar.Gap(size=5),
        right=bar.Gap(size=5),
        bottom=bar.Gap(size=5)
    ),
]
# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        'Button1',
        lazy.window.set_position_floating(),
        start=lazy.window.get_position()
    ),
    Drag(
        [mod],
        'Button3',
        lazy.window.set_size_floating(),
        start=lazy.window.get_size()
    ),
    Click(
        [mod],
        'Button2',
        lazy.window.bring_to_front()
    )
]

@ hook.subscribe.startup_once  # Autostart
def autostart():
    home = os.path.expanduser('~/.config/nixed/qtile/autostart.sh')
    subprocess.call([home])


dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = 'smart'
reconfigure_screens = True
auto_minimize = True
wmname = 'LG3D'

floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rule,
        Match(wm_class='confirmreset'),  # gitk
        Match(wm_class='makebranch'),  # gitk
        Match(wm_class='maketag'),  # gitk
        Match(wm_class='ssh-askpass'),  # ssh-askpass
        Match(title='branchdialog'),  # gitk
        Match(title='pinentry'),  # GPG key password entry
    ]
)
