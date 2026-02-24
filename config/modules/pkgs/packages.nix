{ config, pkgs, ...}: {

environment.systemPackages = with pkgs; [
  # Media
  ffmpeg_7-headless
  obs-studio
  vlc
  eog
  imagemagick
  kdePackages.dolphin
  kdePackages.okular
  # Networking
  tor-browser
  brave
  dhcpcd
  cloudflare-warp
  openvpn
  wget
  syncthing
  firewalld
  mlocate
  # I/O
  gparted
  gptfdisk
  exfatprogs
  libinput
  ntfs3g
  blueman
  acpi
  alsa-utils
  alsa-tools
  # UI Tools
  nms # no more secrets, nms -a
  gping
  unoconv # pptx -> pdf
  poppler-utils # merge pdfs, pdfunite
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
  qt6Packages.qt6ct
  kdePackages.breeze
  # Terminal
  powershell
  fish
  tmux
  neofetch
  fastfetch
  eza
  speedcrunch
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
  pipx
  nodejs_24
  foundry
  mysql84 
  git
  deno
  neovim
  rustup
  gcc
  cmake
  bmake
  python313
  python313Packages.pip
  zig
  jdk
  go
  stdenv.cc.cc.lib
  obsidian
  ruby
  rubyPackages.racc
  zed-editor
  vscode
  # Virtualization
  xhost
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
