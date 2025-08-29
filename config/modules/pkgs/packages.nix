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
  acpi
  # UI Tools
  libnotify
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
  xclip
  # Terminal
  fish
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
  repgrep
  # Dev
  mysql84 
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
  ruby
  rubyPackages.racc
  zed-editor
  vscode
  # Virtualization
  virt-manager
  virt-viewer
  virtualbox
  spice-gtk
  # qemu_full
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
  # LSP Servers
  python313Packages.python-lsp-server
  rust-analyzer
  lua-language-server
  zls
  nil
  # Add-ons
  discord
  spotify
  rsync
  megasync
  ];
}
