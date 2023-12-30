{ config, osConfig, pkgs, ... }:

{

  imports = [
    ../../modules/home-manager/neovim
    ../../modules/home-manager/zsh
    ../../modules/home-manager/git
    ../../modules/home-manager/gpg
  ];

  # home manager
  home = {
    username = osConfig.username;
    homeDirectory = osConfig.homeDir;
    stateVersion = "23.05";
  };
  programs.home-manager.enable = true;

}
