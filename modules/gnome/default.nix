{ config, pkgs, ... }:

{

  imports = [ ../desktop ];

  services = {
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      excludePackages = [ pkgs.xterm ];
    };
    dbus.packages = [ pkgs.dconf ];
    udev.packages = [ pkgs.gnome3.gnome-settings-daemon ];
  };

  environment = {
    gnome.excludePackages = (with pkgs; [
      gnome-tour gnome-connections gnome-text-editor snapshot
    ]) ++ (with pkgs.gnome; [
      epiphany geary gnome-maps yelp totem simple-scan gnome-music
    ]);
  };

  programs = {
    kdeconnect.package = pkgs.gnomeExtensions.gsconnect;
    dconf.enable = true;
  };

}
