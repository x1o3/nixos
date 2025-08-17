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
      grub = {
        enable = true;
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

  services.blueman.enable = true;
  
  services.libinput = {
    enable = true;
    touchpad = {
    naturalScrolling = true;
    tapping = true;
    };
  };

  services.pulseaudio.enable = false;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true; 

  fonts.fontDir.enable = true;
  
  systemd.sleep.extraConfig = ''
    AllowSuspend=yes
    AllowHibernation=no
    AllowHybridSleep=yes
    AllowSuspendThenHibernate=no
  '';

  services.xserver.displayManager.defaultSession = "hyprland";

  services.xserver.enable = true;
  # services.xserver.inputDriver = "libinput";

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

  services.xserver.xkb = {
    layout = "us";
    variant = "";
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
