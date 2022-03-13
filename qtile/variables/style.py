from libqtile.lazy import lazy
import os
from time import strftime

# Loads generated colors from pywal
cache = f'/home/{os.getlogin()}/.cache/wal/colors'
colors = []

# Checks time fill colors according to time.
nowhours = int(strftime("%-H"))
if (nowhours >= 18):
  # Default colors from Punk Black Colors
  colors.extend(['#000000', '#F20544', '#f2b705', '#F20544', '#05f2c7', '#0583f2', '#01a252', '#fefbfe', '#000000'])
else:
  # Default colors from Punk Colors
  colors.extend(['#000000', '#0583f2', '#f2b705', '#F20544', '#05f2c7', '#0583f2', '#01a252', '#fefbfe', '#000000'])



# Colors simplify
class Style:
    background = colors[0]
    line = colors[1]
    important = [colors[2], colors[3]]
    heighlight = [colors[4], colors[5]]
    other = colors[6]
    fontColor = colors[7]
    font = 'JetBrains Mono'
