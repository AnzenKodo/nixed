{ pkgs, ... }:

{
    home-manager.users.ramen = { pkgs, ... }: {
    programs = {
      home-manager.enable = true;

      command-not-found.enable = true;

      # Editor
      neovim = {
        enable = true;
        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;

        # This only install plugin manger other plugin's install through
        # '../vim/plugin.vim' file.
        plugins = with pkgs.vimPlugins; [
          vim-plug
        ];

        # Default file '~/.config/nvim/init.vim' source this file
        extraConfig = ''
          source ~/.config/nixed/vim/init.vim
        '';
        configure = {
          customRC = ''
            source ~/.config/nixed/vim/init.vim
          '';
          packages.myVimPackage = with pkgs.vimPlugins; {
            start = [ vim-plug ];
          };
        };
      };

      # Terminal
      kitty = {
        enable = true;

        # Default file '~/.config/kitty/kitty.conf' source to given below file
        extraConfig = ''
          include ~/.config/nixed/kitty/kitty.conf
        '';
      };

      # Change bash history file location
      bash.historyFile = "~/.cache/bash_history";
    };

    services = {
      # Transparent effect for windows
      picom = {
        enable = true;
        blur = true;
        # fade = true;
        # fadeDelta = 5;
        # shadow = true;
        inactiveDim = "0.2";
      };

      # Night mode adjusts the color temperature
      redshift = {
        enable = true;
        dawnTime = "6:00-7:45";
        duskTime = "18:35-20:15";
        provider = "geoclue2";
      };
    };
    home = {
      file = {
        ".config/fish/config.fish".text = ''
          source ~/.config/nixed/shell/profile.fish
        '';

        # Create hard link's between files
        ".config/git/config".source = ../git.init;
        ".config/npm/npmrc".source = ../npmrc
      };

      packages = with pkgs; [
        # GUI Application
        brave  	        # Browser
        dmenu           # Menu
        clipmenu        # Clipboard

        # CLI Application
        curl                        # Downloaded
        wpgtk                       # Generate color schemes for Applications
        alsaUtils                   # Volume Management
        trash-cli                   # rm put trash-bin
        fish                        # Shell
        zoxide                      # A smarter cd command
        unzip                       # unzip zip files
        git                         # Version control system
        patool                      # Portable archive file manager

        # Applications for Programming
        nodejs      # JavaScript back-end runtime
        deno        # Morden JavaScript back-end runtime
        # commitizen  # Make proper commit
      ];
    };

    # XDG Base Directory Specification
    # More here -> https://wiki.archlinux.org/title/XDG_Base_Directory
    xdg = {
      enable = true;
    };

    xsession = {
      # Cursor theme
      pointerCursor = {
        package = pkgs.capitaine-cursors;
        name = "capitaine-cursors";
      };
    };

    gtk = {
      # enable = true;

      # GTK default font style
      font.name = "JetBrains Mono";

      # GTK Icon Theme
      iconTheme = {
        package = pkgs.papirus-icon-theme;
        name = "Papirus-Dark";
      };
    };
    # qt.platformTheme = "gtk";

  };
}
