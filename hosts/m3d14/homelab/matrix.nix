{ config, pkgs, ... }:

{

  # conduit (matrix server)
  virtualisation.oci-containers.containers."conduit" = {
    image = "matrixconduit/matrix-conduit:latest";
    volumes = [
      "db:/var/lib/matrix-conduit/"
    ];
    ports = [
      "8448:6167"
    ];
    environment = [
      "CONDUIT_SERVER_NAME=conduit.n3mohomelab.xyz"
      "CONDUIT_DATABASE_BACKEND=rocksdb"
      "CONDUIT_ALLOW_REGISTRATION=true"
      "CONDUIT_ALLOW_FEDERATION=true"
      "CONDUIT_MAX_REQUEST_SIZE=20000000"
      "CONDUIT_TRUSTED_SERVERS=['matrix.org']"
      "CONDUIT_MAX_CONCURRENT_REQUESTS=100"
      "CONDUIT_PORT=6167"
      "CONDUIT_CONFIG=''"
    ];
  };
  services.nginx.virtualHosts."conduit.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:8448";
  };

  # coturn (for voice calls)

  ### bridges

  # google messages

  # instagram

  # signal

  # irc

}
