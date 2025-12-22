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
    environment = {
      "CONDUIT_SERVER_NAME" = "conduit.n3mohomelab.xyz";
      "CONDUIT_DATABASE_BACKEND" = "rocksdb";
      "CONDUIT_DATABASE_PATH" = "/var/lib/matrix-conduit/";
      "CONDUIT_ALLOW_REGISTRATION" = "true";
      "CONDUIT_ALLOW_FEDERATION" = "true";
      "CONDUIT_MAX_REQUEST_SIZE" = "20000000";
      "CONDUIT_TRUSTED_SERVERS"= "[\"matrix.org\"]";
      "CONDUIT_MAX_CONCURRENT_REQUESTS" = "100";
      "CONDUIT_PORT" = "6167";
      "CONDUIT_CONFIG" = "";
    };
  };
  services.nginx.virtualHosts."conduit.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:8448";
  };

  # web interface
  virtualisation.oci-containers.containers."element" = {
    image = "vectorim/element-web";
    ports = [
      "8181:80"
    ];
  };
  services.nginx.virtualHosts."element.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:8181";
  };

  # coturn (for voice calls)

  ### bridges

  # google messages

  # instagram

  # signal

  # irc

}
