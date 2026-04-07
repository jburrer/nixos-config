{ config, pkgs, lib, ... }: {

  # sound with pipwire
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
  };
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;

  # networkmanager
  networking.networkmanager.enable = true;
  users.users."${config.username}".extraGroups = [ "networkmanager" ];

  # gnome
  services = {
    desktopManager.gnome.enable = true;
    displayManager = {
      gdm.enable = true;
      defaultSession = "gnome";
    };
    dbus = {
      enable = true;
      packages = [ pkgs.dconf pkgs.gcr ];
    };
    udev.packages = [ pkgs.gnome-settings-daemon ];
  };

  # exclude unecessary gnome crap
  environment = {
    gnome.excludePackages = with pkgs; [
      gnome-tour gnome-text-editor snapshot
      gnome-console epiphany geary yelp totem simple-scan
      gnome-maps gnome-music gnome-software
    ];
  };

  # dconf
  programs.dconf.enable = true;

  # flatpak
  services.flatpak.enable = true;

  # kdeconnect
  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };

  # pinentry
  pinentryPackage = pkgs.pinentry-gnome3;

  # allows system fonts to work with flatpak
  fonts.fontDir.enable = true;

  # home manager
  home-manager.users.${config.username} = {

    imports = [
      ./emacs
      ./firefox.nix
    ];

    services.flatpak = {
      enable = true;
      update.auto.enable = true;
      packages = [
        "org.gimp.GIMP"
        "app.devsuite.Ptyxis"
      ];
    };

    home.packages = (with pkgs; [
      gcr wl-clipboard dconf2nix
    ]) ++ (with pkgs.gnomeExtensions; [
      blur-my-shell system-monitor
    ]);

    xdg.enable = true;
    fonts.fontconfig.enable = true;

    gtk = {
      enable = true;
      theme = {
        package = pkgs.adw-gtk3;
        name = "adw-gtk3-dark";
      };
      iconTheme = {
        package = pkgs.morewaita-icon-theme;
        name = "MoreWaita";
      };
      font = {
        package = pkgs.adwaita-fonts;
        name = "Adwaita Sans";
      };
    };

    qt = {
      enable = true;
      platformTheme.name = "adwaita";
      style.name = "adwaita-dark";
    };

    dconf.settings = {
      "org/gnome/desktop/interface" = {
        gtk-theme = "adw-gtk3-dark";
        color-scheme = "prefer-dark";
      };
      "org/gnome/desktop/input-sources" = {
        xkb-options = [ "caps:swapescape" ];
      };
    };

  };

}
