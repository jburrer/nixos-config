{...}:

{

  users = {
    users.sabnzbd= {
      isSystemUser = true;
      uid = 508;
      group = "sabnzbd";
      extraGroups = [ "usenet" ];
    };
    groups."sabnzbd".gid = 408;
  };

  virtualisation.oci-containers.containers."sabnzbd" = {
    autoStart = true;
    image = "lscr.io/linuxserver/sabnzbd:latest";
    volumes = [
      "/srv/containers/sabnzbd:/config"
      "/srv/storage/usenet:/downloads"
      "/srv/storage/usenet/incomplete:/incomplete-downloads"
    ];
    environment = {
      "PUID" = "508";
      "PGID" = "202";
      "TZ" = "Etc/UTC";
    };
    ports = [ 
      "7070:8080"
      "563:563"
    ];
    extraOptions = [
      "--pull=always"
      "--net=media_net"
      "--ip=172.18.0.27"
    ];
  };

}
