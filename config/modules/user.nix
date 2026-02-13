{config, lib, pkgs, ...}: {
  users.users.x1o3= {
    isNormalUser = true;
    description = "x1o3";
    extraGroups = [ "wheel" "audio" "input" "video" "networkmanager" "libvirt" "docker"];
    shell = pkgs.fish;
  };
}
