{...}:

{

  users = {
    users."lidarr" = {
      isSystemUser = true;
      uid = 503;
      group = "lidarr";
      extraGroups = [ "media" "torrents" "usenet" ];
    };
    groups."lidarr".gid = 403;
  };

  virtualisation.oci-containers.containers."lidarr" = {
    autoStart = true;
    image = "lscr.io/linuxserver/lidarr:latest";
    environment = {
      "PUID" = "503";
      "PGID" = "403";
      "TZ" = "Etc/UTC";
    };
    volumes = [
      "/srv/containers/lidarr:/config"
      "/srv/storage:/data"
    ];
    ports = [ "8686:8686" ];
    extraOptions = [
      "--pull=always"
      "--net=media_net"
      "--ip=172.18.0.22"
    ];
  };

}
