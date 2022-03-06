from libqtile.lazy import lazy
import os
from time import strftime
from typing import List

# Loads generated colors from pywal
cache = f'/home/{os.getlogin()}/.cache/wal/colors'
colors = []

# Checks if file pywal colors file exists
def load_colors(cache):
    file_exists = os.path.exists(cache)
    # if file_exists:
    #   with open(cache, 'r') as file:
    #       for i in range(8):
    #           colors.append(file.readline().strip())
    #   colors.append('#fefbfe')
    #   lazy.reload()
    nowhours = int(strftime("%-H"))
    if (nowhours >= 18):
      # Default colors from Punk Colors
      colors.extend(['#170327', '#310273', '#f2b705', '#0583f2', '#05f2c7', '#01a252', '#36a598', '#fefbfe', '#05f2c7'])
    else:
      # Default colors from Punk Black Colors
      colors.extend(['#05f2c7', '#fefbfe', '#f2b705', '#0583f2', '#05f2c7', '#01a252', '#36a598', '#170327', '#310273'])

load_colors(cache)

# pywal colors simplify
class Style:
    background = colors[0]
    line = colors[1]
    important = [colors[2], colors[3]]
    heighlight = [colors[4], colors[5]]
    other = colors[6]
    fontColor = [colors[8], colors[7]]
    font = 'JetBrains Mono'
