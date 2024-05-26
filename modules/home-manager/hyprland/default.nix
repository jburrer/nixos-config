{ pkgs, config, osConfig, lib, hyprscroller, hyprspace, ... }:

{

  imports = [
    ../desktop
    ../waybar
    ../rofi
    ../zathura
  ];

  # hyprland
  wayland.windowManager.hyprland = {

    enable = true;
    systemd.variables = ["--all"];

    plugins = [
      hyprscroller.packages.${pkgs.system}.hyprscroller
      #hyprspace.packages.${pkgs.system}.Hyprspace
    ];

    settings = {

      monitor = "eDP-1,1920x1080@60,0x0,1";
      exec-once = "${pkgs.swaybg}/bin/swaybg -i ${osConfig.configDir}/wallpaper.png";
      "$mod" = "SUPER";

      general = {
        gaps_in = 2.5;
        gaps_out = 5;
        border_size = 3;
        "col.active_border" = lib.mkForce "rgb(b4befe)";
        "col.inactive_border" = lib.mkForce "rgb(181825)";
        layout = "scroller";
      };

      input = {
        kb_options = "caps:swapescape";
        repeat_delay = 250;
        repeat_rate = 50;
        natural_scroll = true;
        touchpad = {
          natural_scroll = true;
          clickfinger_behavior = true;
        };
      };

      animation = [
        "workspaces,1,8,default,slidevert"
      ];

      decoration.rounding = 10;

      misc = {
        disable_hyprland_logo = true;
        disable_autoreload = true; # doesnt seem to work with home manager, might as well disable
      };

      #gestures = {
      #  workspace_swipe = true;
      #  workspace_swipe_fingers = 3;
      #};

      plugin.scroller.column_default_width = "onehalf";

      bind = let
        screenshot_save_cmd = ''
          ${pkgs.grimblast}/bin/grimblast --notify copysave area ~/Pictures/Screenshots/$(date +'%F-%H-%M-%S').png
        '';
        screenshot_edit_cmd = ''
          ${pkgs.grimblast}/bin/grimblast --notify edit area
        '';
      in [
        #"$mod, Space, overview:toggle,"
        "$mod, D, exec, rofi -show drun"
        "$mod, Q, killactive,"

        "$mod, H, scroller:movefocus, l"
        "$mod, L, scroller:movefocus, r"
        "$mod SHIFT, H, scroller:movewindow, l"
        "$mod SHIFT, L, scroller:movewindow, r"

        "$mod, J, workspace, +1"
        "$mod, K, workspace, -1"
        "$mod SHIFT, J, movetoworkspace, +1"
        "$mod SHIFT, K, movetoworkspace, -1"

        "$mod, M, fullscreen, 1"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"

        "$mod, P, exec, ${screenshot_save_cmd}"
        "$mod SHIFT, P, exec, ${screenshot_edit_cmd}"
      ];

      bindel = let
        raise_vol_cmd = ''
          ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
        '';
        lower_vol_cmd = ''
          ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        '';
        mute_vol_cmd = ''
          ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        '';
        raise_bright_cmd = ''
          ${pkgs.brightnessctl}/bin/brightnessctl set 10%+
        '';
        lower_bright_cmd = ''
          ${pkgs.brightnessctl}/bin/brightnessctl set 10%-
        '';
      in [
        ", XF86AudioRaiseVolume, exec, ${raise_vol_cmd}"
        ", XF86AudioLowerVolume, exec, ${lower_vol_cmd}"
        ", XF86AudioMute, exec, ${mute_vol_cmd}"
        ", XF86MonBrightnessUp, exec, ${raise_bright_cmd}"
        ", XF86MonBrightnessDown, exec, ${lower_bright_cmd}"
      ];

    };

  };

  # notifications (dunst)
  services.dunst.enable = true;

  # pinentry
  pinentryPackage = pkgs.pinentry-gnome3;

  # default apps
  home.packages = with pkgs; [
    gnome.nautilus imv mpv # general apps
    iwgtk blueberry # settings apps
    libnotify
  ];

}
