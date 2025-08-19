{ config, pkgs, system, inputs, ... }:

{
  home.username = builtins.getEnv "USER";
  home.homeDirectory = builtins.getEnv "HOME";
  home.packages = with pkgs; [
    inputs.zen-browser.packages."${system}".default
  ];
  home.stateVersion = "25.05"; 
  programs.home-manager.enable = true;
}
