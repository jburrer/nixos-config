{ pkgs, lib, config, ... }: {

  # pipewire (assumes desktop pipewire config)
  services.pipewire = {
    jack.enable = true;
    extraConfig.pipewire."92-low-latency"."context.properties" = {
      "default.clock.rate" = 48000;
      "default.clock.quantum" = 32;
      "default.clock.min-quantum" = 32;
      "default.clock.max-quantum" = 32;
    };
  };

  # musnix
  musnix = {
    enable = true;
    kernel.realtime = true;
  };

  # adds user to needed groups
  users.users."${config.username}".extraGroups = [
    "video"
    "audio"
  ];

  # add programs with home manager
  home-manager.users.${config.username}.home.packages = with pkgs; [
    ardour obs-studio qpwgraph raysession hydrogen audacity
  ];

}
