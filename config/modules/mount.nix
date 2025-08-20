{ lib, pkgs, ...}: {

  fileSystems."/x" = {
   device = "/dev/disk/by-uuid/72D1B72F7624D579";
   fsType = "ntfs3";
   options = [ "defaults" ];
  };
  
  fileSystems."/xbackup" = {
   device = "/dev/disk/by-uuid/AAA4681CA467E971";
   fsType = "ntfs3";
   options = [ "defaults" ];
  };
}
