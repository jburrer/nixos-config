# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "org/gnome/control-center" = {
      last-panel = "datetime";
      window-state = mkTuple [ 940 1028 false ];
    };

    "org/gnome/desktop/app-folders" = {
      folder-children = [ "Utilities" "YaST" "Pardus" "376003c9-6abb-4bd9-a2ef-997564de7ebd" "706335f8-a77f-42b7-a0ce-8128118d1b20" "d8118c86-5e9d-4927-88aa-95d2e14178d7" ];
    };

    "org/gnome/desktop/app-folders/folders/376003c9-6abb-4bd9-a2ef-997564de7ebd" = {
      apps = [ "torbrowser.desktop" "monero-wallet-gui.desktop" ];
      name = "Internet";
    };

    "org/gnome/desktop/app-folders/folders/706335f8-a77f-42b7-a0ce-8128118d1b20" = {
      apps = [ "ardour8.desktop" "org.pipewire.Helvum.desktop" "audacity.desktop" "org.hydrogenmusic.Hydrogen.desktop" "org.pitivi.Pitivi.desktop" ];
      name = "Sound & Video";
    };

    "org/gnome/desktop/app-folders/folders/Pardus" = {
      categories = [ "X-Pardus-Apps" ];
      name = "X-Pardus-Apps.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/Utilities" = {
      apps = [ "gnome-abrt.desktop" "gnome-system-log.desktop" "nm-connection-editor.desktop" "org.gnome.baobab.desktop" "org.gnome.Connections.desktop" "org.gnome.DejaDup.desktop" "org.gnome.Dictionary.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.Evince.desktop" "org.gnome.FileRoller.desktop" "org.gnome.fonts.desktop" "org.gnome.Loupe.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.tweaks.desktop" "org.gnome.Usage.desktop" "vinagre.desktop" ];
      categories = [ "X-GNOME-Utilities" ];
      name = "X-GNOME-Utilities.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/YaST" = {
      categories = [ "X-SuSE-YaST" ];
      name = "suse-yast.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/d8118c86-5e9d-4927-88aa-95d2e14178d7" = {
      apps = [ "startcenter.desktop" "writer.desktop" "calc.desktop" "impress.desktop" "draw.desktop" "math.desktop" "base.desktop" ];
      name = "Office";
    };

    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///nix/store/7rrr8dh71z89hs2db7yzj1xn55fx353z-wallpaper.jpg";
      picture-uri-dark = "file:///nix/store/7rrr8dh71z89hs2db7yzj1xn55fx353z-wallpaper.jpg";
    };

    "org/gnome/desktop/calendar" = {
      show-weekdate = false;
    };

    "org/gnome/desktop/input-sources" = {
      sources = [ (mkTuple [ "xkb" "us" ]) ];
      xkb-options = [ "caps:swapescape" ];
    };

    "org/gnome/desktop/interface" = {
      clock-format = "12h";
      clock-show-weekday = false;
      color-scheme = "prefer-dark";
      cursor-size = 16;
      cursor-theme = "Bibata-Modern-Classic";
      document-font-name = "Cantarell  11";
      enable-animations = true;
      font-name = "Cantarell 12";
      gtk-theme = "adw-gtk3";
      monospace-font-name = "Cascadia Code 12";
    };

    "org/gnome/desktop/notifications" = {
      application-children = [ "gnome-power-panel" ];
    };

    "org/gnome/desktop/notifications/application/gnome-power-panel" = {
      application-id = "gnome-power-panel.desktop";
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/wm/keybindings" = {
      maximize = [];
      move-to-monitor-down = [];
      move-to-monitor-left = [];
      move-to-monitor-right = [];
      move-to-monitor-up = [];
      switch-applications = [];
      switch-applications-backward = [];
      switch-group = [];
      switch-group-backward = [];
      switch-to-workspace-1 = [];
      switch-to-workspace-last = [];
      switch-to-workspace-left = [];
      switch-to-workspace-right = [];
      unmaximize = [];
    };

    "org/gnome/desktop/wm/preferences" = {
      workspace-names = [ "" "" "Workspace 3" "Workspace 6" "Workspace 6" ];
    };

    "org/gnome/evolution-data-server" = {
      migrated = true;
    };

    "org/gnome/mutter" = {
      attach-modal-dialogs = false;
      dynamic-workspaces = true;
      edge-tiling = false;
      workspaces-only-on-primary = false;
    };

    "org/gnome/mutter/keybindings" = {
      cancel-input-capture = [];
      toggle-tiled-left = [];
      toggle-tiled-right = [];
    };

    "org/gnome/mutter/wayland/keybindings" = {
      restore-shortcuts = [];
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      rotate-video-lock-static = [];
    };

    "org/gnome/shell" = {
      command-history = [ "lg" ];
      disabled-extensions = [ "native-window-placement@gnome-shell-extensions.gcampax.github.com" "window-list@gnome-shell-extensions.gcampax.github.com" ];
      enabled-extensions = [ "dash-to-panel@jderose9.github.com" "gsconnect@andyholmes.github.io" "just-perfection-desktop@just-perfection" "mediacontrols@cliffniff.github.com" "paperwm@paperwm.github.com" "syncthing@gnome.2nv2u.com" "tailscale@joaophi.github.com" "auto-move-windows@gnome-shell-extensions.gcampax.github.com" ];
      favorite-apps = [ "firefox.desktop" "thunderbird.desktop" "Alacritty.desktop" "org.gnome.Nautilus.desktop" "org.gnome.Settings.desktop" ];
      welcome-dialog-last-shown-version = "45.2";
    };

    "org/gnome/shell/app-switcher" = {
      current-workspace-only = false;
    };

    "org/gnome/shell/extensions/auto-move-windows" = {
      application-list = [ "thunderbird.desktop:2" ];
    };

    "org/gnome/shell/extensions/dash-to-panel" = {
      animate-appicon-hover-animation-extent = "{\"RIPPLE\":4,\"PLANK\":4,\"SIMPLE\":1}";
      appicon-margin = 4;
      appicon-padding = 6;
      available-monitors = [ 0 ];
      dot-position = "BOTTOM";
      dot-style-focused = "SEGMENTED";
      dot-style-unfocused = "SEGMENTED";
      hotkeys-overlay-combo = "TEMPORARILY";
      intellihide = false;
      leftbox-padding = -1;
      panel-anchors = "{\"0\":\"MIDDLE\"}";
      panel-element-positions = "{\"0\":[{\"element\":\"showAppsButton\",\"visible\":false,\"position\":\"stackedTL\"},{\"element\":\"activitiesButton\",\"visible\":false,\"position\":\"stackedTL\"},{\"element\":\"leftBox\",\"visible\":false,\"position\":\"stackedTL\"},{\"element\":\"taskbar\",\"visible\":true,\"position\":\"stackedTL\"},{\"element\":\"centerBox\",\"visible\":false,\"position\":\"stackedBR\"},{\"element\":\"dateMenu\",\"visible\":true,\"position\":\"centerMonitor\"},{\"element\":\"rightBox\",\"visible\":true,\"position\":\"stackedBR\"},{\"element\":\"systemMenu\",\"visible\":true,\"position\":\"stackedBR\"},{\"element\":\"desktopButton\",\"visible\":false,\"position\":\"stackedBR\"}]}";
      panel-lengths = "{\"0\":100}";
      panel-positions = "{\"0\":\"TOP\"}";
      panel-sizes = "{\"0\":32}";
      primary-monitor = 0;
      show-tooltip = false;
      show-window-previews = false;
      status-icon-padding = -1;
      stockgs-keep-dash = false;
      stockgs-keep-top-panel = false;
      trans-use-custom-gradient = false;
      tray-padding = -1;
      window-preview-title-position = "TOP";
    };

    "org/gnome/shell/extensions/gsconnect" = {
      devices = [];
      id = "a6ab0182-34de-4472-bd74-16d0f90a434e";
      name = "l4p70p";
    };

    "org/gnome/shell/extensions/gsconnect/device/6a0b3c14_12a9_429d_a7c2_ecc4bc676fae" = {
      incoming-capabilities = [ "kdeconnect.battery" "kdeconnect.bigscreen.stt" "kdeconnect.clipboard" "kdeconnect.clipboard.connect" "kdeconnect.contacts.request_all_uids_timestamps" "kdeconnect.contacts.request_vcards_by_uid" "kdeconnect.findmyphone.request" "kdeconnect.mousepad.keyboardstate" "kdeconnect.mousepad.request" "kdeconnect.mpris" "kdeconnect.mpris.request" "kdeconnect.notification" "kdeconnect.notification.action" "kdeconnect.notification.reply" "kdeconnect.notification.request" "kdeconnect.ping" "kdeconnect.runcommand" "kdeconnect.sftp.request" "kdeconnect.share.request" "kdeconnect.share.request.update" "kdeconnect.sms.request" "kdeconnect.sms.request_attachment" "kdeconnect.sms.request_conversation" "kdeconnect.sms.request_conversations" "kdeconnect.systemvolume" "kdeconnect.telephony.request" "kdeconnect.telephony.request_mute" ];
      last-connection = "lan://100.76.132.65:1716";
      name = "ph0n3";
      outgoing-capabilities = [ "kdeconnect.battery" "kdeconnect.bigscreen.stt" "kdeconnect.clipboard" "kdeconnect.clipboard.connect" "kdeconnect.connectivity_report" "kdeconnect.contacts.response_uids_timestamps" "kdeconnect.contacts.response_vcards" "kdeconnect.findmyphone.request" "kdeconnect.mousepad.echo" "kdeconnect.mousepad.keyboardstate" "kdeconnect.mousepad.request" "kdeconnect.mpris" "kdeconnect.mpris.request" "kdeconnect.notification" "kdeconnect.notification.request" "kdeconnect.ping" "kdeconnect.presenter" "kdeconnect.runcommand.request" "kdeconnect.sftp" "kdeconnect.share.request" "kdeconnect.sms.attachment_file" "kdeconnect.sms.messages" "kdeconnect.systemvolume.request" "kdeconnect.telephony" ];
      supported-plugins = [ "battery" "clipboard" "connectivity_report" "contacts" "findmyphone" "mousepad" "mpris" "notification" "ping" "presenter" "runcommand" "sftp" "share" "sms" "systemvolume" "telephony" ];
      type = "phone";
    };

    "org/gnome/shell/extensions/just-perfection" = {
      accessibility-menu = false;
      activities-button = false;
      background-menu = false;
      dash = false;
      dash-app-running = false;
      dash-separator = false;
      keyboard-layout = false;
      panel-notification-icon = true;
      panel-size = 0;
      power-icon = true;
      quick-settings = true;
      search = false;
      show-apps-button = false;
      theme = false;
      window-preview-caption = false;
      workspace = false;
      workspace-peek = true;
      workspace-popup = false;
      workspace-wrap-around = false;
      workspaces-in-app-grid = false;
      world-clock = true;
    };

    "org/gnome/shell/extensions/mediacontrols" = {
      mouse-actions = [ "toggle_play" "toggle_menu" "none" "none" "none" "none" "none" "none" ];
    };

    "org/gnome/shell/extensions/paperwm" = {
      cycle-height-steps = [ 1.0 ];
      cycle-width-steps = [ 0.5 1.0 ];
      default-focus-mode = 0;
      disable-topbar-styling = true;
      horizontal-margin = 10;
      restore-attach-modal-dialogs = "false";
      restore-edge-tiling = "false";
      restore-keybinds = ''
        {}
      '';
      restore-workspaces-only-on-primary = "false";
      show-focus-mode-icon = false;
      show-window-position-bar = false;
      show-workspace-indicator = false;
      use-default-background = true;
      winprops = [ ''
        {"wm_class":"*","title":"*","preferredWidth":"50%"}
      '' ''
        {"wm_class":"thunderbird","preferredWidth":"100%","title":""}
      '' ];
    };

    "org/gnome/shell/extensions/paperwm/workspaces" = {
      list = [ "a59ec5c3-c27a-4829-8dc7-49a728a03554" "5bb94dda-8dd0-444c-b561-1311b84fda40" "c6762542-8891-4bee-8298-b4f39f1baabc" "90c64e59-2d2c-4001-a0bb-bc5dc164f7d8" "f0bd4bb0-eeac-46db-b8c1-ee8ae2b08062" "1661b690-a1c6-4054-95c6-4d5e73b7dbf6" ];
    };

    "org/gnome/shell/extensions/paperwm/workspaces/1661b690-a1c6-4054-95c6-4d5e73b7dbf6" = {
      index = 3;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/5bb94dda-8dd0-444c-b561-1311b84fda40" = {
      index = 1;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/90c64e59-2d2c-4001-a0bb-bc5dc164f7d8" = {
      index = 5;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/a59ec5c3-c27a-4829-8dc7-49a728a03554" = {
      index = 0;
      show-top-bar = true;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/c6762542-8891-4bee-8298-b4f39f1baabc" = {
      index = 4;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/f0bd4bb0-eeac-46db-b8c1-ee8ae2b08062" = {
      index = 2;
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "Stylix";
    };

    "org/gnome/shell/keybindings" = {
      focus-active-notification = [];
      shift-overview-down = [];
      shift-overview-up = [];
    };

    "org/gnome/software" = {
      check-timestamp = mkInt64 1703360275;
      first-run = false;
    };

    "org/gtk/settings/file-chooser" = {
      clock-format = "12h";
    };

  };
}
