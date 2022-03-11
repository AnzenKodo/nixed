# To know more about how to setup nix goto --> https://nixos.org/manual/nixos
# Find the options that you can use --> https://search.nixos.org/options
# Find the packages that you can install --> https://search.nixos.org/packages

{ config, pkgs, ... }:

{
  imports =
    [
      # Include the results of hardware scans.
      ./hardware-configuration.nix

      # Home Manager
      "${ builtins.fetchTarball https://github.com/nix-community/home-manager/archive/master.tar.gz }/nixos"
      /home/ramen/.config/nixed/nixos/home.nix
    ];

  nix = {
    # Make NixOS use unstable branch
    package = pkgs.nixUnstable;

    # Enable Nix Flakes
    extraOptions = ''
        experimental-features = nix-command flakes
      '';
  };

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
    # Use's 1.1.1.1 DNS family version
    # More info -> https://one.one.one.one/family/
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
      # For minimalist reasons I just startx and it work just fine ;)
      displayManager.startx.enable = true;

      # To know more about qtile see qtile folder for more information like keyboard shortcut.
      windowManager.qtile.enable = true;

      # Laptop Touchpad Support
      libinput.enable = true;
    };

    # Printing support
    # printing.enable = true;

    # openssh.enable = true;

    # Bluetooth
    blueman.enable = true;
  };

  hardware = {
    # Bluetooth
    bluetooth.enable = true;
    acpilight.enable = true;

    # Audio Server
    pulseaudio.enable = true;
   };

  # Save volume state on shutdown
  sound.enable = true;

  # System fonts
  fonts.fonts = with pkgs; [
    jetbrains-mono
  ];

  users.users = {
    # User
    # You can change the 'ramen' to your username of choice
    ramen = {
      isNormalUser = true;
      extraGroups = [ "wheel" "video" "audio" ]; # Root user
      shell = pkgs.fish;
    };

    # Disable root password
    root.hashedPassword = "!";
  };

  # System Updates
  system = {
    # The version that system usages
    stateVersion = "unstable";

    # Enable auto update for security purpose
    autoUpgrade = {
      enable = true;
      allowReboot = false; # Auto Reboot after update
    };
  };

  # SSH server
  programs.ssh.startAgent = true;

  # Audio server uses this to acquire real-time priority
  security.rtkit.enable = true;

  # Internationalisation properties
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };
}
