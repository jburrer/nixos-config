{...}:

{

  users = {
    users.qbittorrent = {
      isSystemUser = true;
      uid = 507;
      group = "qbittorrent";
      extraGroups = [ "torrents" ];
    };
    groups."qbittorrent".gid = 407;
  };

  virtualisation.oci-containers.containers."qbittorrent" = {
    autoStart = true;
    image = "dyonr/qbittorrentvpn";
    volumes = [
      "/srv/containers/qbittorrent:/config"
      "/srv/storage/torrents:/downloads"
    ];
    environment = {
      "PUID" = "507";
      "PGID" = "201";
      "VPN_ENABLED" = "yes";
      "VPN_TYPE" = "wireguard";
      "LAN_NETWORK" = "10.65.106.0/24";
    };
    ports = [ 
      "801:8080"
      "8999:8999"
      "8999:8999/udp"
    ];
    extraOptions = [
      "--cap-add=NET_ADMIN"
      "--pull=always"
      "--net=media_net"
      "--ip=172.18.0.26"
    ];
  };

}
