#!/run/current-system/sw/bin/bash

cd $HOME/.config || { echo "Failed to cd to ~/.config"; exit 1; }

for dir in nvim dunst fastfetch fish fontconfig ghostty grub-theme gtk-2.0 gtk-3.0 gtk-4.0 hypr kitty rofi wallpapers waybar starship.toml wlogout; do
  echo "Linking $dir"
  rm -rf "$dir"
  ln -s $HOME/nixos/dotfiles/$dir "$dir"
done
