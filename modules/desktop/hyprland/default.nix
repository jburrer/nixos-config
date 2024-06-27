{ pkgs, lib, config, hyprscroller, ... }: {

  config = lib.mkIf (config.desktop == "hyprland") {

    # enable hyprland
    programs.hyprland.enable = true;

    # login
    services.greetd = {
      enable = true;
      settings = rec {
        initial_session = {
          command = "Hyprland";
          user = "n3mo";
        };
        default_session = initial_session;
      };
    };
    environment.etc."greetd/environments".text = ''
      Hyprland
    '';

    # kdeconnect
    programs.kdeconnect.package = pkgs.valent;

    home-manager.users.${config.username} = {

      imports = [
        ./waybar.nix
        ./rofi.nix
        ./zathura.nix
      ];

      # hyprland
      wayland.windowManager.hyprland = {

        enable = true;
        systemd.variables = ["--all"];
    
        plugins = [ hyprscroller.packages.${pkgs.system}.hyprscroller ];
    
        settings = {
    
          monitor = "eDP-1,1920x1080@60,0x0,1";
    
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
            disable_autoreload = true;
            focus_on_activate = true;
          };
    
          plugin.scroller.column_default_width = "onehalf";
    
          exec-once = lib.lists.optionals config.services.tailscale.enable [
            "${pkgs.tailscale-systray}/bin/tailscale-systray"
          ] ++ [
            "${pkgs.wl-clipboard}/bin/wl-paste --type text --watch cliphist store"
            "${pkgs.wl-clipboard}/bin/wl-paste --type image --watch cliphist store"
            "hyprctl setcursor catppuccin-mocha-mauve-cursors 16"
            "${pkgs.networkmanagerapplet}/bin/nm-applet --indicator"
            "${pkgs.thunderbird}/bin/thunderbird"
            "${pkgs.valent}/bin/valent"
          ];
    
          windowrule = [
            "workspace 2,^(thunderbird)$"
            "workspace 2,^(valent)$"
          ];
          windowrulev2 = "stayfocused, class:^(pinentry-)";
    
          bind = let
            screenshot_save_cmd = ''
              ${pkgs.grimblast}/bin/grimblast --notify copysave area ~/Pictures/Screenshots/$(date +'%F-%H-%M-%S').png
            '';
            screenshot_edit_cmd = ''
              ${pkgs.grimblast}/bin/grimblast --notify edit area
            '';
            screenshot_ocr_cmd = ''
              ${pkgs.grimblast}/bin/grimblast copysave area - | ${pkgs.tesseract}/bin/tesseract -l eng - - | ${pkgs.wl-clipboard}/bin/wl-copy && ${pkgs.dunst}/bin/dunstify "Screenshot OCR Script" "Text copied successfully !!"
            '';
            cliphist_rofi_cmd = ''
              ${pkgs.cliphist}/bin/cliphist list | ${pkgs.rofi}/bin/rofi -dmenu -p "Clipboard" | ${pkgs.cliphist}/bin/cliphist decode | ${pkgs.wl-clipboard}/bin/wl-copy
            '';
          in [
            "$mod, Space, scroller:toggleoverview,"
            "$mod, D, exec, rofi -show drun"
            "$mod, Q, killactive,"
            "$mod, X, exec, hyprlock"
    
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
    
            "$mod, o, exec, ${screenshot_ocr_cmd}"
            "$mod, P, exec, ${screenshot_save_cmd}"
            "$mod SHIFT, P, exec, ${screenshot_edit_cmd}"
            "$mod, V, exec, ${cliphist_rofi_cmd}"
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
    
      # notifications
      services.dunst = {
        enable = true;
        settings = {
          global = {
            origin = "top-center";
            offset = "0x5";
            width = "(250, 1000)";
            height = 500;
            corner_radius = 10;
            frame_width = 0;
            gap_size = 5;
            background = "#181825";
            foreground = "#cdd6f4";
            highlight = "#b4befe";
            font = "Cantarell 12";
            format = "<b>%s</b>\n%b";
          };
        };
      };
      stylix.targets.dunst.enable = false;
    
      # wallpaper
      services.hyprpaper = {
        enable = true;
        settings = {
          ipc = "off";
          splash = true;
          preload = "${config.configDir}/wallpaper.png";
          wallpaper = ",${config.configDir}/wallpaper.png";
        };
      };
    
      # lock screen
      programs.hyprlock = {
        enable = true;
        settings = {
          general = {
            hide_cursor = true;
            no_fade_in = false;
          };
          background = [
            {
              path = "screenshot";
              blur_passes = 3;
              blur_size = 8;
            }
          ];
          input-field = [
            {
              size = "300, 50";
              position = "0, 0";
              monitor = "";
              fade_on_empty = false;
              font_color = "rgb(cdd6f4)";
              inner_color = "rgb(181825)";
              outer_color = "rgb(b4befe)";
              outline_thickness = 3;
              rounding = 10;
              placeholder_text = "cave canem";
              shadow_passes = 2;
            }
          ];
        };
      };
    
      # idle daemon
      services.hypridle = {
        enable = true;
        settings = {
          general = {
            after_sleep_cmd = "hyprctl dispatch dpms on";
            ignore_dbus_inhibit = false;
            lock_cmd = "hyprlock";
          };
          listener = [
            {
              timeout = 300;
              on-timeout = "hyprlock";
            }
            {
              timeout = 360;
              on-timeout = "hyprctl dispatch dpms off";
              on-resume = "hyprctl dispatch dpms on";
            }
          ];
        };
      };
    
      services.kdeconnect = {
        enable = true;
        package = pkgs.valent;
      };
    
      services.blueman-applet.enable = true;
    
      # default apps
      home.packages = with pkgs; [
        grimblast wl-clipboard cliphist
        gnome.nautilus imv mpv
      ];

    };

  };

}
