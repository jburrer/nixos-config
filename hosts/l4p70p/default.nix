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
  powerManagement.enable = true;
  systemd.services.fix-touchpad = {
    description = "Reload touchpad driver after resume";
    wantedBy = [ "sleep.target" ];
    before = [ "sleep.target" ];
    unitConfig.StopWhenUnneeded = true;
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = "${pkgs.coreutils}/bin/true";
      ExecStop = pkgs.writeShellScript "fix-touchpad-resume" ''
        ${pkgs.coreutils}/bin/sleep 1
        ${pkgs.kmod}/bin/modprobe -r i2c_hid_acpi
        ${pkgs.kmod}/bin/modprobe i2c_hid_acpi
      '';
    };
  };

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
