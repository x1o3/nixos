#!/usr/bin/env sh

cd $HOME/.config || { echo "Failed to cd to ~/.config"; exit 1; }

for dir in zed nvim mako fastfetch fish fontconfig ghostty gtk-2.0 gtk-3.0 gtk-4.0 hypr rofi wallpapers waybar starship.toml kdeglobals wlogout; do
  echo "Linking $dir"
  rm -rf "$dir"
  ln -s $HOME/nixos/dotfiles/$dir "$dir"
done

mkdir -p "$HOME/.local/share"
cd $HOME/.local/share || { echo "Failed to cd to ~/.local/share"; exit 1; }
echo "copying color-schemes"
rm -rf color-schemes
ln -s "$HOME/nixos/dotfiles/color-schemes" color-schemes
