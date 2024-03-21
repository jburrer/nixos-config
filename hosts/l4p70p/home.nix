{ config, osConfig, pkgs, lib, ... }:

{

  imports = [
    ../../modules/home-manager/gnome
    ../../modules/home-manager/firefox
    ../../modules/home-manager/thunderbird
    ../../modules/home-manager/emacs
    ../../modules/home-manager/zsh
    ../../modules/home-manager/git
    ../../modules/home-manager/gpg
    ../../modules/home-manager/r
  ];

  home = {
    username = osConfig.username;
    homeDirectory = osConfig.homeDir;
    packages = with pkgs; [
      deploy-rs pass wl-clipboard
      tor-browser-bundle-bin monero-gui
      libreoffice celluloid gimp
      spotube fractal
    ];
    stateVersion = "23.05";
  };
  programs.home-manager.enable = true;

  services.syncthing.enable = true;

}
