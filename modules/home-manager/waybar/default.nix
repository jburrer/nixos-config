{ ... }:

let
  style = ''

@define-color base #1e1e2e;
@define-color mantle #181825;
@define-color surface0 #313244;
@define-color surface1 #45475a;
@define-color surface2 #585b70;
@define-color text #cdd6f4;
@define-color rosewater #f5e0dc;
@define-color lavender #b4befe;
@define-color red #f38ba8;
@define-color peach #fab387;
@define-color yellow #f9e2af;
@define-color green #a6e3a1;
@define-color teal #94e2d5;
@define-color blue #89b4fa;
@define-color mauve #cba6f7;
@define-color flamingo #f2cdcd;

* {
    background: transparent;
    font-family: Cantarell;
    font-weight: bold;
    font-size: 16px;
}

.modules-left, .modules-center, .modules-right {
    background: @mantle;
    color: @text;
    opacity: 0.85;
    margin-top: 5px;
    border-radius: 10px;
}

.modules-left {
    margin-left: 5px;
}

.modules-right {
    margin-right: 5px;
}

.modules-left, .modules-right {
    padding-left: 10px;
    padding-right: 10px;
}

.modules-right * {
    padding-left: 5px;
    padding-right: 5px;
}

/*
#bluetooth {
    padding-left: 0px;
}

#battery {
    padding-right: 0px; 
}
*/

#workspaces button {
    color: @blue;
}

#workspaces button.active {
    color: @green;
}

#workspaces button.empty{
    color: @text;
}

  '';
in {

  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        output = [ "eDP-1" ];
        modules-left = [ "clock" ];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [ "bluetooth" "network" "wireplumber" "battery" "custom/powermenu" ];
        clock = {
          format = "{:%A   %I:%M %p   %m/%d}";
          timezone = "America/Indianapolis";
        };
        network = {
          format-wifi = "󰤨  {signalStrength}";
          format-ethernet = "  {signalStrength}";
          format-disconnected = "󰤭";
          on-click = "notify-send test";
        };
        wireplumber.format = "  {volume}%";
        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          max-length = 10;
          format = "{icon}  {capacity}%";
          format-warning = "{icon}  {capacity}%";
          format-critical = "{icon}  {capacity}%";
          format-charging = "  {capacity}%";
          format-plugged = "  {capacity}%";
          format-alt = "{icon}  {capacity}%";
          format-full = "  100%";
          format-icons = [ "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" ];
        };
        "custom/powermenu" = {
          format = "⏻";
        };
      };
    };
    style = "${style}";
  };

  stylix.targets.waybar.enable = false;

}
