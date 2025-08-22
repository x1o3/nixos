{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/user.nix
      ./modules/bleh.nix
      ./modules/pkgs/tools.nix
      ./modules/pkgs/packages.nix
      ./modules/pkgs/gdrivers.nix
      ./modules/devices.nix
    ];
}
