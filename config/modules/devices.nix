{ lib, pkgs, ...}: {

  boot = {
    kernelParams = [
      "resume=UUID=7a94bb9b-4034-460c-94b1-204ccd87bce2"
    ];
    resumeDevice = "/dev/disk/by-uuid/7a94bb9b-4034-460c-94b1-204ccd87bce2";
    powerManagement.enable = true;
    swapDevices = [
      {device = "/dev/nvme1n1p2";}
    ]; 
  };

  fileSystems."/x" = {
   device = "/dev/disk/by-uuid/72D1B72F7624D579";
   fsType = "ntfs3";
   options = [ "defaults" ];
  };  

}
