#!/usr/bin/env sh

### Must run from nixos/ directory
dots="$(pwd)"

echo "Commenting additional mountpoints and networking configs from configuration.nix"
sed -i '/\.\/modules\/hc\.nix/s/^/#/' "$dots/config/configuration.nix"

echo "Copying hardware-configuration.nix"
sudo cp "/etc/nixos/hardware-configuration.nix" -t "$dots/config/"

echo "removing xboot for grub to rewrite"
sudo rm /boot/EFI/BOOT/BOOTX64.EFI

user="$(whoami)"
home="$(eval echo ~$user)"

echo "Sourcing env.fish for fish" 
mkdir "$home/.cargo"
cp "$dots/dotfiles/env.fish" "$home/.cargo/"

echo "Symlinking all configs"
mkdir "$home/.config"

echo "Building symlinks for dotfiles"
sh "$dots/dotfiles/.scripts/nixsyms.sh"

echo "Replacing variables in ./config/home.nix"
sed -i "s|home\.username = \".*\";|home.username = \"$user\";|g" "$dots/config/home.nix"
sed -i "s|home\.homeDirectory = \".*\";|home.homeDirectory = \"$home\";|g" "$dots/config/home.nix"

echo "Replacing variables in ./flake.nix"
sed -i "s|home-manager.users\.[^.]*\.imports = \[ ./config/home.nix \];|home-manager.users.$user.imports = [ ./config/home.nix ];|g" "$dots/flake.nix"

echo "Replacing variables in ./bleh.nix"
sed -i "s|/home/x1o3/nixos/dotfiles/.scripts/battery.sh|$home/nixos/dotfiles/.scripts/battery.sh|g" "$home/nixos/config/modules/bleh.nix"

echo "Building nixos "
sudo nixos-rebuild switch --flake "$dots#nyx" 

echo "Installation complete! ;)"
