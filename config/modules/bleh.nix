{ pkgs, ...}: 
{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
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
    hosts = {
    "94.237.48.51" = ["academy.htb" ];
    };
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
      videoDrivers = ["modesetting"];
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };

    tlp = {
      enable = true;
      settings = {
      BAT_CRIT_LOW_LEVEL = 5;
      BAT_CRIT_ACTION = "Hibernate";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_SCALING_GOVERNOR_ON_AC = "performance";

      };
    };

    ### fallback for tlp
    upower = { 
      enable = true;
      criticalPowerAction = "Hibernate";
    };

    hypridle.enable = true;
    cloudflare-warp.enable = true;
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

  virtualisation = {
    spiceUSBRedirection.enable = true;
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        swtpm.enable = true;
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

  users.groups.mlocate = {};
  users.groups.libvirt = {};

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

  programs = {
    fish.enable = true;
    hyprland.enable = true;
    virt-manager.enable = true;
  };
   
  nixpkgs.config.allowUnfree = true;
  
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    auto-optimise-store = true;
  };

  system.stateVersion = "25.05";

}
