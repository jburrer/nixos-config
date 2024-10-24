{ config, pkgs, ... }: {

  # enable printing
  services.printing.enable = true;

  # enables scanning and giving my user access
  hardware.sane.enable = true;
  users.users."${config.username}".extraGroups = [ "scanner" ];

  # adds gnome scanning app
  home-manager.users.${config.username}.home.packages = with pkgs; [ simple-scan ];

}
