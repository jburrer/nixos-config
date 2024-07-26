{ ... }: {

  # radicale
  services.radicale = {
    enable = true;
    settings.server.hosts = [ "0.0.0.0:5232" ];
  };

  ### media server ### 
  users.groups."media".gid = 10000;
  users.groups."torrenting".gid = 10001;
  users.groups."usenet".gid = 10002;

  # jellyfin
  services.jellyfin = {
    enable = true;
    dataDir = "/srv/storage/media";
    user = "jellyfin";
    group = "media";
  };

  users = {
    users."jellyfin" = {
      isSystemUser = true;
      uid = 10010;
      group = "jellyfin";
      extraGroups = [ "media" ];
    };
    groups."jellyfin".gid = 10010;
  };

  # media server
  #nixarr = {
  #  enable = true;
  #  mediaDir = "/srv/storage";
  #  stateDir = "/srv/state";
  #  #ddns.njalla = {};
  #  vpn = {
  #    enable = true;
  #    wgConf = "/srv/state/wg0.conf";
  #  };
  #  transmission = {
  #    enable = true;
  #    #flood.enable = true;
  #    vpn.enable = true;
  #    peerPort = 50000;
  #  };
  #  jellyfin.enable = true;
  #  radarr.enable = true;
  #  sonarr.enable = true;
  #  lidarr.enable = true;
  #  bazarr.enable = true;
  #  readarr.enable = true;
  #  prowlarr.enable = true;
  #};

  # sabnzbd

  # soulseek

  # gitea

}
