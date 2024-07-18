{ config, pkgs, ... }: {

  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

  hostname = "d35k70p";
  configDir = "${config.homeDir}/Documents/nixos-config";
  desktop = "gnome";
  musicProduction.enable = true;
  gaming = {
    enable = true;
    nvidia = true;
  };

  # bootloader
  boot = {
    loader = {
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        enableCryptodisk = true;
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
    };
    initrd = {
      luks.devices."luks-aaf591da-df34-4705-ba24-3966c20767d5" = {
	device = "/dev/disk/by-uuid/aaf591da-df34-4705-ba24-3966c20767d5";
        keyFile = "/keyfile.bin";
        allowDiscards = true;
      };
      secrets = {
        "keyfile.bin" = "/etc/secrets/initrd/keyfile.bin";
      };
    };
  };

  # enable syncthing with home manager
  home-manager.users.${config.username}.services.syncthing.enable = true;

  system.stateVersion = "22.11";

}
