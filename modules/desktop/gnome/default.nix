{ pkgs, lib, config, ... }: {

  config = lib.mkIf (config.desktop == "gnome") {

    # gnome setup
    services = {
      xserver = {
        enable = true;
        displayManager.gdm.enable = true;
        desktopManager.gnome.enable = true;
        excludePackages = [ pkgs.xterm ];
      };
      dbus.packages = [ pkgs.dconf ];
      udev.packages = [ pkgs.gnome3.gnome-settings-daemon ];
    };

    # exclude unecessary gnome crap
    environment = {
      gnome.excludePackages = (with pkgs; [
        gnome-tour gnome-connections gnome-text-editor snapshot
      ]) ++ (with pkgs.gnome; [
        epiphany geary gnome-maps yelp totem simple-scan gnome-music
      ]);
    };

    # dconf
    programs.dconf.enable = true;

    # kdeconnect
    programs.kdeconnect.package = pkgs.gnomeExtensions.gsconnect;

    # home manager
    home-manager.users.${config.username} = {

      home.packages = (with pkgs; [
        gnome3.gnome-tweaks celluloid
      ]) ++ (with pkgs.gnomeExtensions; [
        paperwm dash-to-panel auto-move-windows
        just-perfection blur-my-shell user-themes
        tailscale-qs syncthing-indicator
      ]);

      dconf.settings = lib.mkForce {
        "org/gnome/shell" = {
          disable-user-extensions = false;
          enabled-extensions = [
            "user-theme@gnome-shell-extensions.gcampax.github.com"
            "auto-move-windows@gnome-shell-extensions.gcampax.github.com"
            "blur-my-shell@aunetx"
            "dash-to-panel@jderose9.github.com"
            "gsconnect@andyholmes.github.io"
            "just-perfection-desktop@just-perfection"
            "paperwm@paperwm.github.com"
            "syncthing@gnome.2nv2u.com"
            "tailscale@joaophi.github.com"
          ];
        };
        "org/gnome/shell/extensions/user-theme" = {
          name = "Catppuccin-Mocha-Compact-Mauve-Dark";
        };
        "org/gnome/desktop/interface" = {
          gtk-theme = "Catppuccin-Mocha-Compact-Mauve-Dark";
          icon-theme = "Papirus-Dark";
        };
        "org/gnome/desktop/peripherals/keyboard" = {
            delay = lib.hm.gvariant.mkUint32 175;
            repeat-interval = lib.hm.gvariant.mkUint32 18;
            repeat = true;
        };
      };

    };

  };

}
