from typing import List
from libqtile import bar, layout, widget, hook, extension
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
import subprocess
# import re

# import libqtile import widget, bar, extension
# import libqtile.config import Screen
import os

from variables.style import Style
from variables.commands import Commands

widget_defaults = dict(
    background=Style.background,
    foreground=Style.fontColor,
    font=Style.font,
    fontsize=14,
    padding=0,
)

wallpaper_location = f'/home/{os.getlogin()}/.cache/background.jpg'
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
                widget.Prompt(
                    foreground=Style.fontColor,
                ),
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
                widget.Backlight(
                    backlight_name=Commands.backlight_name,
                    format=' ☀️ {percent:1.0%} |',
                ),
                widget.Battery(
                    foreground=Style.fontColor,
                    background=Style.background,
                    low_background=Style.important,
                    format=' {char} {percent:2.0%} ',
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
                    format=' {down} 🔻🔺 {up} '
                ),
                widget.Clock(
                    format='| 📅 %Y-%b-%d %a | 🕒 %I:%M%p '
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
