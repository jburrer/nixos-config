{ config, pkgs, ... }:

{

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

  environment = {
    gnome.excludePackages = (with pkgs; [
      gnome-tour gnome-connections gnome-text-editor gnome-console snapshot
    ]) ++ (with pkgs.gnome; [
      epiphany geary gnome-maps yelp totem simple-scan gnome-music
    ]);
  };

  programs = {
    kdeconnect = {
      enable = true;
      package = pkgs.gnomeExtensions.gsconnect;
    };
    dconf.enable = true;
  };

  stylix = {
    image = ../../wallpaper.png;
    base16Scheme = ./catppuccin-mocha.yaml;
    polarity = "dark";
    fonts = {
      serif = {
        package = pkgs.cantarell-fonts;
        name = "Cantarell";
      };
      sansSerif = config.stylix.fonts.serif;
      monospace = {
        package = pkgs.cascadia-code;
        name = "Cascadia Code";
      };
    };
    cursor = {
      package = pkgs.catppuccin-cursors;
      #name = "Bibata-Modern-Classic";
      size = 16;
    };
  };

  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    wireplumber.enable = true;
  };
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

}
