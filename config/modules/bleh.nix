{ lib, pkgs, ...}: {

  boot = {
    kernelPackages = pkgs.linuxPackages_6_12;
    kernelParams = [
      "nvidia_drm.modeset=1"
      "nvidia_drm.fbdev=1"
      "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
      "nvidia.NVreg_OpenRmEnableUnsupportedGpus=1"
    ];
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };

      grub = {
        enable = true;
        devices = ["nodev"];
        efiSupport = true;
        useOSProber = true;
        configurationLimit = 3;
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

    xserver = {
      displayManager = {
        lightdm.enable = false;
      };
      videoDrivers = ["modesetting" "nvidia"];
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  
    tlp = {
      enable = true;
      settings = {
        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 20;
        START_CHARGE_THRESH_BAT0 = 20; 
        STOP_CHARGE_THRESH_BAT0 = 80;
      };
    };
  
    upower = {
      enable = true;
      criticalPowerAction = "Hibernate";
    };
  };

  hardware = {
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
      open = false;
      nvidiaPersistenced = true;
      package = pkgs.linuxPackages_6_12.nvidiaPackages.latest;
      prime = {
        offload.enable = true;
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
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

  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
    virtualbox = {
      host = { 
        enable = true;
        enableExtensionPack = true;
      };
      guest = { 
        enable = true;
        dragAndDrop = true;
      };
    };
  };

  systemd = {
    sleep.extraConfig =
    ''AllowSuspend=yes
      AllowHibernation=yes
      AllowHybridSleep=yes
      AllowSuspendThenHibernate=no''; 
  };

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
