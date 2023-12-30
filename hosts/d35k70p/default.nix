{ config, pkgs, vars, ... }:

{

  imports = [
    ./hardware-configuration.nix
    ../../modules/system
    ../../modules/tailscale
    ../../modules/gnome
    ../../modules/music-production
    ../../modules/zsh
  ];

  hostname = "d35k70p";
  configDir = "${config.homeDir}/Documents/nixos-config";

  # bootloader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

	# networking
	networking.networkmanager.enable = true;
	users.users."${config.username}".extraGroups = [ "networkmanager" ];

  # flatpack
  services.flatpak.enable = true;

	system.stateVersion = "23.05";

}
