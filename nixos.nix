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
      windowManager.qtile.enable = true;
      desktopManager.xterm.enable = false;

      # Touch pad Support
      libinput.enable = true;
    };

    # Volume Server
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    # Printing support
    # printing.enable = true;

    openssh.enable = true;
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

  # programs.ssh.startAgent = true;
  programs.gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
        # pinentryFlavor = "curses";
      };

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

