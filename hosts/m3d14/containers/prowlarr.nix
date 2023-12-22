{...}:

{

  users = {
    users.prowlarr= {
      isSystemUser = true;
      uid = 506;
      group = "prowlarr";
    };
    groups."prowlarr".gid = 406;
  };

  virtualisation.oci-containers.containers."prowlarr" = {
    autoStart = true;
    image = "lscr.io/linuxserver/prowlarr:latest";
    environment = {
      "PUID" = "506";
      "PGID" = "406";
      "TZ" = "Etc/UTC";
    };
    volumes = [ "/srv/containers/prowlarr:/config" ];
    ports = [ "9696:9696" ];
    extraOptions = [
      "--pull=always"
      "--net=media_net"
      "--ip=172.18.0.25"
    ];
  };

}
