# Qtile

## Why did I choose Qtile over other [Window Managers](https://wiki.archlinux.org/title/Comparison_of_tiling_window_managers)?
The best thing about Qtile is it is written in and can be configured in
Python. Python is not some obscure language I have to learn to use. Python is
one of the most popular languages at the time of writing and is one of the
easiest to learn as compared to other languages. There many features in Qtile
that are bloat for me. But many needed feathers are pre-built, so I don't have
to download any third-party applications.

## Features
- **Auto-start** - Auto-start application on the start of Qtile by including it
  in file [`autostart.sh`](autostart.sh) file.
- **Fully keyboard** - Save your muscle memory by only using the keyboard.
- **Easy to Learn** - Simple keybindings for easiness.
- **Easy to set up** - Qtile is written and configured with Python.
- **Beautifully structured** - This configuration is separated into many files,
  so it is easy to read, and that's why it is not made into a single big file
	mess. (Note: Qtile doesn't recommend separating config files. Here I
	compromise on stability for manageability.)
- **Minimal User Interface** - This configuration doesn't use any complex UI;
  everything is dead simple to use.
- **Day & Night color scheme** - Qtile changes to dark mode at night and bright
	mode during the day.

## Important files
- [commands.py](variables/commands.py) - Though this file you change the file
  shortcut factions and commands.
- [style.py](variables/style.py) - Though this file you can edit the system
  colors and font sizes.

## Shortcuts

### Keyboard

| Name                                       | Shortcut                                |
|--------------------------------------------|-----------------------------------------|
| **Qtile**                                  |                                         |
| Reload config Qtile                        | Mod + Ctrl + r                          |
| Quite Qtile                                | Mod + Ctrl + q                          |
| **Window**                                 |                                         |
| Close window                               | Mod + q                                 |
| Full-screen window                         | Mod + Space                             |
| Floating window                            | Mod + f                                 |
| Switch window layout                       | Mod + Tab                               |
| Split window                               | Mod + Shift + Tab                       |
| Normalize window                           | Mod + Ctrl + Tab                        |
| Move window focus up, down, left, right    | Mod + ↑Up, ↓Down, ←Left, →Right         |
| Move window up, down, left, right          | Mod + Shift + ↑Up, ↓Down, ←Left, →Right |
| Grow window size up, down, left, right     | Mod + Ctrl + ↑Up, ↓Down, ←Left, →Right  |
| **Group**                                  |                                         |
| Go to group 1 to 9                         | Mod + 1...9                             |
| Move window & Switch focus to group 1 to 9 | Mod + Shift + 1...9                     |
| Move window to group 1 to 9                | Mod + Ctrl + 1...9                      |
| **Volume**                                 |                                         |
| Increase volume                            | Mod + v                                 |
| Decrease volume                            | Mod + Shift + v                         |
| Mute                                       | Mod + Ctrl + v                          |
| **Mic**                                    |                                         |
| Increase mic sensitivity                   | Mod + m                                 |
| Decrease mic sensitivity                   | Mod + Shift + m                         |
| Mute mic                                   | Mod + Ctrl + m                          |
| **Brightness**                             |                                         |
| Increase brightness                        | Mod + b                                 |
| Decrease brightness                        | Mod + Shift + b                         |
| **Screenshot**                             |                                         |
| Screenshot of specific area                | Mod + s                                 |
| Screenshot of full screen                  | Mod + Shift + s                         |
| **Menu**                                   |                                         |
| Menu                                       | Mod + ↵Enter                            |
| Emoji menu                                 | Mod + e                                 |
| Clipboard menu                             | Mod + c                                 |
| **Application**                            |                                         |
| Terminal                                   | Mod + t                                 |
| Browser                                    | Mod + i                                 |


### Mouse

| Name                                | Shortcut           |
|-------------------------------------|--------------------|
| Make window float & Move the window | Mod + Left Click   |
| Set window size                     | Mod + Right Click  |
| Bring window to front               | Mod + Scroll Click |
