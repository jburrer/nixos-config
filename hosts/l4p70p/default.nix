{ config, pkgs, lib, ... }: {

  imports = [
    ./hardware-configuration.nix
    ../../modules
    ../../modules/gnome.nix
    ../../modules/gaming.nix
    ../../modules/printing.nix
    ../../modules/music-production
  ];

  hostname = "l4p70p";
  configDir = "${config.homeDir}/Documents/nixos-config";

  # boot 
  boot = {
    loader = {
      systemd-boot.enable = lib.mkForce false;
      efi.efiSysMountPoint = "/boot";
    };
    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };
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

  # sink for using raysession & ardour to boost audio while watching movies
  services.pipewire.extraConfig.pipewire."91-live-sinks"."context.objects" = [
    {
      factory = "adapter";
      args = {
        "factory.name" = "support.null-audio-sink";
        "node.name" = "movies-sink";
        "node.description" = "Sink for Movies";
        "media.class" = "Audio/Sink";
        "audio.position" = "FL,FR";
      };
    }
  ];

  # android stuff
  programs.adb.enable = true;
  users.users.${config.username}.extraGroups = [ "adbusers" ];

  # run non-nix executables
  programs.nix-ld.enable = true;

  # run non-free programs
  nixpkgs.config.allowUnfree = true;

  # fix for tailscale breaking on suspend
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
      "org.libreoffice.LibreOffice"
      "org.gnome.Fractal"
      "org.gnome.Polari"
      "app.drey.EarTag"
      "com.calibre_ebook.calibre"
    ];

    home.packages = (with pkgs; [
      corefonts 
    ]) ++ (with pkgs.gnomeExtensions; [
      paperwm caffeine
    ]);

    services.syncthing.enable = true;

  };

  system.stateVersion = "23.05";

}
