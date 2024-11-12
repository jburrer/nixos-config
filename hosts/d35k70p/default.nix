{ config, pkgs, ... }: {

  imports = [
    ./hardware-configuration.nix
    ../../modules
    ../../modules/gnome.nix
    ../../modules/gaming.nix
    ../../modules/music-production.nix
  ];

  hostname = "d35k70p";
  configDir = "${config.homeDir}/Documents/nixos-config";

  gaming.nvidia.enable = true;

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

  # disabling autosuspend for remote desktop
  systemd.targets.sleep.enable = false;
  systemd.targets.suspend.enable = false;
  systemd.targets.hibernate.enable = false;
  systemd.targets.hybrid-sleep.enable = false;

  home-manager.users.${config.username} = {

    services.flatpak.packages = [ "com.spotify.Client" ];

    services.syncthing.enable = true;
    
  };

  system.stateVersion = "22.11";

}
