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

      # Shell
      fish = {
        enable = true;
        plugins = [{
    	  name = "pure";
    	  src = pkgs.fetchFromGitHub {
      	    owner = "rafaelrinaldi";
      	    repo = "pure";
      	    rev = "2792c30dad2785d2618df38ad30756d112cec2b8";
      	    sha256 = "134sz3f98gb6z2vgd5kkm6dd8pka5gijk843c32s616w35y07sga";
    	    };
  	    }];
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
    };

    home = {
      file = {
        ".config/rofi/config.rasi".text = ''@import "~/.config/nixos/rofi"'';
        ".config/qtile".source = ./qtile;
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

        # Rofi
        rofi		                  # Menu
        rofimoji                  # Emote
        rofi-power-menu           # Power Menu
        haskellPackages.greenclip # Clipboard
      ];

      shellAliases = {
        # Better System Aliases
        rm        = "trash-put";
        cp        = "cp -iv";
        mv        = "mv -iv";
        bash      = "bash -o vi";
        cal       = "cal -y";
        grep      = "grep -i";
        ls        = "ls -A";
        mkdir     = "mkdir -v";
        # For Fish shell
        wallpaper = "bash wallpaper";
        backup    = "bash backup";
        # nixed Command
        nixed     = "$NIXED";
      };
      sessionVariables = rec {
        # Path of nixed Dirs
        NIXED = "\${HOME}/.config/Nixed";
        # Path of executable files
        PATH = [ "\${HOME}/.local/bin" ];
      };
    };
    xdg = {
      enable = true;
    };
  };
}
