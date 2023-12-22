# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "apps/seahorse/listing" = {
      item-filter = "any";
      keyrings-selected = [ "gnupg://" ];
    };

    "apps/seahorse/windows/key-manager" = {
      height = 770;
      width = 1025;
    };

    "com/github/GradienceTeam/Gradience" = {
      enabled-plugins = [ "firefox_gnome_theme" ];
      first-run = false;
      last-opened-version = "0.4.1";
      user-flatpak-theming-gtk4 = true;
    };

    "io/github/celluloid-player/celluloid/window-state" = {
      height = 902;
      loop-playlist = false;
      maximized = false;
      playlist-width = 250;
      show-playlist = false;
      volume = 1.0;
      width = 810;
    };

    "org/gnome/Console" = {
      last-window-size = mkTuple [ 973 623 ];
    };

    "org/gnome/Snapshot" = {
      is-maximized = false;
      window-height = 640;
      window-width = 800;
    };

    "org/gnome/Totem" = {
      active-plugins = [ "skipto" "apple-trailers" "movie-properties" "save-file" "screensaver" "autoload-subtitles" "mpris" "rotation" "vimeo" "variable-rate" "screenshot" "open-directory" "recent" ];
      subtitle-encoding = "UTF-8";
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
      window-maximized = false;
      window-size = mkTuple [ 360 507 ];
      word-size = 64;
    };

    "org/gnome/calendar" = {
      active-view = "month";
      week-view-zoom-level = 1.0;
      window-maximized = true;
      window-size = mkTuple [ 768 600 ];
    };

    "org/gnome/control-center" = {
      last-panel = "multitasking";
      window-state = mkTuple [ 980 640 false ];
    };

    "org/gnome/desktop/app-folders" = {
      folder-children = [ "Utilities" "YaST" "Pardus" "f123759f-fe9c-4d29-9431-77d632b393db" "c21d7f08-14b2-43f3-80e8-83f5d15f1287" "700186ed-ce99-4413-b547-5991ef813813" ];
    };

    "org/gnome/desktop/app-folders/folders/700186ed-ce99-4413-b547-5991ef813813" = {
      apps = [ "torbrowser.desktop" "monero-wallet-gui.desktop" ];
      name = "Darknet";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/Pardus" = {
      categories = [ "X-Pardus-Apps" ];
      name = "X-Pardus-Apps.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/Utilities" = {
      apps = [ "gnome-abrt.desktop" "gnome-system-log.desktop" "nm-connection-editor.desktop" "org.gnome.baobab.desktop" "org.gnome.Connections.desktop" "org.gnome.DejaDup.desktop" "org.gnome.Dictionary.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.Evince.desktop" "org.gnome.FileRoller.desktop" "org.gnome.fonts.desktop" "org.gnome.Loupe.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.Usage.desktop" "vinagre.desktop" ];
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

    "org/gnome/desktop/app-folders/folders/c21d7f08-14b2-43f3-80e8-83f5d15f1287" = {
      apps = [ "startcenter.desktop" "writer.desktop" "impress.desktop" "calc.desktop" "draw.desktop" "math.desktop" "base.desktop" ];
      name = "Office";
    };

    "org/gnome/desktop/app-folders/folders/f123759f-fe9c-4d29-9431-77d632b393db" = {
      apps = [ "ardour8.desktop" "audacity.desktop" "org.hydrogenmusic.Hydrogen.desktop" "org.pipewire.Helvum.desktop" ];
      name = "Music Prod";
      translate = false;
    };

    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///nix/store/7rrr8dh71z89hs2db7yzj1xn55fx353z-wallpaper.jpg";
      picture-uri-dark = "file:///nix/store/7rrr8dh71z89hs2db7yzj1xn55fx353z-wallpaper.jpg";
    };

    "org/gnome/desktop/input-sources" = {
      sources = [ (mkTuple [ "xkb" "us" ]) ];
      xkb-options = [ "caps:swapescape" ];
    };

    "org/gnome/desktop/interface" = {
      clock-format = "12h";
      color-scheme = "prefer-dark";
      cursor-size = 16;
      cursor-theme = "Bibata-Modern-Classic";
      document-font-name = "Cantarell  11";
      enable-animations = true;
      enable-hot-corners = false;
      font-antialiasing = "grayscale";
      font-hinting = "slight";
      font-name = "Cantarell 12";
      monospace-font-name = "Cascadia Code 12";
    };

    "org/gnome/desktop/notifications" = {
      application-children = [ "gnome-power-panel" "org-gnome-evolution-alarm-notify" "firefox" "thunderbird" "spotify" "org-gnome-shell-extensions-gsconnect" ];
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

    "org/gnome/desktop/notifications/application/org-gnome-console" = {
      application-id = "org.gnome.Console.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-evolution-alarm-notify" = {
      application-id = "org.gnome.Evolution-alarm-notify.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-shell-extensions-gsconnect" = {
      application-id = "org.gnome.Shell.Extensions.GSConnect.desktop";
    };

    "org/gnome/desktop/notifications/application/org-mpdevil-mpdevil" = {
      application-id = "org.mpdevil.mpdevil.desktop";
    };

    "org/gnome/desktop/notifications/application/org-pitivi-pitivi" = {
      application-id = "org.pitivi.Pitivi.desktop";
    };

    "org/gnome/desktop/notifications/application/spotify" = {
      application-id = "spotify.desktop";
    };

    "org/gnome/desktop/notifications/application/thunderbird" = {
      application-id = "thunderbird.desktop";
    };

    "org/gnome/desktop/wm/preferences" = {
      num-workspaces = 5;
    };

    "org/gnome/evince/default" = {
      continuous = true;
      dual-page = false;
      dual-page-odd-left = false;
      enable-spellchecking = true;
      fullscreen = false;
      inverted-colors = false;
      show-sidebar = false;
      sidebar-page = "thumbnails";
      sidebar-size = 132;
      sizing-mode = "automatic";
      window-ratio = mkTuple [ 1.568627 1.323232 ];
    };

    "org/gnome/evolution-data-server" = {
      migrated = true;
    };

    "org/gnome/evolution-data-server/calendar" = {
      notify-window-height = 281;
      notify-window-paned-position = 48;
      notify-window-width = 211;
      notify-window-x = 35;
      notify-window-y = 32;
      reminders-past = [ "5278b87b30146795708e124f5d99a720cbd99470n44cf890457dc6e42681ffa241f5d83df78e73d48t20231221T120000n1703176200n1703178000n1703187000nBEGIN:VEVENTrnCREATED:20231116T185750ZrnDTSTAMP:20231116T185831ZrnLAST-MODIFIED:20231208T014334ZrnSEQUENCE:2rnUID:178f64e8-5e30-435c-9816-412087758131rnDTSTART;TZID=America/Indiana/Indianapolis:20231221T120000rnDTEND;TZID=America/Indiana/Indianapolis:20231221T143000rnSTATUS:CONFIRMEDrnSUMMARY:WorkrnCOLOR:mediumpurplernRRULE:FREQ=WEEKLY;BYDAY=THrnX-EVOLUTION-CALDAV-ETAG:b19e73fd65a3659de54bf22048c33554rnRECURRENCE-ID;TZID=America/Indiana/Indianapolis:20231221T120000rnBEGIN:VALARMrnX-EVOLUTION-ALARM-UID:44cf890457dc6e42681ffa241f5d83df78e73d48rnACTION:DISPLAYrnTRIGGER;RELATED=START:-PT30MrnACKNOWLEDGED:20231208T014334ZrnEND:VALARMrnEND:VEVENTrn" ];
    };

    "org/gnome/gnome-system-monitor" = {
      current-tab = "processes";
      maximized = true;
      network-total-in-bits = false;
      show-dependencies = false;
      show-whose-processes = "user";
      window-state = mkTuple [ 1920 1048 0 0 ];
    };

    "org/gnome/gnome-system-monitor/disktreenew" = {
      col-6-visible = true;
      col-6-width = 0;
    };

    "org/gnome/gnome-system-monitor/proctree" = {
      columns-order = [ 0 1 2 3 4 6 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 ];
      sort-col = 0;
      sort-order = 0;
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "list-view";
      migrated-gtk-settings = true;
      search-filter-time-type = "last_modified";
    };

    "org/gnome/nautilus/window-state" = {
      initial-size = mkTuple [ 890 550 ];
      maximized = false;
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = false;
    };

    "org/gnome/shell" = {
      command-history = [ "lg" ];
      enabled-extensions = [ "gsconnect@andyholmes.github.io" "syncthing@gnome.2nv2u.com" "native-window-placement@gnome-shell-extensions.gcampax.github.com" "just-perfection-desktop@just-perfection" "auto-move-windows@gnome-shell-extensions.gcampax.github.com" "mediacontrols@cliffniff.github.com" "tailscale@joaophi.github.com" ];
      favorite-apps = [ "firefox.desktop" "thunderbird.desktop" "Alacritty.desktop" "org.gnome.Nautilus.desktop" "org.gnome.Settings.desktop" ];
      last-selected-power-profile = "power-saver";
      welcome-dialog-last-shown-version = "45.1";
    };

    "org/gnome/shell/extensions/auto-move-windows" = {
      application-list = [ "thunderbird.desktop:5" "spotify.desktop:4" ];
    };

    "org/gnome/shell/extensions/gsconnect" = {
      devices = [ "6a0b3c14_12a9_429d_a7c2_ecc4bc676fae" ];
      id = "cf4b5161-a275-4743-b0ea-f2710d1c2cb6";
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

    "org/gnome/shell/extensions/gsconnect/device/6a0b3c14_12a9_429d_a7c2_ecc4bc676fae/plugin/battery" = {
      custom-battery-notification-value = mkUint32 80;
    };

    "org/gnome/shell/extensions/gsconnect/device/6a0b3c14_12a9_429d_a7c2_ecc4bc676fae/plugin/clipboard" = {
      receive-content = true;
      send-content = true;
    };

    "org/gnome/shell/extensions/gsconnect/device/6a0b3c14_12a9_429d_a7c2_ecc4bc676fae/plugin/notification" = {
      applications = ''
        {"Power":{"iconName":"org.gnome.Settings-power-symbolic","enabled":true},"Clocks":{"iconName":"org.gnome.clocks","enabled":true},"Color":{"iconName":"org.gnome.Settings-color-symbolic","enabled":true},"Archive Manager":{"iconName":"org.gnome.FileRoller","enabled":true},"Printers":{"iconName":"org.gnome.Settings-printers-symbolic","enabled":true},"Disk Usage Analyzer":{"iconName":"org.gnome.baobab","enabled":true},"Files":{"iconName":"org.gnome.Nautilus","enabled":true},"Console":{"iconName":"org.gnome.Console","enabled":true},"Disks":{"iconName":"org.gnome.DiskUtility","enabled":true},"Evolution Alarm Notify":{"iconName":"appointment-soon","enabled":true},"Date & Time":{"iconName":"org.gnome.Settings-time-symbolic","enabled":true},"Thunderbird":{"iconName":"","enabled":true},"Spotify":{"iconName":"","enabled":true}}\n
      '';
    };

    "org/gnome/shell/extensions/gsconnect/device/6a0b3c14_12a9_429d_a7c2_ecc4bc676fae/plugin/share" = {
      receive-directory = "/home/n3mo/Downloads";
    };

    "org/gnome/shell/extensions/gsconnect/preferences" = {
      window-maximized = false;
      window-size = mkTuple [ 859 460 ];
    };

    "org/gnome/shell/extensions/just-perfection" = {
      accessibility-menu = false;
      animation = 6;
      background-menu = false;
      controls-manager-spacing-size = 0;
      dash = true;
      dash-icon-size = 48;
      dash-separator = false;
      double-super-to-appgrid = true;
      osd = true;
      panel = false;
      panel-in-overview = true;
      ripple-box = false;
      search = false;
      show-apps-button = true;
      startup-status = 1;
      theme = true;
      window-demands-attention-focus = true;
      window-picker-icon = false;
      window-preview-caption = false;
      window-preview-close-button = true;
      workspace = true;
      workspace-background-corner-size = 0;
      workspace-popup = false;
      workspace-switcher-should-show = false;
      workspace-wrap-around = true;
      workspaces-in-app-grid = false;
    };

    "org/gnome/shell/extensions/mediacontrols" = {
      colored-player-icon = false;
      extension-position = "right";
      mouse-actions = [ "toggle_play" "toggle_menu" "none" "none" "none" "none" "none" "none" ];
      show-player-icon = false;
      show-seperators = false;
      show-sources-menu = false;
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "Stylix";
    };

    "org/gnome/simple-scan" = {
      document-type = "photo";
    };

    "org/gnome/software" = {
      check-timestamp = mkInt64 1703170659;
      first-run = false;
      flatpak-purge-timestamp = mkInt64 1703171261;
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };

    "org/gtk/gtk4/settings/color-chooser" = {
      custom-colors = [ (mkTuple [ 0.211765 0.286275 0.329412 1.0 ]) (mkTuple [ 9.8039e-2 0.109804 0.117647 1.0 ]) ];
      selected-color = mkTuple [ true 0.211765 0.286275 0.329412 1.0 ];
    };

    "org/gtk/gtk4/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 140;
      sort-column = "name";
      sort-directories-first = true;
      sort-order = "ascending";
      type-format = "category";
      view-type = "list";
      window-size = mkTuple [ 931 326 ];
    };

    "org/gtk/settings/file-chooser" = {
      clock-format = "12h";
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 189;
      sort-column = "name";
      sort-directories-first = false;
      sort-order = "ascending";
      type-format = "category";
      window-position = mkTuple [ 35 32 ];
      window-size = mkTuple [ 1310 982 ];
    };

    "org/mpdevil/mpdevil" = {
      height = 691;
      maximize = false;
      paned2 = 718;
      send-notify = true;
      socket-connection = false;
      width = 1069;
    };

  };
}
