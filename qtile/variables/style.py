from libqtile.lazy import lazy
import os

# Loads generated colors from pywal
cache = f'/home/{os.getlogin()}/.cache/wal/colors'
# Default colors from Punk Colors #170327
colors = ['#fefefe', '#01a252', '#f2b705', '#0583f2', '#36a598', '#05f2c7', '#170327', '#310273']
# colors = []
file_exists = os.path.exists(cache)

# Checks if file pywal colors file exists
def load_colors(cache):
    if (file_exists):
      with open(cache, 'r') as file:
          for i in range(8):
              colors.append(file.readline().strip())
      colors.append('#fefbfe')
      lazy.reload()

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
