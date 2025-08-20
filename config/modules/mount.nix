{ lib, pkgs, ...}: {

  fileSystems."/x" = {
   device = "/dev/disk/by-uuid/72D1B72F7624D579";
   fsType = "ntfs3";
   options = [ "defaults" ];
  };  
}
