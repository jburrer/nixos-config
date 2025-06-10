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
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      excludePackages = [ pkgs.xterm ];
    };
    displayManager.defaultSession = "gnome";
    dbus.packages = [ pkgs.dconf pkgs.gcr ];
    udev.packages = [ pkgs.gnome-settings-daemon ];
    flatpak.enable = true;
    # remote desktop
    xrdp = {
      enable = true;
      defaultWindowManager = "${pkgs.gnome-session}/bin/gnome-session";
      openFirewall = true;
    };
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

  # kdeconnect
  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };

  # pinentry
  pinentryPackage = pkgs.pinentry-gnome3;

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
        "page.tesk.Refine"
        "app.devsuite.Ptyxis"
        "io.github.celluloid_player.Celluloid"
      ];
    };

    home.packages = (with pkgs; [
      pass wl-clipboard dconf2nix
      morewaita-icon-theme adwaita-fonts adw-gtk3
    ]) ++ (with pkgs.gnomeExtensions; [
      paperwm blur-my-shell rounded-window-corners-reborn
      caffeine tailscale-qs
    ]);

    xdg.enable = true;
    fonts.fontconfig.enable = true;

  };

}
