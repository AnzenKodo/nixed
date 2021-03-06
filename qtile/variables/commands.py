from libqtile.utils import guess_terminal
from variables.style import Style, colors
import datetime

mod = 'mod4' # Mode set to enter

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
    screenshort = f'/nix/store/wc5pshsqxp1i85nc1i98fga7mha7yqfw-imagemagick-7.1.0-37/bin/import import Downloads/screenshort.png'
    screenshortFull = f'/nix/store/wc5pshsqxp1i85nc1i98fga7mha7yqfw-imagemagick-7.1.0-37/bin/import -window root "Downloads/screenshotFull.png"'
    dmenu = f'dmenu_run -i -b -p "☰" -fn "{Style.font}" -nb {Style.background} -nf {colors[7]} -sb {Style.line} -sf {colors[8]}'
    clipboard = f'clipmenu -i -b -p "✀" -fn "{Style.font}" -nb {Style.background} -nf {colors[7]} -sb {Style.line} -sf {colors[8]}'
