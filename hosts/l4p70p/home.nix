{ config, pkgs, ... }:

let
  vars = import ../../vars.nix;
in
{

  imports = [
    ./dconf.nix
    ../../modules/home-manager/firefox.nix
    ../../modules/home-manager/thunderbird.nix
    ../../modules/home-manager/alacritty.nix
    ../../modules/home-manager/music.nix
    ../../modules/home-manager/tmux.nix
    ../../modules/home-manager/neovim.nix
    ../../modules/home-manager/zsh.nix
    ../../modules/home-manager/git.nix
    ../../modules/home-manager/gpg.nix
  ];

  # home manager
  home = {
    username = "${vars.username}";
    homeDirectory = "${vars.homeDir}";
    packages = (with pkgs; [
      pass wl-clipboard cliphist fzf jq
      tor-browser-bundle-bin monero-gui
      libreoffice celluloid gimp texlive.combined.scheme-medium
      helvum ardour audacity hydrogen pitivi
			gnome3.gnome-tweaks dconf2nix
		]) ++ (with pkgs.gnomeExtensions; [
			tailscale-qs syncthing-indicator media-controls just-perfection auto-move-windows
		]);
    stateVersion = "23.05";
  };
  programs.home-manager.enable = true;

  # xdg
  xdg.enable = true;

  # syncthing
  services.syncthing.enable = true;

  # zsh nixos-rebuild alias
  programs.zsh.shellAliases.sysrebuild =
      "sudo nixos-rebuild switch --flake ${vars.docsDir}/nixos-config/#l4p70p";

}
