{ config, osConfig, pkgs, ... }:

{

  imports = [
    ./dconf.nix
    ../../modules/home-manager/firefox
    ../../modules/home-manager/thunderbird
    ../../modules/home-manager/alacritty
    ../../modules/home-manager/music
    ../../modules/home-manager/tmux
    ../../modules/home-manager/neovim
    ../../modules/home-manager/zsh
    ../../modules/home-manager/git
    ../../modules/home-manager/gpg
  ];

  # home manager
  home = {
    username = osConfig.username;
    homeDirectory = osConfig.homeDir;
    packages = (with pkgs; [
      pass wl-clipboard cliphist
      tor-browser-bundle-bin monero-gui
      libreoffice celluloid gimp texlive.combined.scheme-medium
      helvum ardour audacity hydrogen pitivi
			gnome3.gnome-tweaks dconf2nix
		]) ++ (with pkgs.gnomeExtensions; [
      paperwm dash-to-panel auto-move-windows
      just-perfection #blur-my-shell
      tailscale-qs syncthing-indicator media-controls
		]);
    stateVersion = "23.05";
  };
  programs.home-manager.enable = true;

  # xdg
  xdg.enable = true;

  # syncthing
  services.syncthing.enable = true;

}
