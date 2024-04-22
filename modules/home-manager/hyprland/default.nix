{ pkgs, hyprgrass, hyprspace, ... }:

{

  # import generic desktop stuff
  imports = [ ../desktop ];

  # hyprland
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      bind = [
        "$mod, A, exec, alacritty"
      ];
    };
    plugins = [
      # hyprgrass
      hyprgrass.packages.${pkgs.system}.default
      # hyprscoller
      # hyprspace
      hyprspace.packages.${pkgs.system}.Hyprspace
    ];
    systemd.variables = ["--all"];
  };

  # bar (waybar)

  # notifications (dunst)

  # app launcher (rofi-wayland)

  # screenshots (grim + slurp)

  # default apps
  home.packages = with pkgs; [ pcmanfm imv mpv zathura ];

}
