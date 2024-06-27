{ ... }:

{

  programs.zathura = {
    enable = true;
    options = {
      default-bg = "#181825";
      default-fg = "#cdd6f4";
      statusbar-bg = "#181825";
      statusbar-fg = "#cdd6f4";
      statusbar-h-padding = 20;
      statusbar-v-padding = 10;
      font = "Cantarell normal 12";
    };
  };
  stylix.targets.zathura.enable = false;

}
