<div align="center">

```
.__   __.  __  ___   ___  _______  _______
|  \ |  | |  | \  \ /  / |   ____||       \
|   \|  | |  |  \  V  /  |  |__   |  .--.  |
|  . `  | |  |   > X <   |   __|  |  |  |  |
|  |\   | |  |  /  .  \  |  |____ |  '--'  |
|__| \__| |__| /__/ \__\ |_______||_______/
The dotfile OS
```
</div>

<!--TODO:Add screenshrot-->
<!--TODO:Add NixOS bio-->
Nixed is dotfile OS which is built upon [NixOS](https://nixos.org). Nixed is
configured with a high level of portable for minimalism and optimization.

## 📄 Documentation

- [Qtile](qtile)
- [Shell](shell)
- [Vim](vim)
- [Kitty](kitty)

## 🏁 Getting Started

### Installing NixOS

- Download the ISO from the [NixOS website](https://nixos.org/download.html#download-nixos).
  (Recommended to download **Graphical ISO image** for Easiness)
- Make a bootable USB drive, or CD.
  - If you don't know how to make bootable USB drive then search on online like
    'How to make bootable USB drive in [YOUR PLATFORM NAME]'.
- Insert the USB and reboot your computer.
- Go to NixOS.
- Run the given below line in the terminal to install NixOS. (Note: This script
  will wipe out all your data, make sure you have backup of your data).
```bash
curl https://gist.githubusercontent.com/AnzenKodo/61f3addb535d0eca4d935f6d4062b79d/raw/nixos-install.sh | bash
```
- After completing the NixOS installing, reboot your system and next install
  Nixed.

### Installing Nixed

- After installing or Powering Up your computer, let's install Nixed.
- Run the given below line in the terminal to install Nixed.
```bash
curl https://gist.githubusercontent.com/AnzenKodo/61f3addb535d0eca4d935f6d4062b79d/raw/nixed-install.sh | bash
```
- After installing Nixed you're done, congratulations. But the Next step is to
  learn to use Nixed.

## 💻 System Information

<details>
<summary>System</summary>

- OS - [NixOS](nixos)
- Window Manger - [Qtile](qtile)
- Display Manager - [startx](https://github.com/AnzenKodo/nixed/blob/85bf498ca93001c94a2bbe0089406871e553a737/nixos/configuration.nix#L73)
- Audio Server - [PulseAudio](https://github.com/AnzenKodo/nixed/blob/85bf498ca93001c94a2bbe0089406871e553a737/nixos/configuration.nix#L97)
- Compositor - [picom](https://github.com/AnzenKodo/nixed/blob/7f61bb95c4ae67390f2706fbd4b91c364aae64c9/nixos/home.nix#L53-L60)
</details>

<details>
<summary>Application</summary>

- GUI
  - Browser - [Brave](###browser-extension)
  - Terminal - [kitty](kitty)
  - Text Editor - [Neovim](nvim)
   - Menu - [dmenu](https://github.com/AnzenKodo/nixed/blob/7f61bb95c4ae67390f2706fbd4b91c364aae64c9/qtile/variables/commands.py#L20)
   - Clipboard - [clipmenu](https://github.com/AnzenKodo/nixed/blob/7f61bb95c4ae67390f2706fbd4b91c364aae64c9/qtile/variables/commands.py#L21)
- CLI
  - Shell - [fish](fish)
  - VCS - [git](git.init)
  - Compositor - [picom](https://github.com/AnzenKodo/nixed/blob/85bf498ca93001c94a2bbe0089406871e553a737/nixos/home.nix#L49-L56)
  - Nigt Mode - [redshift](https://github.com/AnzenKodo/nixed/blob/85bf498ca93001c94a2bbe0089406871e553a737/nixos/home.nix#L59-L64)
  - cd - [zoxide](https://github.com/AnzenKodo/nixed/blob/7f61bb95c4ae67390f2706fbd4b91c364aae64c9/shell/profile.fish#L24-L26)
  - Download - [curl](https://github.com/AnzenKodo/nixed/blob/85bf498ca93001c94a2bbe0089406871e553a737/nixos/home.nix#L83)
</details>

<details>
<summary>Theme</summary>

- Font - [Punk Mono](https://github.com/AnzenKodo/punk-mono)
- Cursor - [Capitaine Cursors](https://github.com/AnzenKodo/nixed/blob/85bf498ca93001c94a2bbe0089406871e553a737/nixos/home.nix#L108-L111)
- Icon - [Papirus-Dark](https://github.com/AnzenKodo/nixed/blob/85bf498ca93001c94a2bbe0089406871e553a737/nixos/home.nix#L121-L124)
</details>

<details>
<summary>Browser Extension</summary>

Note: Browser extension you have to install on your own. Extension doesn't come
preinstall. (If you know any method to make extension preinstall please start a
[Issue](https://github.com/AnzenKodo/nixed/issues/new?assignees=&labels=&template=feature_request.md&title=))
- Vim Mode - [Vimium](https://github.com/philc/vimium)
- Display size of each file, Download link and Copy file contents directly
  to the clipboard - [Enhanced GitHub](https://github.com/softvar/enhanced-github)
</details>

## 📁 File location & information

<details>
<summary>File tree structure</summary>

```bash
~/.config/nixed
    ├── nixos
    │   ├── configuration.nix       # Main NixOS configuration
    │   └── home.nix                # Home Manger configuration
    ├── qtile
    │   ├── autostart.sh            # Stat application when Qtile starts
    │   ├── config.py               # Start this file with `qtile -c "~/.config/nixed/qtile/config.py"
    │   ├── modules
    │   │   ├── advance.py
    │   │   ├── floating_layout.py  # Sets window float
    │   │   ├── hooks.py
    │   │   ├── layout.py
    │   │   ├── screen.py
    │   │   └── shortcuts.py        # Keyboard shortcuts
    │   └── variables
    │       ├── commands.py         # Commands to variable
    │       └── style.py            # Stylesheet
    ├── shell
    │   ├── alias                   # Set alias
    │   ├── export.fish             # Set environment variables
    │   ├── profile.fish            # Source to `~/.config/fish/conf.d`
    │   └── prompt.fish             # Fish prompt
    └── vim
    │   ├── init.vim                # Source to `~/.config/nvim/init.vim`
    │   ├── plugins.vim             # Plugins & there's keyboard shortcuts
    │   ├── shortcuts.vim           # Keyboard shrotcuts
    │   └── en.utf-8.add            # Spellcheck whitelist
    ├── git.init                    # Git configuration hard link to `~/.config/git/config`
    └── npmrc                       # Npm configuration hard link to `~/.config/npm/npmrc`
```
</details>

## 🪞 Related
Here are some related projects & also where I got inspiration.
- [NNBnh Đotfiles](https://github.com/NNBnh/dots) - Configured with a high
  level of portable for minimalism and optimization.
- [elenapan dotfiles](https://github.com/elenapan/dotfiles)
- [yrashk nix-home](https://github.com/yrashk/nix-home)

## 🔖 Resources
- [NixOS Manual](https://nixos.org/manual/nixos/stable) - This manual describes
  how to install, use and extend NixOS.
- [NixOS Wiki](https://nixos.wiki) - Wikipedia for NixOS.
- [Home Manager Manual](https://rycee.gitlab.io/home-manager/options.html) -
  This manual will eventually describe how to install, use, and extend Home
  Manager.
- [Arch Wiki](https://wiki.archlinux.org/) - The best Linux wiki, even if you
  don't use Arch.
- [NNBnh Đotfiles Wiki](https://github.com/NNBnh/dots/wiki) - The most
  ambitious OS rice guide
- [elenapan Dotfiles Wiki](https://github.com/elenapan/dotfiles/wiki) -
  Articles that answer people's most common questions here.
