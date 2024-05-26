{ config, pkgs, vars, ... }:

{

  imports = [
    ./hardware-configuration.nix
    ../../modules/system
    ../../modules/tailscale
    ../../modules/hyprland
    ../../modules/zsh
  ];

  hostname = "l4p70p";
  configDir = "${config.homeDir}/Documents/nixos-config";

  # bootloader
  boot.loader = {
    systemd-boot.enable = true;
    efi.efiSysMountPoint = "/boot";
  };

  # system76 hardware settings
  hardware.system76.enableAll = true;

  # networking
  networking.networkmanager.enable = true;
  users.users."${config.username}".extraGroups = [ "networkmanager" ];

  system.stateVersion = "23.05";

}
