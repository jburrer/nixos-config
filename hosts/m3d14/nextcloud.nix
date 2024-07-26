{...}:

{

  containers."nextcloud" = {

    autoStart = true;

    privateNetwork = true;
    hostAddress = "172.19.0.1";
    localAddress = "192.168.100.10";

    forwardPorts = [
      {
        containerPort = 80;
        hostPort = 800;
        protocol = "tcp";
      }
      {
        containerPort = 8384;
        hostPort = 8384;
        protocol = "tcp";
      }
      #{
      #  containerPort = 22000;
      #  hostPort = 22000;
      #  protocol = "tcp";
      #}
      #{
      #  containerPort = 22000;
      #  hostPort = 22000;
      #  protocol = "udp";
      #}
      #{
      #  containerPort = 21027;
      #  hostPort = 21027;
      #  protocol = "udp";
      #}
    ];

    bindMounts = {
      "/var/www/html" = {
        hostPath = "/srv/state/nextcloud/";
        isReadOnly = false;
      };
      #"/var/www/html/data" = {
      #  hostPath = "/srv/storage/data/";
      #  isReadOnly = false;
      #};
    };

    config = { config, pkgs, ... }: {

      services = {
        nextcloud = {
          enable = true;
          package = pkgs.nextcloud29;
          hostName = "m3d14";
          config.adminpassFile = "${pkgs.writeText "adminpass" "J0hn 0316"}";
          extraApps = with config.services.nextcloud.package.packages.apps; {
            inherit contacts calendar;
          };
          extraAppsEnable = true;
          configureRedis = true;
        };
        #syncthing = {
        #  enable = true;
        #  guiAddress = "0.0.0.0:8384";
        #  openDefaultPorts = true;
        #  settings.gui = {
        #    user = "n3mo";
        #    password = "J0hn 0316";
        #  };
        #};
      };

      networking = {
        firewall = {
          enable = true;
          allowedTCPPorts = [ 80 8384 ];
        };
        useHostResolvConf = false;
      };
      services.resolved.enable = true;

      system.stateVersion = "23.05";

    };

  };

}
