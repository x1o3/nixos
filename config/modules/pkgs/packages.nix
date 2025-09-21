{ pkgs, ...}: {

environment.systemPackages = with pkgs; [
  # Media
  imagemagick
  nautilus
  libsForQt5.okular
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
  mako
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
  fzf 
  fd
  starship
  pipes-rs
  ghostty
  kitty
  bat
  htop
  tldr
  jq
  zoxide
  ripgrep
  # Dev
  mysql84 
  git
  deno
  neovim
  rustup
  gcc
  cmake
  bmake
  python3Full
  python313Packages.pip
  zig
  go
  stdenv.cc.cc.lib
  obsidian
  ruby
  rubyPackages.racc
  zed-editor
  vscode
  # Virtualization
  virt-manager
  qemu_kvm 
  libvirt
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
  gnupg
  ];
}
