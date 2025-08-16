{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/packages.nix
      ./modules/x1o3.nix
      ./modules/bleh.nix
    ];
}
