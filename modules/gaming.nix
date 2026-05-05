{ pkgs, lib, config, ... }: {

  nixpkgs.config.allowUnfree = true;
 
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };
 
  services.dbus.enable = true;
  services.dbus.packages = [ pkgs.dconf ];
  programs.dconf.enable = true;
 
  home-manager.users.${config.username} = {
 
    services.flatpak.packages = [
      { # specific version of prismlauncher that allows offline play
        appId = "org.prismlauncher.PrismLauncher";
        commit = "385bb500b9195765a6e6fb5c81855b24eb48bf91";
      }
      "de.haeckerfelix.Fragments"
    ];
 
    home.packages = with pkgs; [
      distrobox podman # for jc141 games
    ];
 
  };

}
