{ pkgs, lib, config, ... }: {

  # adds user to neded groups
  users.users."${config.username}".extraGroups = [ "audio" "video" ];

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

    # add programs (from stable branch)
    home.packages = with pkgs.stable; [
      ardour x42-avldrums helvum helm
    ] ++ [
      lsp-plugins
    ];

    # add obs flatpak
    services.flatpak.packages = [
      "org.kde.kdenlive"
      "com.obsproject.Studio"
      "org.nickvision.tubeconverter"
    ];
    
  };

}
