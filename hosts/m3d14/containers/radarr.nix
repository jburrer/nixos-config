{...}:

{

  users = {
    users."radarr" = {
      isSystemUser = true;
      uid = 501;
      group = "radarr";
      extraGroups = [ "media" "torrents" "usenet" ];
    };
    groups."radarr".gid = 401;
  };

  virtualisation.oci-containers.containers."radarr" = {
    autoStart = true;
    image = "lscr.io/linuxserver/radarr:latest";
    environment = {
      "PUID" = "501";
      "PGID" = "401";
      "TZ" = "Etc/UTC";
    };
    volumes = [
      "/srv/containers/radarr:/config"
      "/srv/storage:/data"
    ];
    ports = [ "7878:7878" ];
    extraOptions = [
      "--pull=always"
      "--net=media_net"
      "--ip=172.18.0.20"
    ];
  };

}
