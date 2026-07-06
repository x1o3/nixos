{
  fileSystems = {
    "/x" = {
      device = "/dev/disk/by-uuid/e8c53eef-841c-4110-a0ed-5123b4f5a2f2";
      fsType = "f2fs";
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
