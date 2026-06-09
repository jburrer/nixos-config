{ config, pkgs, lib, ... }: {

  imports = [
    ./hardware-configuration.nix
    ../../modules
    ../../modules/gnome.nix
    ../../modules/gaming.nix
    ../../modules/printing.nix
  ];

  hostname = "l4p70p";
  configDir = "${config.homeDir}/Documents/nixos-config";

  # boot 
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # system76 hardware settings
  hardware.system76.enableAll = true;

  # power button & laptop lid
  services.logind.settings.Login = {
    HandlePowerKey = "suspend-then-hibernate";
    HandlePowerKeyLongPress = "poweroff";
    HandleLidSwitch = "ignore";
    HandleLidSwitchDocked = "ignore";
  };

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
  powerManagement.resumeCommands = ''
    ${pkgs.kmod}/bin/modprobe -r i2c_hid_acpi
    ${pkgs.kmod}/bin/modprobe i2c_hid_acpi
  '';

  # fix for tailscale breaking after wake from suspend
  systemd.services.tailscale-restart = {
    enable = true;
    description = "restart tailscale after waking from suspend";
    after = [ "suspend.target" ];
    wantedBy = [ "suspend.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.bash}/bin/bash -c 'sleep 2 && ${pkgs.tailscale}/bin/tailscale down && ${pkgs.tailscale}/bin/tailscale up'";
    };
  };

  # home manager
  programs.fuse.userAllowOther = true;
  home-manager.users.${config.username} = {

    imports = [ ../../modules/thunderbird.nix ];

    services.flatpak.packages = [
      "org.ardour.Ardour"
      "com.jeffser.Nocturne"
      "app.drey.EarTag"
      "com.calibre_ebook.calibre"
      "com.github.wwmm.easyeffects"
      "us.zoom.Zoom"
    ];

    home.packages = (with pkgs; [
      corefonts android-tools
      x42-plugins x42-avldrums lsp-plugins dragonfly-reverb # daw plugins
    ]) ++ (with pkgs.gnomeExtensions; [
      paperwm
    ]);

    services.syncthing.enable = true;

  };

  system.stateVersion = "23.05";

}
