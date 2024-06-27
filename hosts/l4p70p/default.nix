{ config, pkgs, ... }: {

  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

  hostname = "l4p70p";
  configDir = "${config.homeDir}/Documents/nixos-config";
  desktop = "hyprland";

  # bootloader
  boot.loader = {
    systemd-boot.enable = true;
    efi.efiSysMountPoint = "/boot";
  };

  # system76 hardware settings
  hardware.system76.enableAll = true;

  # power button
  services.logind = {
    powerKey = "suspend-then-hibernate";
    powerKeyLongPress = "poweroff";
  };

  # bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;

  # home manager
  home-manager.users.${config.username} = {

    home.packages = with pkgs; [
      libreoffice tor-browser-bundle-bin monero-gui
    ];

    services.syncthing.enable = true;

  };

  system.stateVersion = "23.05";

}
