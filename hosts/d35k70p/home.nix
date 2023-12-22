{ config, pkgs, ... }:

let
  vars = import ../vars.nix;
in
{

  imports = [
    ./dconf.nix
    ./modules/home-manager/firefox.nix
    ./modules/home-manager/thunderbird.nix
    ./modules/home-manager/alacritty.nix
    ./modules/home-manager/music.nix
    ./modules/home-manager/tmux.nix
    ./modules/home-manager/neovim.nix
    ./modules/home-manager/zsh.nix
    ./modules/home-manager/git.nix
    ./modules/home-manager/ssh.nix
    ./modules/home-manager/gpg.nix
  ];

  home = {
    username = "${vars.username}";
    homeDirectory = "${vars.homeDir}";
    stateVersion = "23.05";
  };

  programs.home-manager.enable = true;

  xdg.enable = true;


}
