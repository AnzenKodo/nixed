from libqtile.utils import guess_terminal
from style import Style, colors

class Commands:
    terminal = guess_terminal()
    browser = 'brave'
    distribution = 'NixOS'
    network_interface = 'wlo1'
    backlight_name = 'intel_backlight'
    volumeUp = 'amixer -q sset Master 5%+'
    volumeDown = 'amixer -q sset Master 5%-'
    volumeMute = 'amixer -c 0 -q set Master toggle'
    brightnessUp = 'xbacklight -inc 1'
    brightnessDown = 'xbacklight -dec 1'
    micUp = 'amixer set Capture 1%+'
    micDown = 'amixer set Capture 1%-'
    micMute = 'amixer set Capture toggle'
    dmenu = f'dmenu_run -i -b -p "☰" -fn "{Style.font}" -nb {Style.background} -nf {colors[7]} -sb {Style.line} -sf {colors[8]}'
    clipboard = f'clipmenu -i -b -p "✀" -fn "{Style.font}" -nb {Style.background} -nf {colors[7]} -sb {Style.line} -sf {colors[8]}'