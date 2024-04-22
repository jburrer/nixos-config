{ pkgs, lib, ... }:

{

  imports = [ ../desktop ];

  home.packages = ([ pkgs.gnome3.gnome-tweaks ]) ++ (with pkgs.gnomeExtensions; [
    paperwm dash-to-panel auto-move-windows
    just-perfection blur-my-shell user-themes
    tailscale-qs syncthing-indicator
    celluloid
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

  pinentryPackage = pkgs.pinentry-gnome3;
  
}
