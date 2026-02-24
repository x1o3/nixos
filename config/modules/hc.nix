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
      device = "/dev/disk/by-uuid/ED8F-FBC4";
      fsType = "exfat";
      options = [ "uid=1000" "gid=100" "umask=0002" ];
    };

    "/arsenal" = {
      device = "/dev/disk/by-uuid/11344f83-6237-44e0-867d-94b1bd668767";
      fsType = "f2fs";
    };
  };

  networking = {
    firewall = {
      allowedTCPPorts = [ 8080 4444 443 445 9991 5986 636 ];
    };
  };

  programs.proxychains = {
    enable = true;
    proxies = {
      prx1 = {
        enable = false;
        type = "http";
        host = "127.0.0.1";
        port = 8080;
      };
      ssh = {
        enable = true;
        type = "socks4";
        host = "127.0.0.1";
        port = 9009;
      };
    };
  };
}
