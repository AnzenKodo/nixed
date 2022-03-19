<div align="center">

```
.__   __.  __  ___   ___  _______  _______
|  \ |  | |  | \  \ /  / |   ____||       \
|   \|  | |  |  \  V  /  |  |__   |  .--.  |
|  . `  | |  |   > x <   |   __|  |  |  |  |
|  |\   | |  |  /  .  \  |  |____ |  '--'  |
|__| \__| |__| /__/ \__\ |_______||_______/
The dotfile Distro
```
</div>

<!--TODO:Add screenshrot-->

## About

Nixed is dotfile OS & built upon NixOS.

### Who is Nixed for?

Nixed is not made for general use it specially made for more specific
developers in mind.

### Why Nixed exists?

I like dotfiles because you don't have to configure programs multiple times that
come with dotfiles. Just edit program dotfiles once, then backup the dotfile
fileinside somewhere safe, and now you never have to configure the program
again. I tried to that Nixed also, you need to install it, and if you want you
can edit the config file & you are ready to go. Nixed is based on NixOS, which
says on its website, "Reproducible builds and deployments" and it is true. You
can say Nixed is just a skin of NixOS, which is the customized list given below
in mind.

### Features
- **Minimal** - No bloat. Only essential packages come with Nixed.
- **Safe** - Saves backup every time you update or install packages vie Nix
  config file.
- **Up-to-date** - Nixed uses an unstable branch of NixOS. You will get the
  latest packages like Arch Linux.
- **Stable** - Even though Nixed uses the unstable branch of NixOS it still
  works like the stable branch. Even if Nixed breaks, you can go back to the
  previous generation because Nixed always backup after system updates or After
  changes in the `configuration.nix` file.
- **Keyboard oriented** - Nixed is configured to use as much as less mouse.
- **Programmable** - You can make any changes you need. Nixed uses Nix, Python,
  Vim, Fish as its language.
- For more you can read [How Nix works?](https://nixos.org/guides/how-nix-works.html)

## 📄 Documentation

- [Qtile](qtile)
- [Shell](shell)
- [Vim](vim)
- [Kitty](kitty)

## 🏁 Getting Started
NixOS is the baseline of Nixed, so to use Nixed, you need to install NixOS.

**Note:** I have given the easy step without many technical details to make
installation easy as copy and pasting but still NixOS very hard distro to
install.

### Nixed newer installion
- Download the ISO from the [NixOS website](https://nixos.org/download.html#download-nixos).
  (Recommended to download **Graphical ISO image** for Easiness)
- Make a bootable USB drive, or CD.
  - If you don't know how to make bootable USB drive then search on online like
    'How to make bootable USB drive in [YOUR PLATFORM NAME]'.
- Insert the USB and reboot your computer.
- Go to NixOS.

#### Postinstallion
- Check which boot system you are on to do that check `/sys/firmware/efi`
  directory exist. To check directory enter following command.
  ```bash
  ls /sys/firmware/efi
  ```
  - If it shows
  `ls: cannot access '/sys/firmware/efi': No such file or directory` then your
  system is Legacy
  - If it shows the directory then your system is UEFI.
- Run the given below lines accoding to your boot system one by one in the
  terminal to install NixOS or you refer to NixOS Manual to know more
  infomation about given commands. (**Note**: This will wipe out all your data,
  make sure you have backup of your data).

  <details>
  <summary>For UEFI Boot</summary>

    ```bash
    # Run as root user
    sudo su
    parted /dev/sda -- mklabel gpt
    parted /dev/sda -- mkpart primary 512MiB -8GiB
    parted /dev/sda -- mkpart primary linux-swap -8GiB 100%
    parted /dev/sda -- mkpart ESP fat32 1MiB 512MiB
    parted /dev/sda -- set 3 esp on
    mkfs.ext4 -L nixos /dev/sda1
    mkswap -L swap /dev/sda2
    mkfs.fat -F 32 -n boot /dev/sda3
    mount /dev/disk/by-label/nixos /mnt
    mkdir -p /mnt/boot
    mount /dev/disk/by-label/boot /mnt/boot
    swapon /dev/sda2
    nixos-generate-config --root /mnt
    ```
  </details>

  <details>
  <summary>For Legacy Boot (MBR)</summary>

    ```bash
    # Run as root user
    sudo su
    parted /dev/sda -- mklabel msdos
    parted /dev/sda -- mkpart primary 1MiB -8GiB
    parted /dev/sda -- mkpart primary linux-swap -8GiB 100%
    mkfs.ext4 -L nixos /dev/sda1
    mkswap -L swap /dev/sda2
    mount /dev/disk/by-label/nixos /mnt
    swapon /dev/sda2
    nixos-generate-config --root /mnt
    ```
  </details>

- Edit `/mnt/etc/nixos/configuration.nix` file add given lines in thrid last
  line in file.
```nix
# Enable user as username `ramen` which is default in Nixed
users.users.ramen = {
  isNormalUser = true;
  extraGroups = [ "wheel" "video" "audio" ]; # Root user
};
# Add following line in to enable Wifi support with network manager.
networking.networkmanager.enable = true;
```
- Install NixOS now.
```bash
nixos-install
```

#### Afterinstallion
- After reboot longin as root. To do that enter
  ```bash
  Username: root
  Password: [That you have enterd during installion]
  ```
- Set password and to connect to wifi network.
  ```bash
  # `ramen` is Nixed default username.
  passwd ramen # Set password

  # Check available wifi
  nmcli dev wifi list
  # To connect to wifi
  sudo nmcli --ask dev wifi connect network-ssid
  # Example `sudo nmcli --ask dev wifi connect "D-Link"`

  exit # Now exit
  ```
- Now login as ramen (the user that you have created).
  ```bash
  Username: ramen
  Password: [That you have enterd during `passwd ramen` command]
  ```
- Nixed Installion
  ```bash
  # First install Git to download Nixed files.
  nix-env -iA nixos.git

  # Fork the repo from Github or use the Orignal
  git clone https://github.com/[USERNAME]/nixed ~/.config/nixed

  # Link Nixed `configuration.nix` file to NixOS `configuration.nix` file.
  sudo rm /etc/nixos/configuration.nix
  sudo ln ~/.config/nixed/nixos/configuration.nix /etc/nixos/configuration.nix

  # Upgrade to Nixed
  sudo nixos-rebuild switch --upgrade
  sudo nixos-rebuild switch
  ```
- Reboot the system and go latest generation to enter in your brand new distro
- After installing Nixed you're done, congratulations. But the next step is
  learn to use Nixed.

### Nixed installion

- Run the given below line in the terminal to install Nixed.
  ```bash
  # First install Git to download Nixed files.
  nix-env -iA nixos.git

  # Fork the repo from Github or use the Orignal
  git clone https://github.com/[USERNAME]/nixed ~/.config/nixed

  # Link Nixed `configuration.nix` file to NixOS `configuration.nix` file.
  sudo rm /etc/nixos/configuration.nix
  sudo ln ~/.config/nixed/nixos/configuration.nix /etc/nixos/configuration.nix

  # Upgrate to new according to configuration.
  sudo nixos-rebuild switch --upgrade
  ```
- Reboot the system and go latest generation to enter in your brand new distro
- After installing Nixed you're done, congratulations. But the next step is
  learn to use Nixed.

<!--
### Advance
Some special twicks for Nixed.
```bash
# Shell scripts for Nixed
# Note: Scripts will install on `~/.local/bin/` so it expeted you to use `~/.local/bin/` for scripts.
git clone https://gist.github.com/AnzenKodo/71e813bc8444c53f43236a57fc80a23c ~/.local/bin

# SSH Setup
ssh-keygen -t ed25519 -C "Gangnam"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat $HOME/.ssh/id_ed25519.pub
xdg-open https://github.com/settings/keys
```
-->

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
- [elenapan Dotfiles Wiki](https://github.com/elenapan/dotfiles/wiki)
  Articles that answer people's most common questions here.
