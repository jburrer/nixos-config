{ config, pkgs, ... }: {

  imports = [
    ./hardware-configuration.nix
    ../../modules
    ../../modules/gnome.nix
    ../../modules/music-production.nix
  ];

  hostname = "d35k70p";
  configDir = "${config.homeDir}/Documents/nixos-config";

  #gaming.nvidia.enable = true;
  # nvidia
  #nixpkgs.config.allowUnfree = true;
  #services.xserver.videoDrivers =  [ "nvidia" ];
  #hardware.graphics.enable = true;
  #hardware.nvidia = {
  #  package = config.boot.kernelPackages.nvidiaPackages.stable;
  #  modesetting.enable = true;
  #  open = false;
  #  nvidiaSettings = false;
  #};

  # bootloader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  ## mount external hard drive
  #fileSystems."/home/${config.username}/Nest" = {
  #  device = "/dev/disk/by-uuid/b6ec6e48-994a-4941-998b-d4533990d52c";
  #  fsType = "ext4";
  #};

  # disabling autosuspend for remote desktop
  systemd.targets.sleep.enable = false;
  systemd.targets.suspend.enable = false;
  systemd.targets.hibernate.enable = false;
  systemd.targets.hybrid-sleep.enable = false;

  home-manager.users.${config.username} = {

    services.flatpak.packages = [ "com.spotify.Client" ];

    services.syncthing.enable = true;
    
    home.packages = (with pkgs.gnomeExtensions; [
      rounded-window-corners-reborn
    ]);

  };

  system.stateVersion = "25.11";

}
