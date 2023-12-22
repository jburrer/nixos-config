{...}:

{

  users = { 
    users."sonarr" = {
      isSystemUser = true;
      uid = 502;
      group = "sonarr";
      extraGroups = [ "media" "torrents" "usenet" ];
    };
    groups."sonarr".gid = 402;
  };

  virtualisation.oci-containers.containers."sonarr" = {
    autoStart = true;
    image = "lscr.io/linuxserver/sonarr:latest";
    environment = {
      "PUID" = "502";
      "PGID" = "402";
      "TZ" = "Etc/UTC";
    };
    volumes = [
      "/srv/containers/sonarr:/config"
      "/srv/storage:/data"
    ];
    ports = [ "8989:8989" ];
    extraOptions = [
      "--pull=always"
      "--net=media_net"
      "--ip=172.18.0.21"
    ];
  };

}
