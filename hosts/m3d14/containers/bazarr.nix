{...}:

{

  users = {
    users."bazarr" = {
      isSystemUser = true;
      uid = 505;
      group = "bazarr";
      extraGroups = [ "media" ];
    };
    groups."bazarr".gid = 405;
  };

  virtualisation.oci-containers.containers."bazarr" = {
    autoStart = true;
    image = "lscr.io/linuxserver/bazarr:latest";
    environment = {
      "PUID" = "505";
      "PGID" = "405";
      "TZ" = "Etc/UTC";
    };
    volumes = [
      "/srv/containers/bazarr:/config"
      "/srv/storage/media/movies:/movies"
      "/srv/storage/media/tv:/tv"
    ];
    ports = [ "6767:6767" ];
    extraOptions = [
      "--pull=always"
      "--net=media_net"
      "--ip=172.18.0.24"
    ];
  };

}
