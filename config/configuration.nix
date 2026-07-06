{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/hc.nix
      ./modules/user.nix
      ./modules/bleh.nix
      ./modules/pkgs/tools.nix
      ./modules/pkgs/packages.nix
    ];
}
