{ pkgs, ...}: {

environment.systemPackages = with pkgs; [
  # Media
  imagemagick
  zathura
  nautilus
  # Networking
  brave
  cloudflare-warp
  openvpn
  wget
  syncthing
  firewalld
  mlocate
  # I/O
  libinput
  ntfs3g
  blueman
  # UI Tools
  hyprland
  xdg-desktop-portal-hyprland
  waybar
  rofi
  hyprpaper
  hyprshot
  wlogout
  hyprlock
  dunst
  brightnessctl
  pamixer
  pavucontrol
  pipewire
  wl-clipboard
  # Terminal
  fish
  kitty
  tmux
  neofetch
  fastfetch
  eza
  starship
  pipes-rs
  ghostty
  bat
  htop
  tldr
  jq
  # Dev
  git
  deno
  neovim
  vimPlugins.LazyVim
  rustup
  gcc
  bmake
  python3Full
  python313Packages.pip
  zig
  obsidian
  zed-editor
  # Virtualization
  virt-manager
  virt-viewer
  virtualbox
  docker
  docker-compose
  # Themes & Fonts
  colloid-gtk-theme
  papirus-icon-theme
  bibata-cursors
  font-awesome
  nerd-fonts.fira-code
  nerd-fonts.jetbrains-mono
  noto-fonts-cjk-sans
  noto-fonts-emoji-blob-bin
  noto-fonts
  # Archives
  unzip
  zip
  p7zip
  # Add-ons
  discord
  spotify
  rsync
  ];
}
