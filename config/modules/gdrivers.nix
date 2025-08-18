{ pkgs, ... }: {

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      vpl-gpu-rt
      vaapiIntel
      intel-media-driver
    ];
  };
}

