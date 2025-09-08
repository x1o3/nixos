{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/user.nix
      ./modules/bleh.nix
      ./modules/pkgs/tools.nix
      ./modules/pkgs/packages.nix
      ./modules/pkgs/gdrivers.nix
    ]
    # local-only configs
    ++ lib.optional (builtins.pathExists ./modules/devices.nix) ./modules/devices.nix
    ++ lib.optional (builtins.pathExists ./modules/networking.nix) ./modules/networking.nix;
}
