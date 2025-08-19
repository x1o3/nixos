{ config, ... }: {

environment.etc."bat_notify.sh".source = /home/x1o3/dotfiles/.scripts/bat_notify.sh;
environment.etc."udev/rules.d/99-battery-notify.rules".source = "/home/x1o3/dotfiles/.scripts/bat_notfy.rules";
environment.etc."bat_notify.sh".mode = "0755";
}
