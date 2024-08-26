{ pkgs, lib, config, ... }:

{

  options.musicProduction.enable =
      lib.mkEnableOption "whether to set up music production software";

  config = lib.mkIf config.musicProduction.enable {

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
      ardour obs-studio qpwgraph raysession hydrogen audacity
    ];

  };

}
