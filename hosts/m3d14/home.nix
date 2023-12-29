{ config, pkgs, ... }:

let
  vars = import ../../vars.nix;
in
{

  imports = [
    ../../modules/home-manager/neovim.nix
    ../../modules/home-manager/zsh.nix
    ../../modules/home-manager/git.nix
    ../../modules/home-manager/gpg.nix
  ];

  # home manager
  home = {
    username = "${vars.username}";
    homeDirectory = "${vars.homeDir}";
    stateVersion = "23.05";
  };
  programs.home-manager.enable = true;


  # zsh nixos-rebuild alias
  rebuildAlias = "sudo nixos-rebuild switch --flake ${vars.homeDir}/nixos-config/#m3d14";

}
