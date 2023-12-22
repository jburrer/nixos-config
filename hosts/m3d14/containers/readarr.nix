{...}:

{

  users = {
    users."readarr" = {
      isSystemUser = true;
      uid = 504;
      group = "readarr";
      extraGroups = [ "media" "torrents" "usenet" ];
    };
    groups."readarr".gid = 404;
  };

  virtualisation.oci-containers.containers."readarr" = {
    autoStart = true;
    image = "lscr.io/linuxserver/readarr:develop";
    environment = {
      "PUID" = "504";
      "PGID" = "404";
      "TZ" = "Etc/UTC";
    };
    volumes = [
      "/srv/containers/readarr:/config"
      "/srv/storage:/data"
    ];
    ports = [ "8787:8787" ];
    extraOptions = [
      "--pull=always"
      "--net=media_net"
      "--ip=172.18.0.23"
    ];
  };

}
