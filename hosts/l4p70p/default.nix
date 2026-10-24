{ config, pkgs, lib, ... }: {

  imports = [
    ./hardware-configuration.nix
    ../../modules
    ../../modules/gnome.nix
    ../../modules/printing.nix
  ];

  hostname = "l4p70p";
  configDir = "${config.homeDir}/Documents/nixos-config";

  # boot 
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
      };
    };
    initrd.luks.devices.cryptroot.device = "/dev/disk/by-uuid/104728b8-46c0-4c7c-a36c-ded34df7e387"; 
  };

  # system76 hardware settings
  hardware.system76.enableAll = true;

  # bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # run non-nix executables
  programs.nix-ld.enable = true;

  # run non-free programs
  nixpkgs.config.allowUnfree = true;

  # fix for trackpad breaking after wake from suspend
  #powerManagement.resumeCommands = ''
  #  ${pkgs.kmod}/bin/modprobe -r i2c_hid_acpi
  #  ${pkgs.kmod}/bin/modprobe i2c_hid_acpi
  #'';
  systemd.services.fix-touchpad = {
    description = "Reload touchpad driver after suspend";
    wantedBy = [ "post-resume.target" ];
    after = [ "post-resume.target" ];
    serviceConfig.Type = "oneshot";
    script = ''
      ${pkgs.kmod}/bin/modprobe -r i2c_hid_acpi
      ${pkgs.kmod}/bin/modprobe i2c_hid_acpi
    '';
  };

  # fix for tailscale breaking after wake from suspend
  #systemd.services.tailscale-restart = {
  #  enable = true;
  #  description = "restart tailscale after waking from suspend";
  #  after = [ "suspend.target" ];
  #  wantedBy = [ "suspend.target" ];
  #  serviceConfig = {
  #    Type = "oneshot";
  #    ExecStart = "${pkgs.bash}/bin/bash -c 'sleep 2 && ${pkgs.tailscale}/bin/tailscale down && ${pkgs.tailscale}/bin/tailscale up'";
  #  };
  #};

  # home manager
  programs.fuse.userAllowOther = true;
  home-manager.users.${config.username} = {

    imports = [ ../../modules/thunderbird.nix ];

    services.flatpak.packages = [
      "com.calibre_ebook.calibre"
      "org.signal.Signal"
      #"app.drey.EarTag"
      #"us.zoom.Zoom"
      #"com.obsproject.Studio"
    ];

    home.packages = (with pkgs; [
      corefonts android-tools gnomeExtensions.paperwm
    ]);

    services.syncthing.enable = true;

  };

  system.stateVersion = "26.05";

}
