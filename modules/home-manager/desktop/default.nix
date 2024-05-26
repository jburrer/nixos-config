{ pkgs, lib, ... }:

let
  cantarellPatched = pkgs.callPackage ./cantarell-patched.nix { };
in {

  home.packages = [
    pkgs.catppuccin
    cantarellPatched
  ];

  xdg.enable = true;
  
  fonts.fontconfig.enable = true;

  stylix = {
    image = ../../../wallpaper.png;
    base16Scheme = ./catppuccin-mocha.yaml;
    polarity = "dark";
    fonts = {
      serif = {
        package = pkgs.cantarell-fonts;
        name = "Cantarell";
      };
      sansSerif = {
        package = pkgs.cantarell-fonts;
        name = "Cantarell";
      };
      monospace = {
        package = pkgs.cascadia-code;
        name = "Cascadia Code";
      };
    };
    cursor = {
      package = pkgs.catppuccin-cursors;
      size = 16;
    };
  };

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

}
