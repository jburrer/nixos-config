{...}:

# WIP 

{

  users = {
    users.searx = {
      isSystemUser = true;
      uid = 513;
      group = "searx";
    };
    groups."searx".gid = 413;
  };

  containers."searx" = {

    autoStart = true;

    privateNetwork = true;
    hostAddress = "172.20.0.1";
    localAddress = "192.168.101.10";

    forwardPorts = [ {
        containerPort = 8888;
        hostPort = 8888;
        protocol = "tcp";
    } ];

    # bindMounts = {
    #   "/var/www/html" = {
    #     hostPath = "/srv/containers/nextcloud/";
    #     isReadOnly = false;
    #   };
    #   "/var/www/html/data" = {
    #     hostPath = "/srv/storage/data/";
    #     isReadOnly = false;
    #   };
    # };

    config = { config, pkgs, ... }: {

      services.searx = {
        enable = true;
        settings.server = {
          port = 8888;
          secret_key = "secret key";
        };
      };

      networking = {
        firewall = {
          enable = true;
          allowedTCPPorts = [ 8888 ];
        };
        useHostResolvConf = false;
      };
      services.resolved.enable = true;

      system.stateVersion = "23.11";

    };

  };

}
