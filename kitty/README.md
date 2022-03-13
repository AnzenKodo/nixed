# Kitty

## Why choose kitty terminal over other [terminals](https://wiki.archlinux.org/title/List_of_applications#Terminal_emulators)?
I mostly use terminal-based applications & in the graphical interface, I mostly
use my browser. I don't want the graphical interface in the terminal. Because I
think graphical interfaces are mostly bloat. Kitty does have some things that
others will consider bloat, but those are useful to me. Kitty terminal written
in Python programming language, my window manager Qtile is also.

## Features
- **Image support** - Show image inside the terminal with [`icat`](https://github.com/AnzenKodo/nixed/blob/75013df59460dfe470a4d7925bcab17699129d1c/shell/alias#L22).
- **Emojis support** - Select emojis by entering [`emoji`](https://github.com/AnzenKodo/nixed/blob/9f93a179c0841ad942b095936c1c32ada26fd420/shell/alias#L26).
- **Select theme from online** - Change theme by entering [`theme`](https://github.com/AnzenKodo/nixed/blob/9f93a179c0841ad942b095936c1c32ada26fd420/shell/alias#L24).
- **100% keyboard** - No mouse required even for opening URL just press
[<kbd>Ctrl + Enter</kbd>](https://github.com/AnzenKodo/nixed/blob/9f93a179c0841ad942b095936c1c32ada26fd420/kitty/shortcuts.conf#L34) and press number of URL that you want to open in your
browser.
- **Xresources support** - Import colors form Xresources by adding the line
`include .Xresources` inside [kitty.conf](kitty.conf) file.

## Shortcuts

| Name                 | Shortcut                 |
|----------------------|--------------------------|
| **Clipboard**        |                          |
| Copy to Clipboard    | Ctrl + Shift + C         |
| Paste from Clipboard | Ctrl + Shift + V         |
| Paste from Selection | Ctrl + Shift + S         |
| **Scroll**           |                          |
| Scroll line up       | Ctrl + ↑Up               |
| Scroll line down     | Ctrl + ↓Down             |
| Scroll page up       | Ctrl + Shift + ↑Up       |
| Scroll page down     | Ctrl + Shift + ↓Down     |
| Scroll Home          | Alt + Shift + ↑Up        |
| Scroll End           | Alt + Shift + ↓Down      |
| Show scrollback      | Ctrl + h                 |
| **Tabs**             |                          |
| New tab              | Ctrl + t                 |
| Set tab title        | Ctrl + Shift + t         |
| **Font**             |                          |
| Increase font size   | Ctrl + Shift + +Plus     |
| Decrease font size   | Ctrl + Shift + -Minus    |
| Restart font size    | Ctrl + ←Backspace        |
| **Opacity**          |                          |
| Increase opacity     | Alt + Shift + =Equal     |
| Decrease opacity     | Alt + Shift + -Minus     |
| Restart opacity      | Alt + Shift + ←Backspace |
| **Advance**          |                          |
| Open URL with hints  | Ctrl + Enter Note        |
| Toggle fullscreen    | F11                      |
| Load config file     | Ctrl + R                 |
| Clear Terminal       | Ctrl + C                 |
