# To know more about how to setup nix goto --> https://nixos.org/manual/nixos
# Find the options that you can use --> https://search.nixos.org/options
# Find the packages that you can install --> https://search.nixos.org/packages

{ pkgs, ... }:

{
  imports =
    [
      # Include the results of hardware scans.
      ./hardware-configuration.nix

      # Home Manager
      "${ builtins.fetchTarball https://github.com/nix-community/home-manager/archive/master.tar.gz }/nixos"
      /home/ramen/.config/nixed/nixos/home.nix
    ];

  # EFI boot loader
  boot = {
    # Switch to latest linux kernel
    kernelPackages = pkgs.linuxPackages_latest;

    plymouth.font = "${pkgs.jetbrains-mono}/share/fonts/truetype/JetBrains-Mono.ttf";
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
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
      dns = "none";
      wifi = {
        # Randomize the Mac Address for security purpose.
        macAddress = "random";
        powersave = true;
      };
    };

    # DNS
    # Use's 1.1.1.1 DNS family version
    # More info -> https://one.one.one.one/family/
    nameservers = [ "1.1.1.3" "1.0.0.3" ];

    hostName = "goroot"; # Device Hostname
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

      # To know more about qtile see qtile folder for more information like
      # keyboard shortcut.
      windowManager.qtile.enable = true;

      # displayManager.lightdm.enable = true;
      # desktopManager.plasma5.enable = true;
      # displayManager.gdm.enable = true;
      # desktopManager.gnome.enable = true;
      # displayManager.sddm.enable = true;
      # desktopManager.kodi.enable = true;
      # displayManager.gdm.enable = true;
      # desktopManager.pantheon.enable = true;

      # Laptop Touchpad Support
      libinput.enable = true;
    };

    # Printing support
    # printing.enable = true;

    # openssh.enable = true;

    # Bluetooth
    blueman.enable = true;

    # Do we ignore the lid state Some laptops are broken.
    upower.ignoreLid = false;

    # Specifies what to be done when the laptop lid is closed.
    logind.lidSwitch = "suspend";
  };

  hardware = {
    # Bluetooth
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    acpilight.enable = true;

    # Audio Server
    pulseaudio.enable = true;
   };

  # Save volume state on shutdown
  sound.enable = true;

  # System fonts
  fonts = {
    # Fonts packages
    fonts = with pkgs; [
      jetbrains-mono noto-fonts
    ];

    # Set default fonts
    fontconfig.defaultFonts = {
      serif = [ "Noto Serif" "DejaVu Serif" ];
      sansSerif = [ "Noto Sans" "DejaVu Sans" ];
      monospace = [ "JetBrains Mono" "DejaVu Sans Mono"];
      emoji = [ "Noto Color Emoji" ];
    };

    # Basic set of fonts providing several font styles and families and
    # reasonable coverage
    enableDefaultFonts = true;
  };

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
			# Switch to Unstable channel
			channel = "https://nixos.org/channels/nixos-unstable";
    };
  };

  # SSH server
  programs.ssh.startAgent = true;

  # Audio server uses this to acquire real-time priority
  security.rtkit.enable = true;

  # Whether to enable power management. This includes support for suspend-to-RAM
  # and powersave features on laptops.
  powerManagement.enable = true;

  # Internationalisation properties
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "JetBrains Mono";
    keyMap = "us";
  };
}
