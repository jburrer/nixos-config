# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "apps/seahorse/listing" = {
      keyrings-selected = [ "secret-service:///org/freedesktop/secrets/collection/login" ];
    };

    "apps/seahorse/windows/key-manager" = {
      height = 981;
      width = 930;
    };

    "ca/andyholmes/valent/device/6a0b3c14_12a9_429d_a7c2_ecc4bc676fae" = {
      paired = true;
    };

    "ca/andyholmes/valent/device/6a0b3c14_12a9_429d_a7c2_ecc4bc676fae/plugin/clipboard" = {
      auto-pull = true;
      auto-push = true;
    };

    "ca/andyholmes/valent/device/6a0b3c14_12a9_429d_a7c2_ecc4bc676fae/plugin/contacts" = {
      local-sync = true;
    };

    "ca/andyholmes/valent/device/6a0b3c14_12a9_429d_a7c2_ecc4bc676fae/plugin/share" = {
      download-folder = "/home/n3mo/Downloads";
    };

    "com/github/johnfactotum/Foliate" = {
      color-scheme = 0;
    };

    "com/github/johnfactotum/Foliate/viewer" = {
      fold-sidebar = true;
    };

    "com/github/johnfactotum/Foliate/viewer/font" = {
      default = mkUint32 1;
      default-size = mkUint32 18;
      monospace = "Cascadia Code PL 10";
      sans-serif = "Cantarell 10";
    };

    "com/github/johnfactotum/Foliate/viewer/view" = {
      override-font = true;
    };

    "com/github/johnfactotum/Foliate/window" = {
      default-height = 1028;
      default-width = 1860;
      fullscreened = false;
    };

    "io/bassi/Amberol" = {
      enable-recoloring = false;
      window-height = 1028;
      window-width = 1331;
    };

    "io/github/Foldex/AdwSteamGtk" = {
      color-theme-options = "Adwaita";
      hide-whats-new-switch = false;
      library-sidebar-options = "Show";
      login-qr-options = "Show";
      no-rounded-corners-switch = false;
      prefs-autostart-update-check = true;
      prefs-beta-support = false;
      window-controls-options = "Default";
      window-controls-style-options = "Default";
    };

    "io/github/celluloid-player/celluloid/window-state" = {
      height = 1028;
      loop-playlist = false;
      maximized = false;
      playlist-width = 250;
      show-playlist = false;
      volume = 1.0;
      width = 1080;
    };

    "org/blueman/general" = {
      show-statusbar = true;
      show-toolbar = true;
      window-properties = [ 1134 1232 0 0 ];
    };

    "org/blueman/plugins/recentconns" = {
      recent-connections = [ {
        adapter = "B0:3C:DC:84:30:FE";
        address = "C0:86:B3:5A:1D:5F";
        alias = "OpenRun Pro by Shokz";
        icon = "audio-headphones";
        name = "Audio and input profiles";
        uuid = "00000000-0000-0000-0000-000000000000";
        time = "1720825743.2988403";
        device = "/org/bluez/hci1/dev_C0_86_B3_5A_1D_5F";
      } ];
    };

    "org/freedesktop/folks" = {
      primary-store = "eds:9128dcf67fe61c8fd00a5e9699483fc7a85c88b0";
    };

    "org/gnome/Console" = {
      last-window-maximised = false;
      last-window-size = mkTuple [ 930 1028 ];
    };

    "org/gnome/Contacts" = {
      did-initial-setup = true;
      window-fullscreen = false;
      window-height = 1028;
      window-maximized = false;
      window-width = 930;
    };

    "org/gnome/Extensions" = {
      window-height = 1028;
      window-width = 930;
    };

    "org/gnome/Fractal/Stable" = {
      current-session = "";
      is-maximized = false;
      markdown-enabled = true;
      window-height = 1028;
      window-width = 930;
    };

    "org/gnome/Geary" = {
      migrated-config = true;
      window-height = 1028;
      window-width = 930;
    };

    "org/gnome/Loupe" = {
      show-properties = false;
    };

    "org/gnome/Music" = {
      window-maximized = false;
      window-size = [ 930 1028 ];
    };

    "org/gnome/Ptyxis" = {
      default-profile-uuid = "1f2e9b34cf4da30c47c79d6b669e8cc5";
      font-name = "Cascadia Mono PL 11";
      interface-style = "dark";
      profile-uuids = [ "1f2e9b34cf4da30c47c79d6b669e8cc5" ];
      use-system-font = false;
      window-size = mkTuple [ (mkUint32 101) (mkUint32 53) ];
    };

    "org/gnome/Ptyxis/Profiles/1f2e9b34cf4da30c47c79d6b669e8cc5" = {
      palette = "gnome";
    };

    "org/gnome/Weather" = {
      locations = [ (mkVariant [ (mkUint32 2) (mkVariant [ "Lafayette" "KLAF" true [ (mkTuple [ 0.7053311839622084 (-1.5175201513777696) ]) ] [ (mkTuple [ 0.7054045226973772 (-1.516259796765027) ]) ] ]) ]) ];
      window-height = 1028;
      window-maximized = false;
      window-width = 930;
    };

    "org/gnome/calculator" = {
      accuracy = 9;
      angle-units = "degrees";
      base = 10;
      button-mode = "advanced";
      number-format = "automatic";
      show-thousands = false;
      show-zeroes = false;
      source-currency = "DZD";
      source-units = "degree";
      target-currency = "DZD";
      target-units = "degree";
      window-maximized = false;
      window-size = mkTuple [ 930 1028 ];
      word-size = 64;
    };

    "org/gnome/calendar" = {
      active-view = "month";
      week-view-zoom-level = 1.0;
      window-maximized = false;
      window-size = mkTuple [ 930 1028 ];
    };

    "org/gnome/clocks" = {
      world-clocks = [ {
        location = mkVariant [ (mkUint32 2) (mkVariant [ "Indianapolis" "KIND" true [ (mkTuple [ 0.6933320453547475 (-1.5059040078213661) ]) ] [ (mkTuple [ 0.694089116824385 (-1.50374150997156) ]) ] ]) ];
      } {
        location = mkVariant [ (mkUint32 2) (mkVariant [ "Pune" "VAPO" true [ (mkTuple [ 0.3201911232538717 1.2837088634636014 ]) ] [ (mkTuple [ 0.3234095103945493 1.288925652597812 ]) ] ]) ];
      } ];
    };

    "org/gnome/clocks/state/window" = {
      maximized = false;
      panel-id = "world";
      size = mkTuple [ 930 1028 ];
    };

    "org/gnome/control-center" = {
      last-panel = "power";
      window-state = mkTuple [ 930 1028 false ];
    };

    "org/gnome/desktop/app-folders" = {
      folder-children = [ "Utilities" "YaST" "Pardus" "9fe9dcd5-e355-457b-818a-f4d10b3e67c7" "8cfb47c2-f9f4-4a2c-914d-44c65f23676f" "53afa509-2c79-44fb-a856-83e062657f0e" "82448d86-19ad-489e-aaa3-ae16f966d088" ];
    };

    "org/gnome/desktop/app-folders/folders/53afa509-2c79-44fb-a856-83e062657f0e" = {
      apps = [ "steam.desktop" "io.github.Foldex.AdwSteamGtk.desktop" "Factorio.desktop" "Nuclear Throne.desktop" ];
      name = "Games";
    };

    "org/gnome/desktop/app-folders/folders/82448d86-19ad-489e-aaa3-ae16f966d088" = {
      apps = [ "torbrowser.desktop" "monero-wallet-gui.desktop" ];
      name = "Internet";
    };

    "org/gnome/desktop/app-folders/folders/8cfb47c2-f9f4-4a2c-914d-44c65f23676f" = {
      apps = [ "waydroid.org.lineageos.jelly.desktop" "waydroid.com.android.inputmethod.latin.desktop" "waydroid.com.android.calculator2.desktop" "waydroid.org.lineageos.etar.desktop" "waydroid.com.android.camera2.desktop" "waydroid.com.android.deskclock.desktop" "waydroid.com.android.contacts.desktop" "waydroid.com.android.documentsui.desktop" "waydroid.com.android.gallery3d.desktop" "waydroid.com.android.vending.desktop" "waydroid.org.lineageos.eleven.desktop" "waydroid.org.lineageos.recorder.desktop" "waydroid.com.android.settings.desktop" ];
      name = "Waydroid Apps";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/9fe9dcd5-e355-457b-818a-f4d10b3e67c7" = {
      apps = [ "startcenter.desktop" "writer.desktop" "calc.desktop" "impress.desktop" "draw.desktop" "math.desktop" "base.desktop" ];
      name = "Office";
    };

    "org/gnome/desktop/app-folders/folders/Pardus" = {
      categories = [ "X-Pardus-Apps" ];
      name = "X-Pardus-Apps.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/Utilities" = {
      apps = [ "gnome-abrt.desktop" "gnome-system-log.desktop" "nm-connection-editor.desktop" "org.gnome.baobab.desktop" "org.gnome.Connections.desktop" "org.gnome.DejaDup.desktop" "org.gnome.Dictionary.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.Evince.desktop" "org.gnome.FileRoller.desktop" "org.gnome.fonts.desktop" "org.gnome.Loupe.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.Usage.desktop" "vinagre.desktop" ];
      categories = [ "X-GNOME-Utilities" ];
      excluded-apps = [ "org.gnome.tweaks.desktop" "gnome-system-monitor.desktop" ];
      name = "X-GNOME-Utilities.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/YaST" = {
      categories = [ "X-SuSE-YaST" ];
      name = "suse-yast.directory";
      translate = true;
    };

    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///home/n3mo/.local/share/backgrounds/2024-07-25-15-04-02-wallpaper.jpg";
      picture-uri-dark = "file:///home/n3mo/.local/share/backgrounds/2024-07-25-15-04-02-wallpaper.jpg";
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
      font-antialiasing = "rgba";
      font-hinting = "slight";
      gtk-theme = "adw-gtk3-dark";
      show-battery-percentage = true;
      text-scaling-factor = 1.0;
    };

    "org/gnome/desktop/notifications" = {
      application-children = [ "org-gnome-evolution-alarm-notify" "gnome-network-panel" "gnome-power-panel" "thunderbird" "org-gnome-shell-extensions-gsconnect" "firefox" "rstudio" "emacs" "startcenter" "gimp" "org-gnome-evince" "writer" "org-gnome-extensions" "org-gnome-evolution" "steam" "gotify-desktop" "com-jeffser-alpaca" "org-gnome-loupe" ];
      show-banners = true;
    };

    "org/gnome/desktop/notifications/application/alacritty" = {
      application-id = "Alacritty.desktop";
    };

    "org/gnome/desktop/notifications/application/com-jeffser-alpaca" = {
      application-id = "com.jeffser.Alpaca.desktop";
    };

    "org/gnome/desktop/notifications/application/emacs" = {
      application-id = "emacs.desktop";
    };

    "org/gnome/desktop/notifications/application/emacsclient" = {
      application-id = "emacsclient.desktop";
    };

    "org/gnome/desktop/notifications/application/firefox" = {
      application-id = "firefox.desktop";
    };

    "org/gnome/desktop/notifications/application/gimp" = {
      application-id = "gimp.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-network-panel" = {
      application-id = "gnome-network-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-power-panel" = {
      application-id = "gnome-power-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/gotify-desktop" = {
      application-id = "gotify-desktop.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-evince" = {
      application-id = "org.gnome.Evince.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-evolution-alarm-notify" = {
      application-id = "org.gnome.Evolution-alarm-notify.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-evolution" = {
      application-id = "org.gnome.Evolution.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-extensions" = {
      application-id = "org.gnome.Extensions.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-loupe" = {
      application-id = "org.gnome.Loupe.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-shell-extensions-gsconnect" = {
      application-id = "org.gnome.Shell.Extensions.GSConnect.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-tweaks" = {
      application-id = "org.gnome.tweaks.desktop";
    };

    "org/gnome/desktop/notifications/application/rstudio" = {
      application-id = "RStudio.desktop";
    };

    "org/gnome/desktop/notifications/application/startcenter" = {
      application-id = "startcenter.desktop";
    };

    "org/gnome/desktop/notifications/application/steam" = {
      application-id = "steam.desktop";
    };

    "org/gnome/desktop/notifications/application/thunderbird" = {
      application-id = "thunderbird.desktop";
    };

    "org/gnome/desktop/notifications/application/writer" = {
      application-id = "writer.desktop";
    };

    "org/gnome/desktop/peripherals/keyboard" = {
      delay = 175;
      repeat = true;
      repeat-interval = 10;
    };

    "org/gnome/desktop/privacy" = {
      old-files-age = mkUint32 30;
      recent-files-max-age = -1;
    };

    "org/gnome/desktop/screensaver" = {
      color-shading-type = "solid";
      lock-enabled = false;
      picture-options = "zoom";
      picture-uri = "file:///home/n3mo/.local/share/backgrounds/2024-07-25-15-04-02-wallpaper.jpg";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };

    "org/gnome/desktop/search-providers" = {
      enabled = [ "org.gnome.Weather.desktop" ];
      sort-order = [ "org.gnome.Contacts.desktop" "org.gnome.Documents.desktop" "org.gnome.Nautilus.desktop" ];
    };

    "org/gnome/desktop/session" = {
      idle-delay = mkUint32 0;
    };

    "org/gnome/desktop/wm/keybindings" = {
      maximize = [];
      minimize = [];
      move-to-monitor-down = [];
      move-to-monitor-left = [];
      move-to-monitor-right = [];
      move-to-monitor-up = [];
      move-to-workspace-down = [ "<Control><Shift><Alt>Down" ];
      move-to-workspace-left = [ "<Super><Shift>Page_Up" "<Super><Shift><Alt>Left" "<Control><Shift><Alt>Left" ];
      move-to-workspace-right = [ "<Super><Shift>Page_Down" "<Super><Shift><Alt>Right" "<Control><Shift><Alt>Right" ];
      move-to-workspace-up = [ "<Control><Shift><Alt>Up" ];
      switch-applications = [];
      switch-applications-backward = [];
      switch-group = [];
      switch-group-backward = [];
      switch-input-source = [ "<Super>space" "XF86Keyboard" ];
      switch-panels = [ "<Control><Alt>Tab" ];
      switch-panels-backward = [ "<Shift><Control><Alt>Tab" ];
      switch-to-workspace-1 = [];
      switch-to-workspace-last = [];
      switch-to-workspace-left = [];
      switch-to-workspace-right = [];
      unmaximize = [];
    };

    "org/gnome/desktop/wm/preferences" = {
      titlebar-font = "Cantarell Bold 13";
    };

    "org/gnome/evince" = {
      document-directory = "file:///home/n3mo/Documents/spring-2024/stat350";
    };

    "org/gnome/evince/default" = {
      continuous = true;
      dual-page = false;
      dual-page-odd-left = true;
      enable-spellchecking = true;
      fullscreen = false;
      inverted-colors = false;
      show-sidebar = false;
      sidebar-page = "thumbnails";
      sidebar-size = 176;
      sizing-mode = "free";
      window-ratio = mkTuple [ 3.0392156862745097 1.297979797979798 ];
      zoom = 0.4822530864197531;
    };

    "org/gnome/evolution-data-server" = {
      migrated = true;
    };

    "org/gnome/evolution-data-server/calendar" = {
      notify-window-height = 998;
      notify-window-paned-position = 63;
      notify-window-width = 930;
      notify-window-x = 102;
      notify-window-y = 102;
      reminders-past = [ "13b8f663e5cc6912c9c77a4fb4ee84c84390a312n64673b1a18ac74758104df38599f5b722e9aa894t20240923T163000n1727122500n1727123400n1727126400nBEGIN:VEVENTrnUID:9c0de672-9e68-4bb0-807f-e904992cdc22rnDTSTART;TZID=America/Indiana/Indianapolis:20240923T163000rnDTEND;TZID=America/Indiana/Indianapolis:20240923T172000rnCLASS:PUBLICrnDTSTAMP:20240826T171418ZrnLOCATION:BRNG 1268rnRRULE:FREQ=WEEKLY;UNTIL=20241207T000000rnSTATUS:TENTATIVErnSUMMARY:HIST 31205 LecturernLAST-MODIFIED:20240903T020131ZrnX-EVOLUTION-CALDAV-ETAG:rn 781ebaf2a1ae1ac9627f820ac403e47cdfba99649e80d79971203372616f6721rnRECURRENCE-ID;TZID=America/Indiana/Indianapolis:20240923T163000rnBEGIN:VALARMrnX-EVOLUTION-ALARM-UID:64673b1a18ac74758104df38599f5b722e9aa894rnACTION:DISPLAYrnDESCRIPTION:HIST 31205 LecturernTRIGGER;RELATED=START:-PT15MrnACKNOWLEDGED:20240903T020131ZrnEND:VALARMrnEND:VEVENTrn" "13b8f663e5cc6912c9c77a4fb4ee84c84390a312nc7af003ca495203c5ce8b5e60d2cd8d91019c14bt20240923T133000n1727111700n1727112600n1727118000nBEGIN:VEVENTrnUID:b8f4d117-af00-4b47-8b32-2e40f371f1cdrnDTSTART;TZID=America/Indiana/Indianapolis:20240923T133000rnDTEND;TZID=America/Indiana/Indianapolis:20240923T150000rnCLASS:PUBLICrnDTSTAMP:20240826T171418ZrnLOCATION:PAO B189rnRRULE:FREQ=WEEKLY;UNTIL=20241207T000000rnSTATUS:TENTATIVErnSUMMARY:MUS 270 LecturernLAST-MODIFIED:20240903T020131ZrnX-EVOLUTION-CALDAV-ETAG:rn b761a61549bd344bdf519efb1ff7d7e3dd55f068d03554f3f5ccee8971ba4ea2rnRECURRENCE-ID;TZID=America/Indiana/Indianapolis:20240923T133000rnBEGIN:VALARMrnX-EVOLUTION-ALARM-UID:c7af003ca495203c5ce8b5e60d2cd8d91019c14brnACTION:DISPLAYrnDESCRIPTION:MUS 270 LecturernTRIGGER;RELATED=START:-PT15MrnACKNOWLEDGED:20240903T020131ZrnEND:VALARMrnEND:VEVENTrn" "13b8f663e5cc6912c9c77a4fb4ee84c84390a312n919736d854b278e66b4023e071f87ebb60a1b4cct20240923T093000n1727097300n1727098200n1727101200nBEGIN:VEVENTrnUID:485ec840-4236-4430-a268-bac54b0e7a2ernDTSTART;TZID=America/Indiana/Indianapolis:20240923T093000rnDTEND;TZID=America/Indiana/Indianapolis:20240923T102000rnCLASS:PUBLICrnDTSTAMP:20240826T171300ZrnLOCATION:BHEE 129rnRRULE:FREQ=WEEKLY;UNTIL=20241207T000000rnSTATUS:TENTATIVErnSUMMARY:CS 251 LecturernLAST-MODIFIED:20240903T020132ZrnX-EVOLUTION-CALDAV-ETAG:rn 5c1a39e462d3e28c49cdf5551849268a0724b4dce6235c472ec591113ebb2b34rnRECURRENCE-ID;TZID=America/Indiana/Indianapolis:20240923T093000rnBEGIN:VALARMrnX-EVOLUTION-ALARM-UID:919736d854b278e66b4023e071f87ebb60a1b4ccrnACTION:DISPLAYrnDESCRIPTION:CS 251 LecturernTRIGGER;RELATED=START:-PT15MrnACKNOWLEDGED:20240903T020132ZrnEND:VALARMrnEND:VEVENTrn" "13b8f663e5cc6912c9c77a4fb4ee84c84390a312n8c13a85ebaf8c1552168cb97281497bedae49e7bt20240917T093000n1726578900n1726579800n1726582800nBEGIN:VEVENTrnUID:a1f3e37e-4fdf-4a96-93dc-b367b0a75a6ernDTSTART;TZID=America/Indiana/Indianapolis:20240917T093000rnDTEND;TZID=America/Indiana/Indianapolis:20240917T102000rnCLASS:PUBLICrnDTSTAMP:20240826T171453ZrnLOCATION:WTHR 420rnRRULE:FREQ=WEEKLY;UNTIL=20241207T000000rnSTATUS:TENTATIVErnSUMMARY:BIOL 110 RecitationrnX-EVOLUTION-CALDAV-ETAG:rn aab1dc3eea83c11ea66244036836a4b8afc8cbcdadf0458a1f334a895762214brnRECURRENCE-ID;TZID=America/Indiana/Indianapolis:20240917T093000rnBEGIN:VALARMrnACTION:DISPLAYrnDESCRIPTION:BIOL 110 RecitationrnTRIGGER:-PT15MrnX-EVOLUTION-ALARM-UID:8c13a85ebaf8c1552168cb97281497bedae49e7brnEND:VALARMrnEND:VEVENTrn" "13b8f663e5cc6912c9c77a4fb4ee84c84390a312n64673b1a18ac74758104df38599f5b722e9aa894t20240916T163000n1726517700n1726518600n1726521600nBEGIN:VEVENTrnUID:9c0de672-9e68-4bb0-807f-e904992cdc22rnDTSTART;TZID=America/Indiana/Indianapolis:20240916T163000rnDTEND;TZID=America/Indiana/Indianapolis:20240916T172000rnCLASS:PUBLICrnDTSTAMP:20240826T171418ZrnLOCATION:BRNG 1268rnRRULE:FREQ=WEEKLY;UNTIL=20241207T000000rnSTATUS:TENTATIVErnSUMMARY:HIST 31205 LecturernLAST-MODIFIED:20240903T020131ZrnX-EVOLUTION-CALDAV-ETAG:rn 781ebaf2a1ae1ac9627f820ac403e47cdfba99649e80d79971203372616f6721rnRECURRENCE-ID;TZID=America/Indiana/Indianapolis:20240916T163000rnBEGIN:VALARMrnX-EVOLUTION-ALARM-UID:64673b1a18ac74758104df38599f5b722e9aa894rnACTION:DISPLAYrnDESCRIPTION:HIST 31205 LecturernTRIGGER;RELATED=START:-PT15MrnACKNOWLEDGED:20240903T020131ZrnEND:VALARMrnEND:VEVENTrn" "13b8f663e5cc6912c9c77a4fb4ee84c84390a312nc7af003ca495203c5ce8b5e60d2cd8d91019c14bt20240916T133000n1726506900n1726507800n1726513200nBEGIN:VEVENTrnUID:b8f4d117-af00-4b47-8b32-2e40f371f1cdrnDTSTART;TZID=America/Indiana/Indianapolis:20240916T133000rnDTEND;TZID=America/Indiana/Indianapolis:20240916T150000rnCLASS:PUBLICrnDTSTAMP:20240826T171418ZrnLOCATION:PAO B189rnRRULE:FREQ=WEEKLY;UNTIL=20241207T000000rnSTATUS:TENTATIVErnSUMMARY:MUS 270 LecturernLAST-MODIFIED:20240903T020131ZrnX-EVOLUTION-CALDAV-ETAG:rn b761a61549bd344bdf519efb1ff7d7e3dd55f068d03554f3f5ccee8971ba4ea2rnRECURRENCE-ID;TZID=America/Indiana/Indianapolis:20240916T133000rnBEGIN:VALARMrnX-EVOLUTION-ALARM-UID:c7af003ca495203c5ce8b5e60d2cd8d91019c14brnACTION:DISPLAYrnDESCRIPTION:MUS 270 LecturernTRIGGER;RELATED=START:-PT15MrnACKNOWLEDGED:20240903T020131ZrnEND:VALARMrnEND:VEVENTrn" "13b8f663e5cc6912c9c77a4fb4ee84c84390a312n919736d854b278e66b4023e071f87ebb60a1b4cct20240916T093000n1726492500n1726493400n1726496400nBEGIN:VEVENTrnUID:485ec840-4236-4430-a268-bac54b0e7a2ernDTSTART;TZID=America/Indiana/Indianapolis:20240916T093000rnDTEND;TZID=America/Indiana/Indianapolis:20240916T102000rnCLASS:PUBLICrnDTSTAMP:20240826T171300ZrnLOCATION:BHEE 129rnRRULE:FREQ=WEEKLY;UNTIL=20241207T000000rnSTATUS:TENTATIVErnSUMMARY:CS 251 LecturernLAST-MODIFIED:20240903T020132ZrnX-EVOLUTION-CALDAV-ETAG:rn 5c1a39e462d3e28c49cdf5551849268a0724b4dce6235c472ec591113ebb2b34rnRECURRENCE-ID;TZID=America/Indiana/Indianapolis:20240916T093000rnBEGIN:VALARMrnX-EVOLUTION-ALARM-UID:919736d854b278e66b4023e071f87ebb60a1b4ccrnACTION:DISPLAYrnDESCRIPTION:CS 251 LecturernTRIGGER;RELATED=START:-PT15MrnACKNOWLEDGED:20240903T020132ZrnEND:VALARMrnEND:VEVENTrn" ];
    };

    "org/gnome/evolution" = {
      default-address-book = "9128dcf67fe61c8fd00a5e9699483fc7a85c88b0";
      default-calendar = "13b8f663e5cc6912c9c77a4fb4ee84c84390a312";
      version = "3.52.2";
    };

    "org/gnome/evolution/addressbook" = {
      completion-minimum-query-length = 3;
      completion-show-address = false;
    };

    "org/gnome/evolution/calendar" = {
      week-start-day-name = "monday";
      work-day-friday = true;
      work-day-monday = true;
      work-day-saturday = false;
      work-day-sunday = false;
      work-day-thursday = true;
      work-day-tuesday = true;
      work-day-wednesday = true;
    };

    "org/gnome/evolution/mail" = {
      browser-close-on-reply-policy = "ask";
      composer-visually-wrap-long-lines = false;
      forward-style-name = "attached";
      image-loading-policy = "never";
      junk-check-custom-header = true;
      junk-empty-on-exit-days = 0;
      junk-lookup-addressbook = false;
      paned-size = 1258785;
      prompt-check-if-default-mailer = false;
      reply-style-name = "quoted";
      to-do-bar-width = 1300000;
      trash-empty-on-exit-days = 0;
    };

    "org/gnome/evolution/mail/composer-window" = {
      height = 988;
      maximized = false;
      width = 930;
    };

    "org/gnome/evolution/shell" = {
      default-component-id = "mail";
      folder-bar-width = 305;
    };

    "org/gnome/evolution/shell/window" = {
      height = 988;
      maximized = false;
      width = 1860;
      x = 102;
      y = 102;
    };

    "org/gnome/file-roller/dialogs/extract" = {
      height = 800;
      recreate-folders = true;
      skip-newer = false;
      width = 1000;
    };

    "org/gnome/file-roller/file-selector" = {
      show-hidden = false;
      sidebar-size = 300;
      window-size = mkTuple [ (-1) (-1) ];
    };

    "org/gnome/file-roller/listing" = {
      list-mode = "as-folder";
      name-column-width = 380;
      show-path = false;
      sort-method = "name";
      sort-type = "ascending";
    };

    "org/gnome/file-roller/ui" = {
      sidebar-width = 200;
      window-height = 1028;
      window-width = 930;
    };

    "org/gnome/gnome-system-monitor" = {
      current-tab = "disks";
      maximized = false;
      network-total-in-bits = false;
      show-dependencies = false;
      show-whose-processes = "user";
      window-height = 1028;
      window-state = mkTuple [ 930 1028 102 102 ];
      window-width = 930;
    };

    "org/gnome/gnome-system-monitor/disktreenew" = {
      col-6-visible = true;
      col-6-width = 0;
    };

    "org/gnome/mutter" = {
      attach-modal-dialogs = false;
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

    "org/gnome/nautilus/compression" = {
      default-compression-format = "zip";
    };

    "org/gnome/nautilus/list-view" = {
      default-column-order = [ "name" "size" "type" "owner" "group" "permissions" "date_modified" "date_accessed" "date_created" "recency" "detailed_type" ];
      default-visible-columns = [ "name" "size" "date_modified" ];
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "list-view";
      migrated-gtk-settings = true;
      search-filter-time-type = "last_modified";
    };

    "org/gnome/nautilus/window-state" = {
      initial-size = mkTuple [ 930 1028 ];
      maximized = false;
    };

    "org/gnome/nm-applet/eap/8dee8c89-f9ac-4038-96a3-faef57c7b4ae" = {
      ignore-ca-cert = false;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/portal/filechooser/RStudio" = {
      last-folder-path = "/home/n3mo/Downloads/catppuccin-rstudio";
    };

    "org/gnome/portal/filechooser/com/github/johnfactotum/Foliate" = {
      last-folder-path = "/home/n3mo/Books";
    };

    "org/gnome/portal/filechooser/org/gnome/Settings" = {
      last-folder-path = "/home/n3mo/Documents/nixos-config";
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = false;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      rotate-video-lock-static = [];
      screensaver = [];
    };

    "org/gnome/settings-daemon/plugins/power" = {
      power-button-action = "interactive";
      sleep-inactive-ac-type = "nothing";
    };

    "org/gnome/shell" = {
      command-history = [ "echo" "lg" ];
      disable-user-extensions = false;
      disabled-extensions = [ "openbar@neuromorph" "just-perfection-desktop@just-perfection" "gmind@tungstnballon.gitlab.com" "syncthing@gnome.2nv2u.com" "appindicatorsupport@rgcjonas.gmail.com" "workspace-indicator@gnome-shell-extensions.gcampax.github.com" "user-theme@gnome-shell-extensions.gcampax.github.com" "light-style@gnome-shell-extensions.gcampax.github.com" "windowsNavigator@gnome-shell-extensions.gcampax.github.com" "Rounded_Corners@lennart-k" "dash-to-panel@jderose9.github.com" "rounded-window-corners@fxgn" "apps-menu@gnome-shell-extensions.gcampax.github.com" "auto-move-windows@gnome-shell-extensions.gcampax.github.com" ];
      enabled-extensions = [ "blur-my-shell@aunetx" "tailscale@joaophi.github.com" "system-monitor@gnome-shell-extensions.gcampax.github.com" "gsconnect@andyholmes.github.io" "caffeine@patapon.info" "paperwm@paperwm.github.com" ];
      favorite-apps = [ "firefox.desktop" "thunderbird.desktop" "emacsclient.desktop" "io.bassi.Amberol.desktop" "org.gnome.Nautilus.desktop" ];
      last-selected-power-profile = "performance";
      welcome-dialog-last-shown-version = "45.3";
    };

    "org/gnome/shell/extensions/auto-move-windows" = {
      application-list = [ "thunderbird.desktop:2" ];
    };

    "org/gnome/shell/extensions/blur-my-shell" = {
      settings-version = 2;
    };

    "org/gnome/shell/extensions/blur-my-shell/appfolder" = {
      brightness = 0.6;
      sigma = 30;
    };

    "org/gnome/shell/extensions/blur-my-shell/applications" = {
      blur = true;
      brightness = 0.6;
      opacity = 224;
      sigma = 30;
      whitelist = [ "emacs" ];
    };

    "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
      blur = true;
      brightness = 0.6;
      sigma = 30;
      static-blur = true;
      style-dash-to-dock = 0;
    };

    "org/gnome/shell/extensions/blur-my-shell/dash-to-panel" = {
      blur-original-panel = true;
    };

    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      brightness = 0.6;
      sigma = 30;
      unblur-in-overview = true;
    };

    "org/gnome/shell/extensions/blur-my-shell/window-list" = {
      brightness = 0.6;
      sigma = 30;
    };

    "org/gnome/shell/extensions/caffeine" = {
      countdown-timer = 0;
      indicator-position-max = 1;
    };

    "org/gnome/shell/extensions/dash-to-panel" = {
      animate-appicon-hover = false;
      animate-appicon-hover-animation-extent = {
        RIPPLE = 4;
        PLANK = 4;
        SIMPLE = 1;
      };
      appicon-margin = 8;
      appicon-padding = 4;
      available-monitors = [ 0 ];
      click-action = "MINIMIZE";
      dot-position = "BOTTOM";
      dot-style-focused = "DASHES";
      dot-style-unfocused = "DASHES";
      group-apps = true;
      hotkeys-overlay-combo = "TEMPORARILY";
      leftbox-padding = -1;
      leftbox-size = 0;
      panel-anchors = ''
        {"0":"MIDDLE"}
      '';
      panel-element-positions = ''
        {"0":[{"element":"taskbar","visible":true,"position":"stackedTL"},{"element":"showAppsButton","visible":false,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":false,"position":"stackedTL"},{"element":"centerBox","visible":false,"position":"centered"},{"element":"dateMenu","visible":true,"position":"centerMonitor"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":false,"position":"stackedBR"}]}
      '';
      panel-element-positions-monitors-sync = true;
      panel-lengths = ''
        {"0":100}
      '';
      panel-positions = ''
        {"0":"TOP"}
      '';
      panel-sizes = ''
        {"0":32}
      '';
      primary-monitor = 0;
      progress-show-count = true;
      scroll-icon-action = "NOTHING";
      scroll-panel-action = "NOTHING";
      show-favorites-all-monitors = false;
      show-running-apps = true;
      show-window-previews = false;
      status-icon-padding = -1;
      stockgs-keep-dash = false;
      stockgs-keep-top-panel = false;
      trans-panel-opacity = 0.0;
      trans-use-custom-opacity = true;
      tray-padding = -1;
      tray-size = 16;
      window-preview-title-position = "TOP";
    };

    "org/gnome/shell/extensions/gsconnect" = {
      devices = [ "6a0b3c14_12a9_429d_a7c2_ecc4bc676fae" ];
      enabled = true;
      id = "223f0800-e774-4074-b48d-1b39d63fd130";
      name = "l4p70p";
      show-indicators = false;
    };

    "org/gnome/shell/extensions/gsconnect/device/6a0b3c14_12a9_429d_a7c2_ecc4bc676fae" = {
      certificate-pem = "-----BEGIN CERTIFICATE-----nMIIDHzCCAgegAwIBAgIBATANBgkqhkiG9w0BAQsFADBTMS0wKwYDVQQDDCQ2YTBinM2MxNF8xMmE5XzQyOWRfYTdjMl9lY2M0YmM2NzZmYWUxFDASBgNVBAsMC0tERSBDnb25uZWN0MQwwCgYDVQQKDANLREUwHhcNMjIwNzE5MDQwMDAwWhcNMzIwNzE5MDQwnMDAwWjBTMS0wKwYDVQQDDCQ2YTBiM2MxNF8xMmE5XzQyOWRfYTdjMl9lY2M0YmM2nNzZmYWUxFDASBgNVBAsMC0tERSBDb25uZWN0MQwwCgYDVQQKDANLREUwggEiMA0GnCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCqvJ5M+DoOKay3ihEbi4E0yFWS+brsnXOqAEoW5dckwxho0uXSjellcPZyJDg4U7AEDtbZmmTKiDnAE+M+rnhW6/NKPKhDtnNAARig1vldYNfeielxkAgiTTegaapg/dYv2F0cvXy5eWgOCdwtMh5zStk0s0Nlf+nCLa1RSP9rDZVXVECym8B0DQFHvtgH4mSWs32G7OQ959gbNd/q9Yg6N5VL1QkaoLNnENohWHoAygPs38lnPkY6k3ZKvDqoc+b3ZXutfZcDO4PF7WRPcskktXHxcb2l1nf8ntK90WN0Ad0o05gTFfbRXVX2aLof5mjUoVH1PsuzLs3Ou/4EU1dGfAUpxAgMBAAEwnDQYJKoZIhvcNAQELBQADggEBAHsjvv5NQJuUHHcbOWoOhYmISor+bKv6NFgNVKCKnvaaug5lJRJVQbzjOFsHD+TLC/y78zDeeNKFk3NDkYtzIDK9T+nN2du4RX7V72OqInuFCjJItgiTzeyrSQce5aWNeATxTa6KAXgCL4JOTqEA62G3qegRuPC1lgN0z+yNG0nrLC2FT53MJPZ5Wgu3JVeqEbhrXh64Vk0DB23l2l4oZ5EkFjDNBeT6dRKd5k+Sn1zn5oCO5HD0wjGQiW2tlz9h/znqIAL1oYG998+hdz8Qu4wJc1awCdDZV0ueYeGzABiQnVQ5WaR2JQjb/k6Vm3DMEeg2D/MLbC5Zpjx1Rg7DEuMVhK74=n-----END CERTIFICATE-----n";
      incoming-capabilities = [ "kdeconnect.battery" "kdeconnect.bigscreen.stt" "kdeconnect.clipboard" "kdeconnect.clipboard.connect" "kdeconnect.contacts.request_all_uids_timestamps" "kdeconnect.contacts.request_vcards_by_uid" "kdeconnect.findmyphone.request" "kdeconnect.mousepad.keyboardstate" "kdeconnect.mousepad.request" "kdeconnect.mpris" "kdeconnect.mpris.request" "kdeconnect.notification" "kdeconnect.notification.action" "kdeconnect.notification.reply" "kdeconnect.notification.request" "kdeconnect.ping" "kdeconnect.runcommand" "kdeconnect.sftp.request" "kdeconnect.share.request" "kdeconnect.share.request.update" "kdeconnect.sms.request" "kdeconnect.sms.request_attachment" "kdeconnect.sms.request_conversation" "kdeconnect.sms.request_conversations" "kdeconnect.systemvolume" "kdeconnect.telephony.request" "kdeconnect.telephony.request_mute" ];
      last-connection = "lan://100.94.146.2:1716";
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
        {"Power":{"iconName":"org.gnome.Settings-power-symbolic","enabled":true},"Software":{"iconName":"org.gnome.Software","enabled":true},"Clocks":{"iconName":"org.gnome.clocks","enabled":true},"Color":{"iconName":"org.gnome.Settings-color-symbolic","enabled":true},"Archive Manager":{"iconName":"org.gnome.FileRoller","enabled":true},"Printers":{"iconName":"org.gnome.Settings-printers-symbolic","enabled":true},"Disk Usage Analyzer":{"iconName":"org.gnome.baobab","enabled":true},"Files":{"iconName":"org.gnome.Nautilus","enabled":true},"Disks":{"iconName":"org.gnome.DiskUtility","enabled":true},"Evolution Alarm Notify":{"iconName":"appointment-soon","enabled":true},"Date & Time":{"iconName":"org.gnome.Settings-time-symbolic","enabled":true},"Thunderbird":{"iconName":"","enabled":true},"Argos":{"iconName":"media-optical","enabled":true},"Events and Tasks Reminders":{"iconName":"appointment-soon","enabled":true},"Gotify Desktop":{"iconName":"/home/n3mo/.cache/gotify-desktop/defaultapp.png","enabled":true},"notify-send":{"iconName":"","enabled":true},"Alpaca":{"iconName":"emblem-ok-symbolic","enabled":true},"File Roller":{"iconName":"org.gnome.FileRoller","enabled":true},"goldwarden":{"iconName":"","enabled":true}}
      '';
    };

    "org/gnome/shell/extensions/gsconnect/device/6a0b3c14_12a9_429d_a7c2_ecc4bc676fae/plugin/share" = {
      receive-directory = "/home/n3mo/Downloads";
    };

    "org/gnome/shell/extensions/gsconnect/device/_5ec8300a_6aea_4b54_ab79_fa6924b21b1a_" = {
      incoming-capabilities = [ "kdeconnect.battery" "kdeconnect.battery.request" "kdeconnect.bigscreen.stt" "kdeconnect.clipboard" "kdeconnect.clipboard.connect" "kdeconnect.connectivity_report" "kdeconnect.contacts.response_uids_timestamps" "kdeconnect.contacts.response_vcards" "kdeconnect.findmyphone.request" "kdeconnect.lock" "kdeconnect.lock.request" "kdeconnect.mousepad.echo" "kdeconnect.mousepad.keyboardstate" "kdeconnect.mousepad.request" "kdeconnect.mpris" "kdeconnect.mpris.request" "kdeconnect.notification" "kdeconnect.notification.request" "kdeconnect.photo" "kdeconnect.ping" "kdeconnect.presenter" "kdeconnect.runcommand" "kdeconnect.runcommand.request" "kdeconnect.sftp" "kdeconnect.share.request" "kdeconnect.sms.attachment_file" "kdeconnect.sms.messages" "kdeconnect.systemvolume" "kdeconnect.systemvolume.request" "kdeconnect.telephony" "kdeconnect.telephony.request_mute" "kdeconnect.virtualmonitor" "kdeconnect.virtualmonitor.request" ];
      last-connection = "lan://192.168.1.111:1716";
      name = "neolsd";
      outgoing-capabilities = [ "kdeconnect.battery" "kdeconnect.battery.request" "kdeconnect.bigscreen.stt" "kdeconnect.clipboard" "kdeconnect.clipboard.connect" "kdeconnect.connectivity_report.request" "kdeconnect.contacts.request_all_uids_timestamps" "kdeconnect.contacts.request_vcards_by_uid" "kdeconnect.findmyphone.request" "kdeconnect.lock" "kdeconnect.lock.request" "kdeconnect.mousepad.keyboardstate" "kdeconnect.mousepad.request" "kdeconnect.mpris" "kdeconnect.mpris.request" "kdeconnect.notification" "kdeconnect.notification.action" "kdeconnect.notification.reply" "kdeconnect.notification.request" "kdeconnect.photo.request" "kdeconnect.ping" "kdeconnect.runcommand" "kdeconnect.runcommand.request" "kdeconnect.sftp.request" "kdeconnect.share.request" "kdeconnect.share.request.update" "kdeconnect.sms.request" "kdeconnect.sms.request_attachment" "kdeconnect.sms.request_conversation" "kdeconnect.sms.request_conversations" "kdeconnect.systemvolume" "kdeconnect.systemvolume.request" "kdeconnect.telephony" "kdeconnect.telephony.request_mute" "kdeconnect.virtualmonitor" "kdeconnect.virtualmonitor.request" ];
      supported-plugins = [ "battery" "clipboard" "findmyphone" "mousepad" "mpris" "notification" "ping" "runcommand" "share" "systemvolume" "telephony" ];
      type = "desktop";
    };

    "org/gnome/shell/extensions/gsconnect/device/a1484d90-aa96-4219-8037-5e9a11e0de02" = {
      incoming-capabilities = [ "kdeconnect.battery" "kdeconnect.battery.request" "kdeconnect.clipboard" "kdeconnect.clipboard.connect" "kdeconnect.connectivity_report" "kdeconnect.contacts.response_uids_timestamps" "kdeconnect.contacts.response_vcards" "kdeconnect.findmyphone.request" "kdeconnect.mousepad.echo" "kdeconnect.mousepad.keyboardstate" "kdeconnect.mousepad.request" "kdeconnect.mpris" "kdeconnect.mpris.request" "kdeconnect.notification" "kdeconnect.notification.request" "kdeconnect.ping" "kdeconnect.presenter" "kdeconnect.runcommand" "kdeconnect.runcommand.request" "kdeconnect.sftp" "kdeconnect.share.request" "kdeconnect.sms.messages" "kdeconnect.systemvolume.request" "kdeconnect.telephony" ];
      last-connection = "lan://10.0.0.144:1716";
      name = "d35k70p";
      outgoing-capabilities = [ "kdeconnect.battery" "kdeconnect.battery.request" "kdeconnect.clipboard" "kdeconnect.clipboard.connect" "kdeconnect.connectivity_report.request" "kdeconnect.contacts.request_all_uids_timestamps" "kdeconnect.contacts.request_vcards_by_uid" "kdeconnect.findmyphone.request" "kdeconnect.mousepad.echo" "kdeconnect.mousepad.keyboardstate" "kdeconnect.mousepad.request" "kdeconnect.mpris" "kdeconnect.mpris.request" "kdeconnect.notification" "kdeconnect.notification.action" "kdeconnect.notification.reply" "kdeconnect.notification.request" "kdeconnect.ping" "kdeconnect.runcommand" "kdeconnect.runcommand.request" "kdeconnect.sftp.request" "kdeconnect.share.request" "kdeconnect.sms.request" "kdeconnect.sms.request_conversation" "kdeconnect.sms.request_conversations" "kdeconnect.systemvolume" "kdeconnect.telephony.request" "kdeconnect.telephony.request_mute" ];
      supported-plugins = [ "battery" "clipboard" "findmyphone" "mousepad" "mpris" "notification" "ping" "runcommand" "share" ];
      type = "desktop";
    };

    "org/gnome/shell/extensions/gsconnect/device/a1484d90-aa96-4219-8037-5e9a11e0de02/plugin/battery" = {
      custom-battery-notification-value = mkUint32 80;
    };

    "org/gnome/shell/extensions/gsconnect/device/a1484d90-aa96-4219-8037-5e9a11e0de02/plugin/notification" = {
      applications = ''
        {"Power":{"iconName":"org.gnome.Settings-power-symbolic","enabled":true},"Software":{"iconName":"org.gnome.Software","enabled":true},"Clocks":{"iconName":"org.gnome.clocks","enabled":true},"Color":{"iconName":"org.gnome.Settings-color-symbolic","enabled":true},"Archive Manager":{"iconName":"org.gnome.FileRoller","enabled":true},"Printers":{"iconName":"org.gnome.Settings-printers-symbolic","enabled":true},"Disk Usage Analyzer":{"iconName":"org.gnome.baobab","enabled":true},"Files":{"iconName":"org.gnome.Nautilus","enabled":true},"Disks":{"iconName":"org.gnome.DiskUtility","enabled":true},"Evolution Alarm Notify":{"iconName":"appointment-soon","enabled":true},"Date & Time":{"iconName":"org.gnome.Settings-time-symbolic","enabled":true}}
      '';
    };

    "org/gnome/shell/extensions/gsconnect/device/a1484d90-aa96-4219-8037-5e9a11e0de02/plugin/share" = {
      receive-directory = "/home/n3mo/Downloads";
    };

    "org/gnome/shell/extensions/gsconnect/messaging" = {
      window-maximized = false;
      window-size = mkTuple [ 930 981 ];
    };

    "org/gnome/shell/extensions/gsconnect/preferences" = {
      window-maximized = false;
      window-size = mkTuple [ 930 981 ];
    };

    "org/gnome/shell/extensions/just-perfection" = {
      accessibility-menu = false;
      activities-button = false;
      background-menu = false;
      clock-menu = true;
      dash = false;
      dash-app-running = false;
      dash-icon-size = 0;
      dash-separator = false;
      keyboard-layout = false;
      osd-position = 0;
      panel = true;
      panel-in-overview = false;
      quick-settings = true;
      ripple-box = false;
      search = false;
      show-apps-button = false;
      startup-status = 0;
      theme = true;
      window-menu-take-screenshot-button = true;
      window-preview-caption = false;
      window-preview-close-button = false;
      workspace = false;
      workspace-popup = false;
      workspace-wrap-around = true;
      workspaces-in-app-grid = false;
    };

    "org/gnome/shell/extensions/openbar" = {
      bartype = "Islands";
      bgalpha = 0.7;
      bgpalette = false;
      bguri = "file:///home/n3mo/.local/share/backgrounds/2024-01-17-22-37-14-wallpaper.png";
      candybar = false;
      default-font = "Sans 12";
      fgalpha = 0.53;
      height = 68.0;
      isalpha = 1.0;
      margin = 4.2;
      palette1 = [ "125" "128" "216" ];
      palette10 = [ "160" "164" "214" ];
      palette11 = [ "102" "51" "100" ];
      palette12 = [ "84" "68" "76" ];
      palette2 = [ "19" "31" "105" ];
      palette3 = [ "94" "77" "130" ];
      palette4 = [ "9" "13" "60" ];
      palette5 = [ "192" "132" "165" ];
      palette6 = [ "45" "64" "147" ];
      palette7 = [ "129" "105" "160" ];
      palette8 = [ "72" "79" "160" ];
      palette9 = [ "99" "82" "157" ];
      position = "Top";
      set-overview = false;
    };

    "org/gnome/shell/extensions/paperwm" = {
      cycle-height-steps = [ 1.0 ];
      cycle-width-steps = [ 0.5 1.0 ];
      default-focus-mode = 2;
      disable-scratch-in-overview = false;
      edge-preview-click-enable = true;
      edge-preview-scale = 0.0;
      gesture-workspace-fingers = 3;
      last-used-display-server = "Wayland";
      only-scratch-in-overview = false;
      open-window-position = 0;
      restore-attach-modal-dialogs = "false";
      restore-edge-tiling = "false";
      restore-keybinds = ''
        {}
      '';
      restore-workspaces-only-on-primary = "false";
      selection-border-radius-bottom = 12;
      show-window-position-bar = true;
      show-workspace-indicator = false;
      use-default-background = true;
      vertical-margin = 10;
      vertical-margin-bottom = 10;
      window-gap = 20;
      winprops = [ ''
        {"wm_class":"*","preferredWidth":"50%"}
      '' ];
    };

    "org/gnome/shell/extensions/paperwm/keybindings" = {
      barf-out = [ "" ];
      barf-out-active = [ "" ];
      close-window = [ "<Super>q" ];
      cycle-height = [ "" ];
      cycle-height-backwards = [ "" ];
      cycle-width = [ "<Super>m" ];
      cycle-width-backwards = [ "" ];
      live-alt-tab = [ "<Super>Tab" ];
      live-alt-tab-backward = [ "<Shift><Super>Tab" ];
      live-alt-tab-scratch = [ "" ];
      live-alt-tab-scratch-backward = [ "" ];
      move-down = [ "" ];
      move-down-workspace = [ "<Shift><Super>j" ];
      move-left = [ "<Shift><Super>h" ];
      move-monitor-above = [ "" ];
      move-monitor-below = [ "" ];
      move-monitor-left = [ "" ];
      move-monitor-right = [ "" ];
      move-previous-workspace = [ "" ];
      move-previous-workspace-backward = [ "" ];
      move-right = [ "<Shift><Super>l" ];
      move-space-monitor-above = [ "" ];
      move-space-monitor-below = [ "" ];
      move-space-monitor-left = [ "" ];
      move-space-monitor-right = [ "" ];
      move-up = [ "" ];
      move-up-workspace = [ "<Shift><Super>k" ];
      new-window = [ "" ];
      paper-toggle-fullscreen = [ "<Super>f" ];
      previous-workspace = [ "" ];
      previous-workspace-backward = [ "" ];
      resize-h-dec = [ "" ];
      resize-h-inc = [ "" ];
      resize-w-dec = [ "" ];
      resize-w-inc = [ "" ];
      slurp-in = [ "" ];
      swap-monitor-above = [ "" ];
      swap-monitor-below = [ "" ];
      swap-monitor-left = [ "" ];
      swap-monitor-right = [ "" ];
      switch-down = [ "" ];
      switch-down-or-else-workspace = [ "" ];
      switch-down-workspace = [ "<Super>j" ];
      switch-first = [ "" ];
      switch-focus-mode = [ "" ];
      switch-last = [ "" ];
      switch-left = [ "" ];
      switch-monitor-above = [ "" ];
      switch-monitor-below = [ "" ];
      switch-monitor-left = [ "" ];
      switch-monitor-right = [ "" ];
      switch-next = [ "" ];
      switch-next-loop = [ "<Super>l" ];
      switch-open-window-position = [ "" ];
      switch-previous = [ "" ];
      switch-previous-loop = [ "<Super>h" ];
      switch-right = [ "" ];
      switch-up = [ "" ];
      switch-up-or-else-workspace = [ "" ];
      switch-up-workspace = [ "<Super>k" ];
      toggle-maximize-width = [ "" ];
      toggle-scratch = [ "" ];
      toggle-scratch-layer = [ "" ];
      toggle-scratch-window = [ "" ];
    };

    "org/gnome/shell/extensions/paperwm/workspaces" = {
      list = [ "ff69794e-5bc5-4f98-bd54-299fe378ab2f" "6c8d7e13-e509-4b4a-941f-758ccbf2d29c" "ac90b08c-34c3-4a88-ac65-c65374e41b95" "1526b210-3225-417e-9035-35e6e06c9195" ];
    };

    "org/gnome/shell/extensions/paperwm/workspaces/1526b210-3225-417e-9035-35e6e06c9195" = {
      index = 3;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/6c8d7e13-e509-4b4a-941f-758ccbf2d29c" = {
      index = 1;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/ac90b08c-34c3-4a88-ac65-c65374e41b95" = {
      index = 2;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/ff69794e-5bc5-4f98-bd54-299fe378ab2f" = {
      index = 0;
      show-position-bar = true;
    };

    "org/gnome/shell/extensions/rounded-window-corners-reborn" = {
      settings-version = mkUint32 5;
      skip-libhandy-app = true;
    };

    "org/gnome/shell/keybindings" = {
      focus-active-notification = [ "<Super>n" ];
      shift-overview-down = [ "<Super><Alt>Down" ];
      shift-overview-up = [ "<Super><Alt>Up" ];
      toggle-message-tray = [];
    };

    "org/gnome/shell/weather" = {
      automatic-location = true;
      locations = [ (mkVariant [ (mkUint32 2) (mkVariant [ "Lafayette" "KLAF" true [ (mkTuple [ 0.7053311839622084 (-1.5175201513777696) ]) ] [ (mkTuple [ 0.7054045226973772 (-1.516259796765027) ]) ] ]) ]) ];
    };

    "org/gnome/shell/world-clocks" = {
      locations = [ (mkVariant [ (mkUint32 2) (mkVariant [ "Indianapolis" "KIND" true [ (mkTuple [ 0.6933320453547475 (-1.5059040078213661) ]) ] [ (mkTuple [ 0.694089116824385 (-1.50374150997156) ]) ] ]) ]) (mkVariant [ (mkUint32 2) (mkVariant [ "Pune" "VAPO" true [ (mkTuple [ 0.3201911232538717 1.2837088634636014 ]) ] [ (mkTuple [ 0.3234095103945493 1.288925652597812 ]) ] ]) ]) ];
    };

    "org/gnome/software" = {
      check-timestamp = mkInt64 1721931028;
      first-run = false;
      flatpak-purge-timestamp = mkInt64 1705512518;
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };

    "org/gtk/gtk4/settings/color-chooser" = {
      selected-color = mkTuple [ true 1.0 1.0 1.0 1.0 ];
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
      window-size = mkTuple [ 859 372 ];
    };

    "org/gtk/settings/color-chooser" = {
      custom-colors = [ (mkTuple [ 0.7843137254901961 0.4 0.9529411764705882 1.0 ]) (mkTuple [ 0.7058823529411765 0.22745098039215686 0.7372549019607844 1.0 ]) ];
      selected-color = mkTuple [ true 0.6470588235294118 0.11372549019607843 0.17647058823529413 1.0 ];
    };

    "org/gtk/settings/emoji-chooser" = {
      recent-emoji = [ (mkTuple [ (mkTuple [ [ (mkUint32 128536) ] "face blowing a kiss" "" ]) (mkUint32 0) ]) (mkTuple [ (mkTuple [ [ 128532 ] "pensive face" "" ]) 0 ]) (mkTuple [ (mkTuple [ [ 128524 ] "relieved face" "" ]) 0 ]) (mkTuple [ (mkTuple [ [ 128128 ] "skull" "" ]) 0 ]) (mkTuple [ (mkTuple [ [ 128520 ] "smiling face with horns" "" ]) 0 ]) (mkTuple [ (mkTuple [ [ 128561 ] "face screaming in fear" "" ]) 0 ]) (mkTuple [ (mkTuple [ [ 128553 ] "weary face" "" ]) 0 ]) (mkTuple [ (mkTuple [ [ 128405 0 ] "middle finger" "" ]) 0 ]) (mkTuple [ (mkTuple [ [ 128064 ] "eyes" "" ]) 0 ]) (mkTuple [ (mkTuple [ [ 128526 ] "smiling face with sunglasses" "" ]) 0 ]) (mkTuple [ (mkTuple [ [ 129314 ] "nauseated face" "" ]) 0 ]) (mkTuple [ (mkTuple [ [ 128591 0 ] "folded hands" "" ]) 0 ]) (mkTuple [ (mkTuple [ [ 128580 ] "face with rolling eyes" "" ]) 0 ]) (mkTuple [ (mkTuple [ [ 128541 ] "squinting face with tongue" "" ]) 0 ]) (mkTuple [ (mkTuple [ [ 128556 ] "grimacing face" "" ]) 0 ]) (mkTuple [ (mkTuple [ [ 129395 ] "partying face" "" ]) 0 ]) (mkTuple [ (mkTuple [ [ 128557 ] "loudly crying face" "" ]) 0 ]) (mkTuple [ (mkTuple [ [ 128293 ] "fire" "" ]) 0 ]) (mkTuple [ (mkTuple [ [ 128513 ] "beaming face with smiling eyes" "" ]) 0 ]) ];
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
      sort-order = "descending";
      type-format = "category";
      window-position = mkTuple [ 35 32 ];
      window-size = mkTuple [ 930 981 ];
    };

  };
}
