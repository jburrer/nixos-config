{ pkgs, lib, ... }:

let
  cantarellPatched = pkgs.callPackage ./cantarell-patched.nix { };
in {

  home.packages = [
    cantarellPatched
    pkgs.catppuccin
  ];

  xdg.enable = true;
  
  fonts.fontconfig.enable = true;

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
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
  };

  pinentryPackage = pkgs.pinentry-gnome3;

}
