{ config, pkgs, ... }:

{

  programs.kdeconnect.enable = true;

  stylix = {
    image = ../../wallpaper.png;
    base16Scheme = ./catppuccin-mocha.yaml;
    polarity = "dark";
    fonts = {
      serif = {
        package = pkgs.cantarell-fonts;
        name = "Cantarell";
      };
      sansSerif = {
        package = pkgs.cantarell-fonts;
        name = "Cantarell";
      };
      monospace = {
        package = pkgs.cascadia-code;
        name = "Cascadia Code";
      };
    };
    cursor = {
      package = pkgs.catppuccin-cursors;
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

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.dbus.packages = [ pkgs.gcr ];

}
