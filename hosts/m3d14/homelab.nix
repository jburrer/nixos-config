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

  # Define VPN network namespace
  vpnnamespaces.wg = {
    enable = true;
    #wireguardConfigFile = /. + "/secrets/wg0.conf";
    wireguardConfigFile = "/srv/state/transmission/wg0.conf";
    accessibleFrom = [ "192.168.0.0/24" ];
    portMappings = [
      {
        from = 9091;
        to = 9091;
      }
    ];
    openVPNPorts = [
      {
        port = 60729;
        protocol = "both";
      }
    ];
  };

  # Add systemd service to VPN network namespace.
  systemd.services.transmission.vpnconfinement = {
    enable = true;
    vpnnamespace = "wg";
  };

  #services.transmission = {
  #  enable = true;
  #  settings = {
  #    "rpc-bind-address" = "192.168.15.1"; # Bind RPC/WebUI to bridge address
  #  };
  #};

  services.transmission = {
    enable = true;
    #webHome = pkgs.flood-for-transmission;
    home = "/srv/state/transmission";
    settings = {
      download-dir = "/srv/storage/torrents";
      incomplete-dir = "/srv/storage/torrents/incomplete";
      rpc-bind-address = "192.168.15.1"; # Bind RPC/WebUI to bridge address
      rpc-whitelist-enabled = false;
      rpc-host-whitelist-enabled = false;
    };
  };

  users.users."transmission".extraGroups = [ "torrenting" ];

  #containers."transmission" = {
  #  autoStart = true;
  #  forwardPorts = [
  #    {
  #      containerPort = 9091;
  #      hostPort = 9091;
  #      protocol = "tcp";
  #    }
  #    {
  #      containerPort = 51820;
  #      hostPort = 51820;
  #      protocol = "udp";
  #    }
  #  ];
  #  bindMounts = {
  #    "/state" = {
  #      hostPath = "/srv/state/transmission";
  #      isReadOnly = false;
  #    };
  #    "/storage" = {
  #      hostPath = "/srv/storage/torrents";
  #      isReadOnly = false;
  #    };
  #  };
  #  config = { config, pkgs, ... }: {

  #    networking.wg-quick.interfaces."wg0".configFile = "/state/wg0.conf";

  #    services.transmission = {
  #      enable = true;
  #      webHome = pkgs.flood-for-transmission;
  #      home = "/state";
  #      settings = {
  #        download-dir = "/storage";
  #        incomplete-dir = "/storage/incomplete";
  #        rpc-bind-address = "0.0.0.0";
  #        rpc-whitelist = "127.0.0.1,10.0.0.1";
  #      };
  #    };

  #    system.stateVersion = "24.05";

  #  };
  #};

  # sabnzbd

  # soulseek

  # gitea

}
