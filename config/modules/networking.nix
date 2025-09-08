{ lib, pkgs, ...}: {

  networking = {
    firewall = {
      allowedTCPPorts = [8080 4444 443 445 9991];
    };
  };

}
