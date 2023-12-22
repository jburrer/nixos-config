{ ... }:

{

  users = {
    users."jellyfin" = {
      isSystemUser = true;
      uid = 500;
      group = "jellyfin";
      extraGroups = [ "media" ];
    };
    groups."jellyfin".gid = 400;
  };

  virtualisation.oci-containers.containers."jellyfin" = {
    autoStart = true;
    image = "lscr.io/linuxserver/jellyfin:latest";
    environment = {
      "PUID" = "500";
      "PGID" = "400";
      "TZ" = "Etc/UTC";
    };
    volumes = [
      "/srv/containers/jellyfin:/config"
      "/srv/storage/media:/data/media"
    ];
    ports = [
      "8096:8096"
      "8920:8920"
      "7359:7359"
      "1900:1900"
    ];
    extraOptions = [
      "--pull=always"
      "--net=media_net"
      "--ip=172.18.0.19"
    ];
  };

}
