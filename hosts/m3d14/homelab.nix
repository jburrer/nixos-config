{ ... }: {

  # media server
  nixarr = {
    enable = true;
    mediaDir = "/srv/storage";
    stateDir = "/srv/state";
    #ddns.njalla = {};
    vpn = {
      enable = true;
      wgConf = "/srv/state/wg0.conf";
    };
    transmission = {
      enable = true;
      #flood.enable = true;
      vpn.enable = true;
      peerPort = 50000;
    };
    jellyfin.enable = true;
    radarr.enable = true;
    sonarr.enable = true;
    lidarr.enable = true;
    bazarr.enable = true;
    readarr.enable = true;
    prowlarr.enable = true;
  };

  # sabnzbd

  # soulseek

  # nextcloud

  # gitea

}
