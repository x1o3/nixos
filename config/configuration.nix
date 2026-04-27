{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/user.nix
      ./modules/bleh.nix
      ./modules/pkgs/tools.nix
      ./modules/pkgs/packages.nix
      ./modules/hc.nix
    ];
}
