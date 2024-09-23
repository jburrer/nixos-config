{ pkgs, lib, config, ... }:

{

  # sound with pipwire
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
  };
  hardware.pulseaudio.enable = false;
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
  };

  # exclude unecessary gnome crap
  environment = {
    gnome.excludePackages = with pkgs; [
      gnome-tour gnome-connections gnome-text-editor snapshot
      gnome-console epiphany geary yelp totem simple-scan
      gnome-maps gnome-music
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

    xdg.enable = true;

    fonts.fontconfig.enable = true;

    home.packages = (with pkgs; [
      deploy-rs pass wl-clipboard goldwarden gimp cascadia-code
      adw-gtk3 gnome-tweaks ptyxis celluloid dconf2nix
    ]) ++ (with pkgs.gnomeExtensions; [
      paperwm blur-my-shell rounded-window-corners-reborn
      caffeine tailscale-qs
    ]);

  };

}
