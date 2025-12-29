{
  boot = {
    kernelParams = [
      "resume=/dev/disk/by-uuid/438d73a0-0725-42e5-af39-013dc37529ad"
    ];
    resumeDevice = "/dev/disk/by-uuid/438d73a0-0725-42e5-af39-013dc37529ad";
  };

  swapDevices = [
    {
      device = "/dev/nvme1n1p2";
    }
  ];

  fileSystems = {
    "/x" = {
      device = "/dev/disk/by-uuid/E9AF-E819";
      fsType = "exfat";
      options = [ "uid=1000" "gid=100" "umask=0002" ];
    };
  };

  networking = {
    firewall = {
      allowedTCPPorts = [ 8080 4444 443 445 9991 ];
    };
  };

  programs.proxychains = {
    enable = true;
    proxies = {
      prx1 = {
        enable = true;
        type = "http";
        host = "127.0.0.1";
        port = 8080;
      };
    };
  };
}
