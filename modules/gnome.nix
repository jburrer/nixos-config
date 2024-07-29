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
    wireplumber.enable = true;
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
    udev.packages = [ pkgs.gnome3.gnome-settings-daemon ];
  };

  # exclude unecessary gnome crap
  environment = {
    gnome.excludePackages = (with pkgs; [
      gnome-tour gnome-connections gnome-text-editor snapshot gnome-console
    ]) ++ (with pkgs.gnome; [
      epiphany geary gnome-maps yelp totem gnome-music simple-scan
    ]);
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
      deploy-rs pass wl-clipboard gimp cascadia-code adw-gtk3
      gnome3.gnome-tweaks ptyxis celluloid dconf2nix
    ]) ++ (with pkgs.gnomeExtensions; [
      paperwm dash-to-panel auto-move-windows
      blur-my-shell rounded-corners
      tailscale-qs #syncthing-indicator
    ]);

    home.file.".local/share/gnome-shell/extensions/rounded-window-corners@flexagoon.github.com".source = builtins.fetchGit {
      url = "https://github.com/flexagoon/rounded-window-corners";
      rev = "99703159f4343e687c33e6ba6ef1af29e5ac1e34";
    };

    dconf.settings = lib.mkForce {
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = [
          "paperwm@paperwm.github.com"
          "dash-to-panel@jderose9.github.com"
          "rounded-window-corners@flexagoon.github.com"
          "auto-move-windows@gnome-shell-extensions.gcampax.github.com"
          "blur-my-shell@aunetx"
          "tailscale@joaophi.github.com"
          #"syncthing@gnome.2nv2u.com"
          "system-monitor@gnome-shell-extensions.gcampax.github.com"
          "gsconnect@andyholmes.github.io"
        ];
      };
      "org/gnome/desktop/peripherals/keyboard" = {
          delay = 175;
          repeat-interval = 10; # 18
          repeat = true;
      };
    };

  };

}
