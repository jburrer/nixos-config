{ pkgs, lib, config, ... }:

{

  options.musicProduction.enable =
      lib.mkEnableOption "whether to set up music production software";

  config = lib.mkIf config.musicProduction.enable {

    # pipewire (assumes desktop pipewire config)
    #services.pipewire = {
    #  jack.enable = true;
    #  extraConfig.pipewire."92-low-latency"."context.properties" = {
    #    "default.clock.rate" = 48000;
    #    "default.clock.quantum" = 32;
    #    "default.clock.min-quantum" = 32;
    #    "default.clock.max-quantum" = 32;
    #  };
    #};

    services.jack = {
      jackd.enable = true;
      alsa.enable = false;
      loopback.enable = true;
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
      "jackaudio"
    ];

    # add programs with home manager
    home-manager.users.${config.username}.home.packages = with pkgs; [
      ardour obs-studio qjackctl hydrogen audacity raysession
    ];

  };

}
