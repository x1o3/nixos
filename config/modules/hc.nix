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
      device = "/dev/disk/by-uuid/72D1B72F7624D579";
      fsType = "ntfs3";
      options = [ "defaults" ];
    };
  };

  networking = {
    firewall = {
      allowedTCPPorts = [ 8080 4444 443 445 9991 ];
    };
  };
}

