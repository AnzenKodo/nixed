from libqtile.lazy import lazy
import os
from time import strftime

# Loads generated colors from pywal
cache = f'/home/{os.getlogin()}/.cache/wal/colors'
colors = []
wallpaper = ""

# Checks time fill colors according to time.
nowhours = int(strftime("%-H"))
if (nowhours >= 18 or nowhours <= 6):
  colors.extend(['#000000', '#F20544', '#f2b705', '#F20544', '#05f2c7',
                 '#0583f2', '#01a252', '#fefbfe', '#000000'])
  wallpaper = "~/.config/nixed/qtile/wallpaper/night.jpg"
else:
  colors.extend(['#000000', '#f20544', '#f2b705', '#f20544', '#05f2c7',
                 '#0583f2', '#01a252', '#fefbfe', '#000000'])
  wallpaper = "~/.config/nixed/qtile/wallpaper/day.jpg"



# Colors simplify
class Style:
    background = colors[0]
    line = colors[1]
    important = [colors[2], colors[3]]
    heighlight = [colors[4], colors[5]]
    other = colors[6]
    fontColor = colors[7]
    font = 'JetBrains Mono'
    wallpaper = wallpaper
