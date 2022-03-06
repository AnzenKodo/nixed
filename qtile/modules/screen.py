from libqtile import bar, widget
from libqtile.config import Screen
import os

from variables.style import Style
from variables.commands import Commands

# Default widgets style
widget_defaults = dict(
    background=Style.background,
    foreground=Style.fontColor,
    font=Style.font,
    fontsize=14,
    padding=0,
)

wallpaper_location = f'~/.cache/background.jpg'
screens = [
    Screen(
        wallpaper=wallpaper_location,
        # How this image is painted to the screen is specified by the
        # `wallpaper_mode` parameter.
        # 'fill': Image will be centred on the screen and resized to fill it.
        # 'stretch': Image is stretched to fit all of it into the screen.
        wallpaper_mode='fill',
        top=bar.Bar(
            [
                # A list of available widgets that can found on ->
                # https://docs.qtile.org/en/latest/manual/ref/widgets.html

                # Display the icon represent current layout of current group.
                widget.CurrentLayoutIcon(),
                # Workspaces laybel
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
                # A widget that prompts for user input
                widget.Prompt(
                    foreground=Style.fontColor,
                ),
                # A notify widget
                widget.Notify(
                    background=Style.line,
                    foreground=Style.fontColor,
                    foreground_low=Style.other,
                    foreground_urgent=Style.important,
                    fmt=' 💬 {} ',
                    fontsize=15,
                    action=False,
                ),
                # Just an empty space on the bar.
                widget.Spacer(
                    background=Style.line
                ),
                # A widget that manages system tray.
                widget.Systray(),
                # Pomodoro technique widget.
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
                # Widget that display and change volume.
                widget.Volume(
                    fmt=' 🔊 {} |',
                    # emoji=True,
                ),
                # Widget to show the current brightness of a monitor.
                widget.Backlight(
                    backlight_name=Commands.backlight_name,
                    format=' ☀️ {percent:1.0%} |',
                ),
                # Battery monitoring widget.
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
                # Displays memory/swap usage
                widget.Memory(
                    format='| 📊{MemUsed: .0f}MB |',
                ),
                # Displays net speed
                widget.Net(
                    interface=Commands.network_interface,
                    format=' {down} 🔻🔺 {up} '
                ),
                # Displays clock
                widget.Clock(
                    format='| 📅 %Y-%b-%d %a | 🕒 %H:%M%p '
                ),
                # Shows number of pending updates
                # widget.CheckUpdates(
                #     display_format=' ⬆️ {updates} Updates ',
                #     background=Style.important,
                #     distro=Commands.distribution,
                # ),
            ],
            25,
            margin=[5, 5, 0, 5],
            opacity=0.8
        ),
        # A gap placed along one of the edges of the screen.
        left=bar.Gap(size=5),
        right=bar.Gap(size=5),
        bottom=bar.Gap(size=5)
    ),
]
