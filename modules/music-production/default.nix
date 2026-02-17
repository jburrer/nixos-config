{ pkgs, lib, config, ... }: {

  # adds user to neded groups
  users.users."${config.username}".extraGroups = [ "audio" "video" "dialout" ];

  # udev rules for usb dmx interface
  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6001", MODE="0666", GROUP="dialout"
  '';

  # pipewire jack suuport
  services.pipewire = {
    jack.enable = true;
    wireplumber.enable = true;
  };

  # musnix
  musnix = {
    enable = true;
    kernel.realtime = true;
    rtirq.enable = true;
    rtcqs.enable = true;
    alsaSeq.enable = true;
  };

  # hardware specific to d35k70p
  powerManagement.cpuFreqGovernor =
      lib.mkIf (config.hostname == "d35k70p") "performance";
  services.pipewire.extraConfig.pipewire."92-low-latency".context.properties =
      lib.mkIf (config.hostname == "d35k70p") {
    default.clock.rate = 48000;
    default.clock.quantum = 32;
    default.clock.min-quantum = 32;
    default.clock.max-quantum = 32;
  };

  # home manager
  home-manager.users.${config.username} = {

    home.packages = with pkgs.stable; [
      ardour x42-avldrums helvum helm qlcplus
      (pkgs.callPackage ./custom-raysession.nix {})
    ] ++ [
      lsp-plugins
    ];

    # add obs flatpak
    services.flatpak.packages = [
      "org.kde.kdenlive"
      "org.nickvision.tubeconverter"
      "com.saivert.pwvucontrol"
      "io.github.dimtpap.coppwr"
      # obs and plugins
      "com.obsproject.Studio"
      "com.obsproject.Studio.Plugin.AitumMultistream"
      "com.obsproject.Studio.Plugin.VerticalCanvas"
    ];
    
  };

}
