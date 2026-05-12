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
}
