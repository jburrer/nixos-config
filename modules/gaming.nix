{ pkgs, stablePkgs, lib, config, ... }: {

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };
 
  services.dbus.enable = true;
  services.dbus.packages = [ pkgs.dconf ];
  programs.dconf.enable = true;
 
  home-manager.users.${config.username} = {
 
    services.flatpak.packages = [
      "de.haeckerfelix.Fragments"
    ];
 
    home.packages = (with stablePkgs; [
      prismlauncher
    ]) ++ (with pkgs; [
      javaPackages.compiler.openjdk25
      distrobox podman # for jc141 games
    ]);
 
  };

}
