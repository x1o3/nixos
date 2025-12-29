{ config, pkgs, system, inputs, ... }:

{
  home.username = "x1o3";
  home.homeDirectory = "/home/x1o3";
  home.packages = with pkgs; [
  ];
  home.stateVersion = "25.05"; 
  programs.home-manager.enable = true;
}
