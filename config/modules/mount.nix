{ lib, pkgs, ...}: {

  fileSystems."/x" = {
   device = "/dev/disk/by-uuid/7902EACA6C144EBC";
   fsType = "ntfs3";
   options = [ "defaults" ];
  };
  
  fileSystems."/xbackup" = {
   device = "/dev/disk/by-uuid/AAA4681CA467E971";
   fsType = "ntfs3";
   options = [ "defaults" ];
  };
}
