{ pkgs, ... }: {

  # radicale
  services.radicale = {
    enable = true;
    settings.server.hosts = [ "0.0.0.0:5232" ];
  };

  ### media server ### 
  users = {
    users."media" = {
      isSystemUser = true;
      uid = 10000;
      group = "media";
    };
    groups = {
      "media".gid = 10000;
      "torrenting".gid = 10001;
      "usenet".gid = 10002;
    };
  };

  # jellyfin
  services.jellyfin = {
    enable = true;
    dataDir = "/srv/state/jellyfin";
  };
  users.users."jellyfin".extraGroups = [ "media" ];

  # radarr
  services.radarr = {
    enable = true;
    dataDir = "/srv/state/radarr";
  };
  users.users."radarr".extraGroups = [ "media" "torrenting" "usenet" ];

  # sonarr 
  services.sonarr = {
    enable = true;
    dataDir = "/srv/state/sonarr";
  };
  users.users."sonarr".extraGroups = [ "media" "torrenting" "usenet" ];

  # transmission + wireguard
  containers."transmission" = {
    autoStart = true;
    forwardPorts = [];
    bindMounts = {
      "/state" = {
        hostPath = "/srv/state/transmission";
        isReadOnly = false;
      };
      "/storage" = {
        hostPath = "/srv/storage/torrents";
        isReadOnly = false;
      };
    };
    config = { config, pkgs, ... }: {

      networking.wg-quick.interfaces."wg0".configFile = "/state/wg0.conf";

      services.transmission = {
        enable = true;
        webHome = pkgs.flood-for-transmission;
        home = "/state";
        settings = {
          download-dir = "/storage";
          incomplete-dir = "/storage/incomplete";
        };
      };

      system.stateVersion = "23.05";

    };
  };
  users = {
    users."transmission" = {
      isSystemUser = true;
      #uid = ;
      group = "transmission";
      extraGroups = [ "torrenting" ];
    };
    #groups."transmission".gid = ;
  };

  # sabnzbd

  # soulseek

  # gitea

}
