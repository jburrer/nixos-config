{ pkgs, lib, config, ... }: {

  nixpkgs.config.allowUnfree = true;
 
  # enable steam hardware
  #hardware.steam-hardware.enable = true;
 
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };
 
  services.dbus.enable = true;
  services.dbus.packages = [ pkgs.dconf ];
  programs.dconf.enable = true;
 
  home-manager.users.${config.username} = {
 
    # steam flatpak
    services.flatpak.packages = [
      #"com.valvesoftware.Steam" 
      #"io.github.Foldex.AdwSteamGtk" 
      "de.haeckerfelix.Fragments"
      #"page.kramo.Cartridges"
    ];
 
    home.packages = with pkgs; [
      #prismlauncher jdk8 # for prism launcher
      distrobox podman # for jc141 games
    ];
 
  };

}
