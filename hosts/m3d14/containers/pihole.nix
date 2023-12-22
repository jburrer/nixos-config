{...}:

{

  users = {
    users.pihole = {
      isSystemUser = true;
      uid = 511;
      group = "pihole";
    };
    groups."pihole".gid = 411;
  };

  virtualisation.oci-containers.containers."pihole" = {
    autoStart = true;
    image = "pihole/pihole:latest";
    volumes = [
      "/srv/containers/pihole/pihole:/etc/pihole"
      "/srv/containers/pihole/dnsmasq:/etc/dnsmasq.d"
    ];
    environment = {
      "TZ" = "America/Indianapolis";
    };
    ports = [ 
      "53:53/tcp"
      "53:53/udp"
      "67:67/udp"
      "80:80/tcp"
    ];
    extraOptions = [
      "--cap-add=NET_ADMIN"
      "--pull=always"
    ];
  };

};
