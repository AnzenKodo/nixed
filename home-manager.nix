{ pkgs, ... }:

{
    home-manager.users.ramen = { pkgs, ... }: {
    programs = {
      home-manager.enable = true;

      # VCS
      git = {
        enable = true;
        userName  = "AnzenKodo";
        userEmail = "AnzenKodo@altmails.com";
      };

      # Editor
      neovim = {
        enable = true;
        #viAlias = true;
        #vimAlias = true;
        plugins = with pkgs.vimPlugins; [
          vim-plug
        ];
        extraConfig = builtins.readFile ./nvim.vim;
        configure = {
          customRC = builtins.readFile ./nvim.vim;
          packages.myVimPackage = with pkgs.vimPlugins; {
            start = [ vim-plug ];
          };
        };
      };

      # Terminal
      kitty = {
        enable = true;
        extraConfig = builtins.readFile ./kitty.conf;
      };
      bash.historyFile = ".cache/bash_history";
    };

    services = {
      # Transparent windows
      picom = {
        enable = true;
        blur = true;
        # fade = true;
        # fadeDelta = 5;
        # shadow = true;
        inactiveDim = "0.2";
      };

      # Night Shift
      redshift = {
        enable = true;
        dawnTime = "6:00-7:45";
        duskTime = "18:35-20:15";
        provider = "geoclue2";
      };

      # To SSH password remember
      gpg-agent = {
        enable = true;
        enableSshSupport = true;
        defaultCacheTtl = 1800;
      };
      gnome-keyring.enable = true;
    };

    home = {
      file = {
        ".config/rofi/config.rasi".text = ''
          @import "~/.config/nixed/rofi"
        '';
        ".config/qtile".source = ./qtile;
        ".config/fish/config.fish"= {
          source = ./fish.fish;
          recursive = true;
        };
      };

      packages = with pkgs; [
        # GUI
        brave  	        # Browser
        bibata-cursors  # Cursors

        # Terminal
        curl   	  # Downloaded
        pywal  	  # Generate color schemes
        alsaUtils # Volume Management
        trash-cli # rm put trash bin
        fish      # Shell

        # Rofi
        rofi		                  # Menu
        rofimoji                  # Emote
        rofi-power-menu           # Power Menu
        haskellPackages.greenclip # Clipboard
      ];
    };
    xdg = {
      enable = true;
    };
  };
}
