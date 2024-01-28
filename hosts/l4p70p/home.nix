{ config, osConfig, pkgs, lib, ... }:

{

  imports = [
    ../../modules/home-manager/firefox
    ../../modules/home-manager/thunderbird
    ../../modules/home-manager/emacs
    ../../modules/home-manager/zsh
    ../../modules/home-manager/git
    ../../modules/home-manager/gpg
    ../../modules/home-manager/r
  ];

  # home manager
  home = {
    username = osConfig.username;
    homeDirectory = osConfig.homeDir;
    packages = (with pkgs; [
      deploy-rs pass tor-browser-bundle-bin monero-gui
      libreoffice celluloid gimp
      gnome3.gnome-tweaks catppuccin
    ]) ++ (with pkgs.gnomeExtensions; [
      paperwm dash-to-panel auto-move-windows
      just-perfection blur-my-shell user-themes
      tailscale-qs syncthing-indicator
    ]);
    stateVersion = "23.05";
  };
  programs.home-manager.enable = true;

  # xdg
  xdg.enable = true;

  gtk = {
    enable = true;
    theme = lib.mkForce {
      name = "Catppuccin-Mocha-Compact-Mauve-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        size = "compact";
        tweaks = [ "rimless" ];
        variant = "mocha";
      };
    };
  };

  dconf.settings = lib.mkForce {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "auto-move-windows@gnome-shell-extensions.gcampax.github.com"
        "blur-my-shell@aunetx"
        "dash-to-panel@jderose9.github.com"
        "gsconnect@andyholmes.github.io"
        "just-perfection-desktop@just-perfection"
        "paperwm@paperwm.github.com"
        "syncthing@gnome.2nv2u.com"
        "tailscale@joaophi.github.com"
      ];
    };
    "org/gnome/shell/extensions/user-theme" = {
      name = "catppuccin";
    };
  };

  # pinentry flavor
  pinentry = "gnome3";

  # syncthing
  services.syncthing.enable = true;

}
