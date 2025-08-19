{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/x1o3.nix
      ./modules/bleh.nix
      ./modules/pkgs/tools.nix
      ./modules/pkgs/packages.nix
      ./modules/pkgs/gdrivers.nix
    ];
}
