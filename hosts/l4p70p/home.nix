{ config, osConfig, pkgs, lib, ... }:

{

  imports = [
    ../../modules/home-manager/gpg
    ../../modules/home-manager/hyprland
    ../../modules/home-manager/firefox
    ../../modules/home-manager/thunderbird
    ../../modules/home-manager/emacs
    ../../modules/home-manager/alacritty
    ../../modules/home-manager/zsh
    ../../modules/home-manager/git
  ];

  home = {
    username = osConfig.username;
    homeDirectory = osConfig.homeDir;
    packages = with pkgs; [
      deploy-rs pass wl-clipboard
      tor-browser-bundle-bin monero-gui
      libreoffice gimp
    ];
    stateVersion = "23.05";
  };
  programs.home-manager.enable = true;

  services.syncthing.enable = true;

}
