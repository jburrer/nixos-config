{ pkgs, lib, ... }:

{

  home.packages = [ pkgs.catppuccin ];

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
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
  };


}
