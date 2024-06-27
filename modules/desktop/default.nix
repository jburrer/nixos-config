{ pkgs, lib, config, ... }: {

  imports = [
    ./gnome
    ./hyprland
    ./music-production.nix
    ./gaming.nix
  ];

  options = {

    desktop = lib.mkOption {
      default = null;
      type = lib.types.str;
      description = ''
        which desktop to set up, if at all
        "gnome", "hyprland", or null supported
      '';
    };

  };

  config = lib.mkIf (config.desktop != null) {

    # sound with pipwire
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

    # networkmanager
    networking.networkmanager.enable = true;
    users.users."${config.username}".extraGroups = [ "networkmanager" ];

    # honestly not sure
    services.dbus.packages = [ pkgs.gcr ];

    # pinentry
    pinentryPackage = pkgs.pinentry-gnome3;

    # kdeconnect
    programs.kdeconnect.enable = true;

    # auto-ricing with stylix
    stylix = {
      enable = true;
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

    # home manager
    home-manager.users.${config.username} = {

      imports = [
        ./emacs
        ./firefox.nix
        ./thunderbird.nix
        ./alacritty.nix
      ];

      xdg.enable = true;

      fonts.fontconfig.enable = true;

      gtk = {
        enable = true;
        theme = lib.mkForce {
          name = "Catppuccin-Mocha-Compact-Mauve-Dark";
          package = pkgs.catppuccin-gtk.override {
            accents = [ "mauve" ];
            size = "compact";
            tweaks = [ "rimless" ];
            variant = "mocha";
          };
        };
        iconTheme = {
          name = "Papirus";
          package = pkgs.papirus-icon-theme;
        };
      };

      # desktop-agnostic apps
      home.packages = with pkgs; [ deploy-rs pass wl-clipboard gimp ];

    };

  };

}
