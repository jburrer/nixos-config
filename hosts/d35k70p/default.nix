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

  # networking
  networking.networkmanager.enable = true;
  users.users."${config.username}".extraGroups = [ "networkmanager" ];

  # flatpack
  services.flatpak.enable = true;

  # nvidia
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      modesetting.enable = true;
      open = false;
      nvidiaSettings = false;
    };
  };

  # steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "22.11";

}
