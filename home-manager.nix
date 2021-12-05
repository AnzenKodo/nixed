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
        extraConfig = ''
          source ~/.config/nixed/nvim.vim
        '';
        configure = {
          customRC = ''
            source ~/.config/nixed/nvim.vim
          '';
          packages.myVimPackage = with pkgs.vimPlugins; {
            start = [ vim-plug ];
          };
        };
      };

      # Terminal
      kitty = {
        enable = true;
        extraConfig = ''
          include ~/.config/nixed/kitty.conf
        '';
      };
      bash.historyFile = "~/.cache/bash_history";
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
      # gpg-agent = {
      #   enable = true;
      #   enableSshSupport = true;
      #   # defaultCacheTtl = 1800;
      # };
      # gnome-keyring.enable = true;
    };

    home = {
      file = {
        ".config/fish/config.fish".text = ''
          source ~/.config/nixed/fish.fish
        '';
      };

      packages = with pkgs; [
        # GUI
        brave  	        # Browser

        # Terminal
        curl   	  # Downloaded
        pywal  	  # Generate color schemes
        alsaUtils # Volume Management
        trash-cli # rm put trash bin
        fish      # Shell
        libnotify # Sends desktop notifications to a notification daemon

        # Rofi
        dmenu		                  # Menu
        clipmenu                  # Emote
        rofi-power-menu           # Power Menu
        haskellPackages.greenclip # Clipboard
      ];
    };
    xdg = {
      enable = true;
    };
    xsession = {
      enable = true;
      pointerCursor.package = pkgs.capitaine-cursors;
      pointerCursor.name = "capitaine-cursors";
      profileExtra = ''
        eval $(${pkgs.gnome3.gnome-keyring}/bin/gnome-keyring-daemon --daemonize --components=ssh,secrets)
        export SSH_AUTH_SOCK
      '';
    };
  };
}
