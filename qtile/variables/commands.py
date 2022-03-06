from libqtile.utils import guess_terminal
from variables.style import Style, colors

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
    screenshort = '/nix/store/s49jmrvg3gdx8h5jyz6rnpy1alnmp1cf-imagemagick-7.1.0-19/bin/import ~/Pictures/Screenshorts/$(date "+%d-%m-%Y-%H:%M:%S").png'
    screenshortFull = '/nix/store/s49jmrvg3gdx8h5jyz6rnpy1alnmp1cf-imagemagick-7.1.0-19/bin/import -window root ~/Pictures/Screenshorts/$(date "+%d-%m-%Y-%H:%M:%S").png'
    dmenu = f'dmenu_run -i -b -p "☰" -fn "{Style.font}" -nb {Style.background} -nf {colors[7]} -sb {Style.line} -sf {colors[8]}'
    clipboard = f'clipmenu -i -b -p "✀" -fn "{Style.font}" -nb {Style.background} -nf {colors[7]} -sb {Style.line} -sf {colors[8]}'
