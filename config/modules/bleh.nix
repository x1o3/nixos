{ lib, pkgs, ...}: {

  fileSystems."/x" = {
   device = "/dev/disk/by-uuid/AAA4681CA467E971";
   fsType = "ntfs3";
   options = [ "defaults" ];
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };

      systemd-boot.enable = true;

      grub = {
        enable = false;
        devices = ["nodev"];
        efiSupport = true;
        useOSProber = true;
        configurationLimit = 5;
      };
      timeout = 5;
    };
  };
  
  networking = {
    hostName = "scythe";
    networkmanager.enable = true;
  };

  zramSwap = {
   enable = true;
   algorithm = "zstd";
  };

  environment.variables = {
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24"; 
  };

  services = {
    blueman.enable = true;
  
    libinput = {
      enable = true;
      touchpad = {
        naturalScrolling = true;
        tapping = true;
      };
    };

    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    # displayManager.defaultSession = "hyprland";
    displayManager.enable = lib.mkForce false;
    
    xserver = {
      displayManager.lightdm.enable = false;
      videoDrivers = ["modesetting"];
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };

  hardware = {
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;

    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      font-awesome
      noto-fonts
      noto-fonts-emoji-blob-bin
      noto-fonts-cjk-sans
    ];
  };


  systemd.sleep.extraConfig = ''
    AllowSuspend=yes
    AllowHibernation=no
    AllowHybridSleep=yes
    AllowSuspendThenHibernate=no
  '';

  time.timeZone = "Asia/Kolkata";
  time.hardwareClockInLocalTime = true;
  i18n.defaultLocale = "en_IN";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  programs.fish.enable = true;
  programs.hyprland.enable = true;
   
  nixpkgs.config.allowUnfree = true;
  
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    auto-optimise-store = true;
  };

  system.stateVersion = "25.05";

}
