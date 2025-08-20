#!/usr/bin/env sh

### Must run from nixos/ root directory
dots="$(pwd)"

echo "Copying hardware-configuration.nix"
sudo cp "/etc/nixos/hardware-configuration.nix" -t "$dots/config/"

### it doesn't work as of now , will fix later :(
# echo "Adding powerManagement.cpuFreqGovernor = 'performance';"
# sudo sed -i '/imports = \[/a powerManagement.cpuFreqGovernor = "performance";' "$dots/config/hardware-configuration.nix"

echo "Building symlinks for dotfiles"
sh "$dots/dotfiles/.scripts/nixsyms.sh"

user="$(whoami)"
home="$(eval echo ~$user)"

echo "Replacing variables in ./config/home.nix"
sed -i "s|home\.username = \".*\";|home.username = \"$user\";|g" "$dots/config/home.nix"
sed -i "s|home\.homeDirectory = \".*\";|home.homeDirectory = \"$home\";|g" "$dots/config/home.nix"

echo "Replacing variables in ./flake.nix"
sed -i "s|home-manager.users\.[^.]*\.imports = \[ ./config/home.nix \];|home-manager.users.$user.imports = [ ./config/home.nix ];|g" "$dots/flake.nix"

echo "Building nixos "
sudo nixos-rebuild switch --flake "$dots#nyx" 

echo "Installation complete! ;)"
