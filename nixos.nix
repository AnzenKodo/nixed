{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

      # Home Manager
      "${ builtins.fetchTarball https://github.com/nix-community/home-manager/archive/master.tar.gz }/nixos"
      /home/ramen/.config/nixed/home-manager.nix
    ];

  # EFI boot loader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Timezone
  time.timeZone = "Asia/Kolkata";

  networking = {
    useDHCP = false;

    # Internet Support
    interfaces = {
      eno1.useDHCP = true; # Ethernet
      wlo1.useDHCP = true; # Wifi
    };
    networkmanager = {
      enable = true;
      wifi = {
      # Randomize the Mac Address for security purpose.
      macAddress = "random";
      };
    };

    # DNS
    nameservers = [ "1.1.1.3" "1.0.0.3" ];

    # hostName = "nixos"; # Device Hostname
    # wireless.enable = true;  # wpa_supplicant

    # Proxys
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Firewall
    # firewall.enable = false;
    # firewall.allowedTCPPorts = [ ... ];
    # firewall.allowedUDPPorts = [ ... ];
  };

  services = {
    xserver = {
      # X11 windowing system
      enable = true;

      # Desktop Environment
      displayManager.startx.enable = true;
      desktopManager.xterm.enable = false;
      windowManager.qtile.enable = true;

      # Touch pad Support
      libinput.enable = true;
    };

    # Volume Server
    # pipewire = {
      # enable = true;
      # alsa.enable = true;
      # alsa.support32Bit = true;
      # pulse.enable = true;
    # };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;

      config.pipewire-pulse = {
        "context.properties" = {
          "log.level" = 2;
        };
        "context.modules" = [
          {
            name = "libpipewire-module-rtkit";
            args = {
              "nice.level" = -15;
              "rt.prio" = 88;
              "rt.time.soft" = 200000;
              "rt.time.hard" = 200000;
            };
            flags = [ "ifexists" "nofail" ];
          }
          { name = "libpipewire-module-protocol-native"; }
          { name = "libpipewire-module-client-node"; }
          { name = "libpipewire-module-adapter"; }
          { name = "libpipewire-module-metadata"; }
          {
            name = "libpipewire-module-protocol-pulse";
            args = {
              "pulse.min.req" = "32/48000";
              "pulse.default.req" = "32/48000";
              "pulse.max.req" = "32/48000";
              "pulse.min.quantum" = "32/48000";
              "pulse.max.quantum" = "32/48000";
              "server.address" = [ "unix:native" ];
            };
          }
        ];
        "stream.properties" = {
          "node.latency" = "32/48000";
          "resample.quality" = 1;
        };
      };
    };

    # Printing support
    # printing.enable = true;

    # openssh.enable = true;
  };

  fonts.fonts = with pkgs; [
    jetbrains-mono
  ];

  users.users = {
    # Users
    ramen = {
      isNormalUser = true;
      extraGroups = [ "wheel" ]; # Root user
      shell = pkgs.fish;
    };
    # Disable root password
    root.hashedPassword = "!";
  };

  # Updates
  system = {
    stateVersion = "unstable";
    autoUpgrade = {
      enable = true;
      allowReboot = false; # Auto Reboot after update
    };
  };

  programs.ssh.startAgent = true;

  # Gnome Keyring
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.startx.enableGnomeKeyring = true;

  # Audio server uses this to acquire real-time priority
  security.rtkit.enable = true;

  # Internationalisation properties
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };
}

