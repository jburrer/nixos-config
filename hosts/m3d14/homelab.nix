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

  ## transmission + wireguard

  # wireguard
  systemd.services."netns@" = {
    before = [ "network.target" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = "${pkgs.iproute}/bin/ip netns add %I";
      ExecStop = "${pkgs.iproute}/bin/ip netns del %I";
    };
  };
  systemd.services.wg = {
    bindsTo = [ "netns@wg.service" ];
    requires = [ "network-online.target" ];
    after = [ "netns@wg.service" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = with pkgs; writers.writeBash "wg-up" ''
        set -e
        ${iproute}/bin/ip link add wg0 type wireguard
        ${iproute}/bin/ip link set wg0 netns wg
        ${iproute}/bin/ip -n wg address add 68.235.44.2 dev wg0
        ${iproute}/bin/ip netns exec wg \
          ${wireguard}/bin/wg setconf wg0 /srv/state/wg0.conf
        ${iproute}/bin/ip -n wg link set wg0 up
        ${iproute}/bin/ip -n wg route add default dev wg0
      '';
      ExecStop = with pkgs; writers.writeBash "wg-down" ''
        ${iproute}/bin/ip -n wg route del default dev wg0
        ${iproute}/bin/ip -n wg link del wg0
      '';
    };
  };

  # transmission
  services.transmission = {
    enable = true;
    webHome = pkgs.flood-for-transmission;
    home = "/srv/state/transmission";
    settings = {
      download-dir = "/srv/storage/torrents";
      incomplete-dir = "/srv/storage/torrents/incomplete";
    };
  }
  users.users."transmission".extraGroups = [ "torrenting" ];
  systemd.services.transmission = {
    bindsTo = [ "netns@wg.service" ];
    requires = [ "network-online.target" ];
    after = [ "wg.service" ];
    serviceConfig.NetworkNamespacePath = "/var/run/netns/wg";
  }



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
