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
    groups."media".gid = 10000;
  };

  # jellyfin
  services.jellyfin = {
    enable = true;
    dataDir = "/srv/state/jellyfin";
    user = "media";
    group = "media";
  };

  # radarr
  services.radarr = {
    enable = true;
    dataDir = "/srv/state/radarr";
    user = "media";
    group = "media";
  };

  # sonarr 
  services.sonarr = {
    enable = true;
    dataDir = "/srv/state/sonarr";
    user = "media";
    group = "media";
  };

  # prowlarr
  services.prowlarr.enable = true;

  # transmission + wireguard
  vpnnamespaces.wg = {
    enable = true;
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
  systemd.services.transmission.vpnconfinement = {
    enable = true;
    vpnnamespace = "wg";
  };
  services.transmission = {
    enable = true;
    home = "/srv/state/transmission";
    user = "media";
    group = "media";
    settings = {
      download-dir = "/srv/storage/torrents";
      incomplete-dir = "/srv/storage/torrents/incomplete";
      rpc-bind-address = "192.168.15.1";
      rpc-whitelist-enabled = false;
      rpc-host-whitelist-enabled = false;
    };
  };

  # sabnzbd
  services.sabnzbd.enable = true;

}
