{ config, pkgs, ... }:

let
	vars = import ../../vars.nix;
in
{

  imports = [
    ./hardware-configuration.nix
    ../../modules/system.nix
    ../../modules/tailscale.nix
    ../../modules/gnome.nix
    ../../modules/music-production.nix
    ../../modules/zsh.nix
  ];

  # bootloader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

	# networking
	networking = {
		hostName = "l4p70p";
		networkmanager.enable = true;
  };

	# time
	time.timeZone = "America/Indiana/Indianapolis";

	# user
	users.users."${vars.username}" = {
		isNormalUser = true;
		description = "${vars.username}";
		extraGroups = [
			"networkmanager"
			"wheel"
		];
	};

  # flatpack
  services.flatpak.enable = true;

	system.stateVersion = "23.05";

}
