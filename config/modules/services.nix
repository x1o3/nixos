{ config, pkgs, batnotifyrule, batnotifyscript, ... }: {
  environment.etc."udev/rules.d/99-battery-notify.rules".source = batnotifyrule;
  environment.etc."bat_notify.sh".source = batnotifyscript;
  environment.etc."bat_notify.sh".mode = "0755";
  environment.etc."99-battery-notify.rules".mode = "0755";
}
