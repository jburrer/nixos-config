# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "apps/seahorse/listing" = {
      keyrings-selected = [ "secret-service:///org/freedesktop/secrets/collection/login" ];
    };

    "apps/seahorse/windows/key-manager" = {
      height = 476;
      width = 600;
    };

    "com/gexperts/Tilix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d" = {
      visible-name = "Default";
    };

    "de/haeckerfelix/Fragments" = {
      client-last-connection = "00000000-0000-0000-0000-000000000000";
      window-height = 700;
      window-width = 900;
    };

    "io/github/celluloid-player/celluloid/window-state" = {
      height = 812;
      loop-playlist = false;
      maximized = false;
      playlist-width = 250;
      show-playlist = true;
      volume = 1.0;
      width = 1530;
    };

    "org/gnome/Console" = {
      last-window-size = mkTuple [ 956 805 ];
    };

    "org/gnome/Extensions" = {
      window-height = 902;
      window-width = 1027;
    };

    "org/gnome/Fractal" = {
      main-window-state-height = 640;
      main-window-state-maximized = false;
      main-window-state-width = 860;
      main-window-state-x = 26;
      main-window-state-y = 23;
      markdown-active = true;
    };

    "org/gnome/Music" = {
      window-size = [ 2372 1200 ];
    };

    "org/gnome/Ptyxis" = {
      default-profile-uuid = "3a4639b3849811f11ec5906266cba786";
      font-name = "Cascadia Code 11";
      profile-uuids = [ "3a4639b3849811f11ec5906266cba786" ];
      use-system-font = false;
      window-size = mkTuple [ (mkUint32 80) (mkUint32 24) ];
    };

    "org/gnome/Totem" = {
      active-plugins = [ "autoload-subtitles" "screensaver" "skipto" "open-directory" "save-file" "vimeo" "screenshot" "apple-trailers" "rotation" "recent" "mpris" "movie-properties" "variable-rate" ];
      subtitle-encoding = "UTF-8";
    };

    "org/gnome/Weather" = {
      locations = [ (mkVariant [ (mkUint32 2) (mkVariant [ "Indianapolis" "KIND" true [ (mkTuple [ 0.6933320453547475 (-1.5059040078213661) ]) ] [ (mkTuple [ 0.694089116824385 (-1.50374150997156) ]) ] ]) ]) ];
    };

    "org/gnome/baobab/ui" = {
      is-maximized = false;
      window-size = mkTuple [ 960 600 ];
    };

    "org/gnome/boxes" = {
      first-run = false;
      shared-folders = "[<{'uuid': <'887fae59-2d3f-46ac-8d20-a2a642f08957'>, 'path': <'/home/n3mo/Public'>, 'name': <'Public'>}>, <{'uuid': <'d95b9791-809a-4f44-ba44-75199fb5b2d4'>, 'path': <'/home/n3mo/Public'>, 'name': <'Public'>}>]";
      view = "icon-view";
      window-maximized = false;
      window-position = [ 26 23 ];
      window-size = [ 1538 1073 ];
    };

    "org/gnome/calculator" = {
      accuracy = 9;
      angle-units = "degrees";
      base = 10;
      button-mode = "basic";
      number-format = "automatic";
      show-thousands = false;
      show-zeroes = false;
      source-currency = "";
      source-units = "degree";
      target-currency = "";
      target-units = "radian";
      word-size = 64;
    };

    "org/gnome/clocks" = {
      world-clocks = [ {
        location = mkVariant [ (mkUint32 2) (mkVariant [ "Pune" "VAPO" true [ (mkTuple [ 0.3201911232538717 1.2837088634636014 ]) ] [ (mkTuple [ 0.3234095103945493 1.288925652597812 ]) ] ]) ];
      } {
        location = mkVariant [ (mkUint32 2) (mkVariant [ "Indianapolis" "KIND" true [ (mkTuple [ 0.6933320453547475 (-1.5059040078213661) ]) ] [ (mkTuple [ 0.694089116824385 (-1.50374150997156) ]) ] ]) ];
      } ];
    };

    "org/gnome/clocks/state/window" = {
      maximized = false;
      panel-id = "world";
      size = mkTuple [ 870 690 ];
    };

    "org/gnome/control-center" = {
      last-panel = "system";
      window-state = mkTuple [ 1406 991 false ];
    };

    "org/gnome/desktop/app-folders" = {
      folder-children = [ "Utilities" "YaST" "f5b6403e-da26-486e-8914-310af84703b3" "39b4c94d-b896-434a-8e0b-e642cf7cddb0" "ad529814-1426-4fd1-8488-ac01572789dd" "0537e84b-8238-48ea-95cf-8b50d5b5d21b" ];
    };

    "org/gnome/desktop/app-folders/folders/0537e84b-8238-48ea-95cf-8b50d5b5d21b" = {
      apps = [ "org.rncbc.qpwgraph.desktop" "org.hydrogenmusic.Hydrogen.desktop" "audacity.desktop" ];
      name = "Audio";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/39b4c94d-b896-434a-8e0b-e642cf7cddb0" = {
      apps = [ "steam.desktop" "Proton Experimental.desktop" "Steam Linux Runtime 3.0 (sniper).desktop" "net.lutris.Lutris.desktop" "Lethal Company.desktop" "Risk of Rain 2.desktop" ];
      name = "Gaming";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/Utilities" = {
      apps = [ "gnome-abrt.desktop" "gnome-system-log.desktop" "nm-connection-editor.desktop" "org.gnome.baobab.desktop" "org.gnome.Connections.desktop" "org.gnome.DejaDup.desktop" "org.gnome.Dictionary.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.eog.desktop" "org.gnome.Evince.desktop" "org.gnome.FileRoller.desktop" "org.gnome.fonts.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.Usage.desktop" "vinagre.desktop" ];
      categories = [ "X-GNOME-Utilities" ];
      excluded-apps = [ "org.gnome.tweaks.desktop" ];
      name = "X-GNOME-Utilities.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/YaST" = {
      categories = [ "X-SuSE-YaST" ];
      name = "suse-yast.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/ad529814-1426-4fd1-8488-ac01572789dd" = {
      apps = [ "com.valvesoftware.Steam.desktop" "io.github.Foldex.AdwSteamGtk.desktop" ];
      name = "Gaming";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/f5b6403e-da26-486e-8914-310af84703b3" = {
      apps = [ "startcenter.desktop" "writer.desktop" "calc.desktop" "impress.desktop" "math.desktop" "base.desktop" "draw.desktop" ];
      name = "Office";
    };

    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///home/n3mo/.local/share/backgrounds/2024-01-27-17-43-59-wallpaper.jpg";
      picture-uri-dark = "file:///home/n3mo/.local/share/backgrounds/2024-01-27-17-43-59-wallpaper.jpg";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };

    "org/gnome/desktop/input-sources" = {
      sources = [ (mkTuple [ "xkb" "us" ]) ];
      xkb-options = [ "caps:swapescape" ];
    };

    "org/gnome/desktop/interface" = {
      clock-format = "12h";
      color-scheme = "prefer-dark";
      enable-animations = true;
      enable-hot-corners = false;
      font-antialiasing = "grayscale";
      font-hinting = "slight";
      gtk-theme = "adw-gtk3-dark";
      icon-theme = "Adwaita";
    };

    "org/gnome/desktop/notifications" = {
      application-children = [ "org-gnome-nautilus" "firefox" "thunderbird" "discord" "gnome-power-panel" "gnome-network-panel" "org-gnome-shell-extensions-gsconnect" "org-gnome-settings" "de-haeckerfelix-fragments" "org-gnome-fileroller" "steam" "spotify" "org-gnome-baobab" "org-rncbc-qpwgraph" "alacritty" "audacity" ];
      show-in-lock-screen = false;
    };

    "org/gnome/desktop/notifications/application/alacritty" = {
      application-id = "Alacritty.desktop";
    };

    "org/gnome/desktop/notifications/application/audacity" = {
      application-id = "audacity.desktop";
    };

    "org/gnome/desktop/notifications/application/de-haeckerfelix-fragments" = {
      application-id = "de.haeckerfelix.Fragments.desktop";
    };

    "org/gnome/desktop/notifications/application/discord" = {
      application-id = "discord.desktop";
    };

    "org/gnome/desktop/notifications/application/firefox" = {
      application-id = "firefox.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-network-panel" = {
      application-id = "gnome-network-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-power-panel" = {
      application-id = "gnome-power-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-baobab" = {
      application-id = "org.gnome.baobab.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-fileroller" = {
      application-id = "org.gnome.FileRoller.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-nautilus" = {
      application-id = "org.gnome.Nautilus.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-settings" = {
      application-id = "org.gnome.Settings.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-shell-extensions-gsconnect" = {
      application-id = "org.gnome.Shell.Extensions.GSConnect.desktop";
    };

    "org/gnome/desktop/notifications/application/org-rncbc-qpwgraph" = {
      application-id = "org.rncbc.qpwgraph.desktop";
    };

    "org/gnome/desktop/notifications/application/spotify" = {
      application-id = "spotify.desktop";
    };

    "org/gnome/desktop/notifications/application/steam" = {
      application-id = "steam.desktop";
    };

    "org/gnome/desktop/notifications/application/thunderbird" = {
      application-id = "thunderbird.desktop";
    };

    "org/gnome/desktop/peripherals/keyboard" = {
      delay = 175;
      repeat = true;
      repeat-interval = 18;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/privacy" = {
      old-files-age = mkUint32 30;
      recent-files-max-age = -1;
    };

    "org/gnome/desktop/screensaver" = {
      color-shading-type = "solid";
      lock-enabled = false;
      picture-options = "zoom";
      picture-uri = "file:///home/n3mo/.local/share/backgrounds/2024-01-27-17-43-59-wallpaper.jpg";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };

    "org/gnome/desktop/session" = {
      idle-delay = mkUint32 0;
    };

    "org/gnome/desktop/wm/keybindings" = {
      maximize = [ "<Super>Up" ];
      move-to-monitor-down = [ "<Super><Shift>Down" ];
      move-to-monitor-left = [ "<Super><Shift>Left" ];
      move-to-monitor-right = [ "<Super><Shift>Right" ];
      move-to-monitor-up = [ "<Super><Shift>Up" ];
      move-to-workspace-down = [ "<Control><Shift><Alt>Down" ];
      move-to-workspace-left = [ "<Super><Shift>Page_Up" "<Super><Shift><Alt>Left" "<Control><Shift><Alt>Left" ];
      move-to-workspace-right = [ "<Super><Shift>Page_Down" "<Super><Shift><Alt>Right" "<Control><Shift><Alt>Right" ];
      move-to-workspace-up = [ "<Control><Shift><Alt>Up" ];
      switch-applications = [ "<Super>Tab" "<Alt>Tab" ];
      switch-applications-backward = [ "<Shift><Super>Tab" "<Shift><Alt>Tab" ];
      switch-group = [ "<Super>Above_Tab" "<Alt>Above_Tab" ];
      switch-group-backward = [ "<Shift><Super>Above_Tab" "<Shift><Alt>Above_Tab" ];
      switch-panels = [ "<Control><Alt>Tab" ];
      switch-panels-backward = [ "<Shift><Control><Alt>Tab" ];
      switch-to-workspace-1 = [ "<Super>Home" ];
      switch-to-workspace-last = [ "<Super>End" ];
      switch-to-workspace-left = [ "<Super>Page_Up" "<Super><Alt>Left" "<Control><Alt>Left" ];
      switch-to-workspace-right = [ "<Super>Page_Down" "<Super><Alt>Right" "<Control><Alt>Right" ];
      unmaximize = [ "<Super>Down" "<Alt>F5" ];
    };

    "org/gnome/desktop/wm/preferences" = {
      resize-with-right-button = true;
    };

    "org/gnome/evince/default" = {
      continuous = true;
      dual-page = false;
      dual-page-odd-left = false;
      enable-spellchecking = true;
      fullscreen = false;
      inverted-colors = false;
      show-sidebar = true;
      sidebar-page = "thumbnails";
      sidebar-size = 132;
      sizing-mode = "free";
      window-ratio = mkTuple [ 2.7529411764705882 1.3076009501187649 ];
      zoom = 1.0;
    };

    "org/gnome/evolution-data-server" = {
      migrated = true;
    };

    "org/gnome/file-roller/listing" = {
      list-mode = "as-folder";
      name-column-width = 250;
      show-path = false;
      sort-method = "name";
      sort-type = "ascending";
    };

    "org/gnome/file-roller/ui" = {
      sidebar-width = 200;
      window-height = 480;
      window-width = 600;
    };

    "org/gnome/mutter" = {
      attach-modal-dialogs = false;
      edge-tiling = false;
      overlay-key = "Super_L";
      workspaces-only-on-primary = false;
    };

    "org/gnome/mutter/keybindings" = {
      cancel-input-capture = [ "<Super><Shift>Escape" ];
      toggle-tiled-left = [ "<Super>Left" ];
      toggle-tiled-right = [ "<Super>Right" ];
    };

    "org/gnome/mutter/wayland/keybindings" = {
      restore-shortcuts = [ "<Super>Escape" ];
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "list-view";
      migrated-gtk-settings = true;
      search-filter-time-type = "last_modified";
    };

    "org/gnome/nautilus/window-state" = {
      initial-size = mkTuple [ 863 736 ];
      maximized = false;
    };

    "org/gnome/nm-applet/eap/17d3a7b1-a788-4d2e-abe0-3fd352e8e59d" = {
      ignore-ca-cert = false;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/nm-applet/eap/460b02bb-8461-49ec-a92b-d7f3d63062ea" = {
      ignore-ca-cert = false;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/nm-applet/eap/648cb431-64df-4b85-85a0-4d400ea094b5" = {
      ignore-ca-cert = false;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/photos" = {
      window-maximized = false;
      window-position = [ 26 23 ];
      window-size = [ 960 600 ];
    };

    "org/gnome/portal/filechooser/org/gnome/Settings" = {
      last-folder-path = "/home/n3mo/Documents/nixos-config";
    };

    "org/gnome/portal/filechooser/org/prismlauncher/PrismLauncher" = {
      last-folder-path = "/home/n3mo/Downloads";
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = false;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      rotate-video-lock-static = [ "<Super>o" "XF86RotationLockToggle" ];
    };

    "org/gnome/settings-daemon/plugins/power" = {
      power-button-action = "interactive";
      sleep-inactive-ac-type = "nothing";
    };

    "org/gnome/settings-daemon/plugins/sharing/gnome-user-share-webdav" = {
      enabled-connections = [];
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;
      disabled-extensions = [ "window-list@gnome-shell-extensions.gcampax.github.com" "windowsNavigator@gnome-shell-extensions.gcampax.github.com" "dash-to-panel@jderose9.github.com" "workspace-indicator@gnome-shell-extensions.gcampax.github.com" "gmind@tungstnballon.gitlab.com" "paperwm@paperwm.github.com" "apps-menu@gnome-shell-extensions.gcampax.github.com" "auto-move-windows@gnome-shell-extensions.gcampax.github.com" "just-perfection-desktop@just-perfection" "user-theme@gnome-shell-extensions.gcampax.github.com" ];
      enabled-extensions = [ "user-theme@gnome-shell-extensions.gcampax.github.com" "auto-move-windows@gnome-shell-extensions.gcampax.github.com" "dash-to-panel@jderose9.github.com" "gsconnect@andyholmes.github.io" "just-perfection-desktop@just-perfection" "paperwm@paperwm.github.com" "syncthing@gnome.2nv2u.com" "tailscale@joaophi.github.com" "rounded-window-corners@fxgn" "blur-my-shell@aunetx" "system-monitor@gnome-shell-extensions.gcampax.github.com" ];
      favorite-apps = [ "firefox.desktop" "spotify.desktop" "emacsclient.desktop" "org.gnome.Nautilus.desktop" "ardour8.desktop" "org.pipewire.Helvum.desktop" "com.obsproject.Studio.desktop" ];
      last-selected-power-profile = "performance";
      welcome-dialog-last-shown-version = "44.1";
    };

    "org/gnome/shell/extensions/blur-my-shell" = {
      settings-version = 2;
    };

    "org/gnome/shell/extensions/blur-my-shell/appfolder" = {
      brightness = 0.6;
      sigma = 30;
    };

    "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
      blur = true;
      brightness = 0.6;
      sigma = 30;
      static-blur = true;
      style-dash-to-dock = 0;
    };

    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      brightness = 0.6;
      sigma = 30;
    };

    "org/gnome/shell/extensions/blur-my-shell/window-list" = {
      brightness = 0.6;
      sigma = 30;
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      background-opacity = 0.8;
      dash-max-icon-size = 48;
      dock-position = "BOTTOM";
      height-fraction = 0.9;
      preferred-monitor = -2;
      preferred-monitor-by-connector = "DP-3";
      show-trash = false;
    };

    "org/gnome/shell/extensions/dash-to-panel" = {
      available-monitors = [ 0 ];
      primary-monitor = 0;
    };

    "org/gnome/shell/extensions/gsconnect" = {
      devices = [ "6a0b3c14_12a9_429d_a7c2_ecc4bc676fae" ];
      id = "a1484d90-aa96-4219-8037-5e9a11e0de02";
      name = "d35k70p";
      show-indicators = false;
    };

    "org/gnome/shell/extensions/gsconnect/device/157fdd31-c07b-4fbb-a4b3-95998ea8597b" = {
      incoming-capabilities = [ "kdeconnect.battery" "kdeconnect.battery.request" "kdeconnect.clipboard" "kdeconnect.clipboard.connect" "kdeconnect.connectivity_report" "kdeconnect.contacts.response_uids_timestamps" "kdeconnect.contacts.response_vcards" "kdeconnect.findmyphone.request" "kdeconnect.mousepad.echo" "kdeconnect.mousepad.keyboardstate" "kdeconnect.mousepad.request" "kdeconnect.mpris" "kdeconnect.mpris.request" "kdeconnect.notification" "kdeconnect.notification.request" "kdeconnect.ping" "kdeconnect.presenter" "kdeconnect.runcommand" "kdeconnect.runcommand.request" "kdeconnect.sftp" "kdeconnect.share.request" "kdeconnect.sms.messages" "kdeconnect.systemvolume.request" "kdeconnect.telephony" ];
      last-connection = "lan://10.0.0.168:1716";
      name = "l4p70p";
      outgoing-capabilities = [ "kdeconnect.battery" "kdeconnect.battery.request" "kdeconnect.clipboard" "kdeconnect.clipboard.connect" "kdeconnect.connectivity_report.request" "kdeconnect.contacts.request_all_uids_timestamps" "kdeconnect.contacts.request_vcards_by_uid" "kdeconnect.findmyphone.request" "kdeconnect.mousepad.echo" "kdeconnect.mousepad.keyboardstate" "kdeconnect.mousepad.request" "kdeconnect.mpris" "kdeconnect.mpris.request" "kdeconnect.notification" "kdeconnect.notification.action" "kdeconnect.notification.reply" "kdeconnect.notification.request" "kdeconnect.ping" "kdeconnect.runcommand" "kdeconnect.runcommand.request" "kdeconnect.sftp.request" "kdeconnect.share.request" "kdeconnect.sms.request" "kdeconnect.sms.request_conversation" "kdeconnect.sms.request_conversations" "kdeconnect.systemvolume" "kdeconnect.telephony.request" "kdeconnect.telephony.request_mute" ];
      supported-plugins = [ "battery" "clipboard" "findmyphone" "mousepad" "mpris" "notification" "ping" "runcommand" "share" ];
      type = "laptop";
    };

    "org/gnome/shell/extensions/gsconnect/device/1f2379f7-0591-45e0-bdb7-1fa8bf262f04" = {
      incoming-capabilities = [ "kdeconnect.battery" "kdeconnect.clipboard" "kdeconnect.clipboard.connect" "kdeconnect.connectivity_report" "kdeconnect.contacts.request_all_uids_timestamps" "kdeconnect.contacts.request_vcards_by_uid" "kdeconnect.contacts.response_uids_timestamps" "kdeconnect.contacts.response_vcards" "kdeconnect.findmyphone.request" "kdeconnect.lock" "kdeconnect.lock.request" "kdeconnect.mousepad.echo" "kdeconnect.mousepad.keyboardstate" "kdeconnect.mousepad.request" "kdeconnect.mpris" "kdeconnect.mpris.request" "kdeconnect.notification" "kdeconnect.notification.request" "kdeconnect.ping" "kdeconnect.presenter" "kdeconnect.runcommand" "kdeconnect.runcommand.request" "kdeconnect.sftp" "kdeconnect.sftp.request" "kdeconnect.share.request" "kdeconnect.share.request.update" "kdeconnect.sms.messages" "kdeconnect.systemvolume.request" "kdeconnect.telephony" ];
      last-connection = "lan://10.0.0.171:1716";
      name = "Valent";
      outgoing-capabilities = [ "kdeconnect.battery" "kdeconnect.clipboard" "kdeconnect.clipboard.connect" "kdeconnect.connectivity_report" "kdeconnect.contacts.request_all_uids_timestamps" "kdeconnect.contacts.request_vcards_by_uid" "kdeconnect.contacts.response_uids_timestamps" "kdeconnect.contacts.response_vcards" "kdeconnect.findmyphone.request" "kdeconnect.lock" "kdeconnect.lock.request" "kdeconnect.mousepad.echo" "kdeconnect.mousepad.keyboardstate" "kdeconnect.mousepad.request" "kdeconnect.mpris" "kdeconnect.mpris.request" "kdeconnect.notification" "kdeconnect.notification.action" "kdeconnect.notification.reply" "kdeconnect.notification.request" "kdeconnect.ping" "kdeconnect.presenter" "kdeconnect.runcommand" "kdeconnect.runcommand.request" "kdeconnect.sftp" "kdeconnect.sftp.request" "kdeconnect.share.request" "kdeconnect.share.request.update" "kdeconnect.sms.request" "kdeconnect.sms.request_conversation" "kdeconnect.sms.request_conversations" "kdeconnect.systemvolume" "kdeconnect.telephony.request_mute" ];
      supported-plugins = [ "battery" "clipboard" "connectivity_report" "contacts" "findmyphone" "mousepad" "mpris" "notification" "ping" "presenter" "runcommand" "sftp" "share" ];
      type = "laptop";
    };

    "org/gnome/shell/extensions/gsconnect/device/6a0b3c14_12a9_429d_a7c2_ecc4bc676fae" = {
      certificate-pem = "-----BEGIN CERTIFICATE-----nMIIDHzCCAgegAwIBAgIBATANBgkqhkiG9w0BAQsFADBTMS0wKwYDVQQDDCQ2YTBinM2MxNF8xMmE5XzQyOWRfYTdjMl9lY2M0YmM2NzZmYWUxFDASBgNVBAsMC0tERSBDnb25uZWN0MQwwCgYDVQQKDANLREUwHhcNMjIwNzE5MDQwMDAwWhcNMzIwNzE5MDQwnMDAwWjBTMS0wKwYDVQQDDCQ2YTBiM2MxNF8xMmE5XzQyOWRfYTdjMl9lY2M0YmM2nNzZmYWUxFDASBgNVBAsMC0tERSBDb25uZWN0MQwwCgYDVQQKDANLREUwggEiMA0GnCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCqvJ5M+DoOKay3ihEbi4E0yFWS+brsnXOqAEoW5dckwxho0uXSjellcPZyJDg4U7AEDtbZmmTKiDnAE+M+rnhW6/NKPKhDtnNAARig1vldYNfeielxkAgiTTegaapg/dYv2F0cvXy5eWgOCdwtMh5zStk0s0Nlf+nCLa1RSP9rDZVXVECym8B0DQFHvtgH4mSWs32G7OQ959gbNd/q9Yg6N5VL1QkaoLNnENohWHoAygPs38lnPkY6k3ZKvDqoc+b3ZXutfZcDO4PF7WRPcskktXHxcb2l1nf8ntK90WN0Ad0o05gTFfbRXVX2aLof5mjUoVH1PsuzLs3Ou/4EU1dGfAUpxAgMBAAEwnDQYJKoZIhvcNAQELBQADggEBAHsjvv5NQJuUHHcbOWoOhYmISor+bKv6NFgNVKCKnvaaug5lJRJVQbzjOFsHD+TLC/y78zDeeNKFk3NDkYtzIDK9T+nN2du4RX7V72OqInuFCjJItgiTzeyrSQce5aWNeATxTa6KAXgCL4JOTqEA62G3qegRuPC1lgN0z+yNG0nrLC2FT53MJPZ5Wgu3JVeqEbhrXh64Vk0DB23l2l4oZ5EkFjDNBeT6dRKd5k+Sn1zn5oCO5HD0wjGQiW2tlz9h/znqIAL1oYG998+hdz8Qu4wJc1awCdDZV0ueYeGzABiQnVQ5WaR2JQjb/k6Vm3DMEeg2D/MLbC5Zpjx1Rg7DEuMVhK74=n-----END CERTIFICATE-----n";
      incoming-capabilities = [ "kdeconnect.battery" "kdeconnect.bigscreen.stt" "kdeconnect.clipboard" "kdeconnect.clipboard.connect" "kdeconnect.contacts.request_all_uids_timestamps" "kdeconnect.contacts.request_vcards_by_uid" "kdeconnect.findmyphone.request" "kdeconnect.mousepad.keyboardstate" "kdeconnect.mousepad.request" "kdeconnect.mpris" "kdeconnect.mpris.request" "kdeconnect.notification" "kdeconnect.notification.action" "kdeconnect.notification.reply" "kdeconnect.notification.request" "kdeconnect.ping" "kdeconnect.runcommand" "kdeconnect.sftp.request" "kdeconnect.share.request" "kdeconnect.share.request.update" "kdeconnect.sms.request" "kdeconnect.sms.request_attachment" "kdeconnect.sms.request_conversation" "kdeconnect.sms.request_conversations" "kdeconnect.systemvolume" "kdeconnect.telephony.request" "kdeconnect.telephony.request_mute" ];
      last-connection = "lan://10.0.0.247:1716";
      name = "ph0n3";
      outgoing-capabilities = [ "kdeconnect.battery" "kdeconnect.bigscreen.stt" "kdeconnect.clipboard" "kdeconnect.clipboard.connect" "kdeconnect.connectivity_report" "kdeconnect.contacts.response_uids_timestamps" "kdeconnect.contacts.response_vcards" "kdeconnect.findmyphone.request" "kdeconnect.mousepad.echo" "kdeconnect.mousepad.keyboardstate" "kdeconnect.mousepad.request" "kdeconnect.mpris" "kdeconnect.mpris.request" "kdeconnect.notification" "kdeconnect.notification.request" "kdeconnect.ping" "kdeconnect.presenter" "kdeconnect.runcommand.request" "kdeconnect.sftp" "kdeconnect.share.request" "kdeconnect.sms.attachment_file" "kdeconnect.sms.messages" "kdeconnect.systemvolume.request" "kdeconnect.telephony" ];
      paired = true;
      supported-plugins = [ "battery" "clipboard" "connectivity_report" "contacts" "findmyphone" "mousepad" "mpris" "notification" "ping" "presenter" "runcommand" "sftp" "share" "sms" "systemvolume" "telephony" ];
      type = "phone";
    };

    "org/gnome/shell/extensions/gsconnect/device/6a0b3c14_12a9_429d_a7c2_ecc4bc676fae/plugin/battery" = {
      custom-battery-notification-value = mkUint32 80;
    };

    "org/gnome/shell/extensions/gsconnect/device/6a0b3c14_12a9_429d_a7c2_ecc4bc676fae/plugin/clipboard" = {
      receive-content = true;
      send-content = true;
    };

    "org/gnome/shell/extensions/gsconnect/device/6a0b3c14_12a9_429d_a7c2_ecc4bc676fae/plugin/notification" = {
      applications = ''
        {"Power":{"iconName":"org.gnome.Settings-power-symbolic","enabled":true},"Clocks":{"iconName":"org.gnome.clocks","enabled":true},"Color":{"iconName":"org.gnome.Settings-color-symbolic","enabled":true},"Archive Manager":{"iconName":"org.gnome.FileRoller","enabled":true},"Files":{"iconName":"org.gnome.Nautilus","enabled":true},"Printers":{"iconName":"org.gnome.Settings-printers-symbolic","enabled":true},"Disk Usage Analyzer":{"iconName":"org.gnome.baobab","enabled":true},"Console":{"iconName":"org.gnome.Console","enabled":true},"Disks":{"iconName":"org.gnome.DiskUtility","enabled":true},"Evolution Alarm Notify":{"iconName":"appointment-soon","enabled":true},"Date & Time":{"iconName":"org.gnome.Settings-time-symbolic","enabled":true},"Thunderbird":{"iconName":"","enabled":true},"discord":{"iconName":"","enabled":true},"Fragments":{"iconName":"folder-download-symbolic","enabled":true},"Lutris":{"iconName":"lutris","enabled":true},"Spotify":{"iconName":"","enabled":true},"Monero GUI":{"iconName":"monero","enabled":true},"Fractal":{"iconName":"org.gnome.Fractal","enabled":true},"File Roller":{"iconName":"org.gnome.FileRoller","enabled":true},"Events and Tasks Reminders":{"iconName":"org.gnome.Evolution-alarm-notify","enabled":true}}
      '';
    };

    "org/gnome/shell/extensions/gsconnect/device/6a0b3c14_12a9_429d_a7c2_ecc4bc676fae/plugin/share" = {
      receive-directory = "/home/n3mo/Downloads";
    };

    "org/gnome/shell/extensions/gsconnect/messaging" = {
      window-maximized = false;
      window-size = mkTuple [ 1388 733 ];
    };

    "org/gnome/shell/extensions/gsconnect/preferences" = {
      window-maximized = false;
      window-size = mkTuple [ 770 440 ];
    };

    "org/gnome/shell/extensions/just-perfection" = {
      panel-icon-size = 0;
      panel-size = 0;
      theme = true;
    };

    "org/gnome/shell/extensions/paperwm" = {
      last-used-display-server = "Wayland";
      restore-attach-modal-dialogs = "";
      restore-edge-tiling = "";
      restore-keybinds = ''
        {}
      '';
      restore-workspaces-only-on-primary = "";
    };

    "org/gnome/shell/extensions/paperwm/workspaces" = {
      list = [ "1fe29c27-d716-4286-be92-cd7c43846913" "72be8edd-0412-44ea-b524-d127e23a41d9" "4e4f070c-b1f1-47e2-b6e3-c58d44706dc2" "7557b1ca-a470-47cc-a4a8-3f893a30816d" ];
    };

    "org/gnome/shell/extensions/paperwm/workspaces/1fe29c27-d716-4286-be92-cd7c43846913" = {
      index = 0;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/4e4f070c-b1f1-47e2-b6e3-c58d44706dc2" = {
      index = 2;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/72be8edd-0412-44ea-b524-d127e23a41d9" = {
      index = 1;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/7557b1ca-a470-47cc-a4a8-3f893a30816d" = {
      index = 3;
    };

    "org/gnome/shell/extensions/rounded-window-corners-reborn" = {
      settings-version = mkUint32 5;
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "Catppuccin-Mocha-Compact-Mauve-Dark";
    };

    "org/gnome/shell/keybindings" = {
      focus-active-notification = [ "<Super>n" ];
      shift-overview-down = [ "<Super><Alt>Down" ];
      shift-overview-up = [ "<Super><Alt>Up" ];
    };

    "org/gnome/shell/weather" = {
      automatic-location = true;
      locations = [ (mkVariant [ (mkUint32 2) (mkVariant [ "Indianapolis" "KIND" true [ (mkTuple [ 0.6933320453547475 (-1.5059040078213661) ]) ] [ (mkTuple [ 0.694089116824385 (-1.50374150997156) ]) ] ]) ]) ];
    };

    "org/gnome/shell/world-clocks" = {
      locations = [ (mkVariant [ (mkUint32 2) (mkVariant [ "Pune" "VAPO" true [ (mkTuple [ 0.3201911232538717 1.2837088634636014 ]) ] [ (mkTuple [ 0.3234095103945493 1.288925652597812 ]) ] ]) ]) (mkVariant [ (mkUint32 2) (mkVariant [ "Indianapolis" "KIND" true [ (mkTuple [ 0.6933320453547475 (-1.5059040078213661) ]) ] [ (mkTuple [ 0.694089116824385 (-1.50374150997156) ]) ] ]) ]) ];
    };

    "org/gnome/software" = {
      check-timestamp = mkInt64 1706393516;
      first-run = false;
    };

    "org/gnome/terminal/legacy" = {
      default-show-menubar = true;
      schema-version = 3;
      theme-variant = "default";
    };

    "org/gnome/terminal/legacy/profiles:" = {
      default = "b1dcc9dd-5262-4d8d-a863-c897e6d979b9";
      list = [ "b1dcc9dd-5262-4d8d-a863-c897e6d979b9" ];
    };

    "org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9" = {
      audible-bell = false;
      backspace-binding = "ascii-delete";
      cursor-blink-mode = "system";
      cursor-shape = "underline";
      delete-binding = "delete-sequence";
      login-shell = false;
      scroll-on-output = true;
      scrollback-lines = 0;
      scrollbar-policy = "never";
      use-custom-command = false;
      use-system-font = true;
      use-theme-colors = true;
      visible-name = "default";
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };

    "org/gtk/gtk4/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 140;
      sort-column = "name";
      sort-directories-first = false;
      sort-order = "ascending";
      type-format = "category";
      view-type = "list";
      window-size = mkTuple [ 859 374 ];
    };

    "org/gtk/settings/emoji-chooser" = {
      recent-emoji = [ (mkTuple [ (mkTuple [ [ (mkUint32 129397) ] "hot face" "" ]) (mkUint32 0) ]) (mkTuple [ (mkTuple [ [ 129327 ] "exploding head" "" ]) 0 ]) (mkTuple [ (mkTuple [ [ 128526 ] "smiling face with sunglasses" "" ]) 0 ]) (mkTuple [ (mkTuple [ [ 128557 ] "loudly crying face" "" ]) 0 ]) (mkTuple [ (mkTuple [ [ 128170 0 ] "flexed biceps" "" ]) 0 ]) ];
    };

    "org/gtk/settings/file-chooser" = {
      clock-format = "12h";
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 174;
      sort-column = "name";
      sort-directories-first = false;
      sort-order = "ascending";
      type-format = "category";
      window-position = mkTuple [ 35 32 ];
      window-size = mkTuple [ 1203 925 ];
    };

    "org/virt-manager/virt-manager" = {
      manager-window-height = 550;
      manager-window-width = 550;
    };

    "org/virt-manager/virt-manager/vmlist-fields" = {
      disk-usage = false;
      network-traffic = false;
    };

    "system/proxy" = {
      mode = "none";
    };

  };
}
