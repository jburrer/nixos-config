{...}:

{

  users = {
    users."nextcloud" = {
      isSystemUser = true;
      home = "/srv/state/nextcloud";
      uid = 10000;
      group = "nextcloud";
    };
    groups."nextcloud".gid = 10000;
  };

  containers."nextcloud" = {

    autoStart = true;

    forwardPorts = [
      {
        containerPort = 80;
        hostPort = 80;
        protocol = "tcp";
      }
      {
        containerPort = 8384;
        hostPort = 8384;
        protocol = "tcp";
      }
      {
        containerPort = 22000;
        hostPort = 22000;
        protocol = "tcp";
      }
      {
        containerPort = 22000;
        hostPort = 22000;
        protocol = "udp";
      }
      {
        containerPort = 21027;
        hostPort = 21027;
        protocol = "udp";
      }
    ];

    bindMounts = {
      "/var/www/html" = {
        hostPath = "/srv/state/nextcloud/";
        isReadOnly = false;
      };
      "/data" = {
        hostPath = "/srv/storage/";
        isReadOnly = false;
      };
    };

    config = { config, pkgs, ... }: {

      users = {
        users."nextcloud" = {
          isSystemUser = true;
          home = "/var/lib/nextcloud";
          uid = 10000;
          group = "nextcloud";
        };
        groups."nextcloud".gid = 10000;
      };

      services = {

        nextcloud = {

          enable = true;
          package = pkgs.nextcloud29;

          hostName = "m3d14";

          config.adminpassFile = "${pkgs.writeText "adminpass" "J0hn 0316"}";

          extraAppsEnable = true;
          extraApps = with config.services.nextcloud.package.packages.apps; {
            inherit contacts calendar;
          };

          configureRedis = true;

          settings.auth.bruteforce.protection.enabled = false;

        };

        syncthing = {
          enable = true;
          guiAddress = "0.0.0.0:8384";
          openDefaultPorts = true;
          user = "nextcloud";
          group = "nextcloud";
          settings.gui = {
            user = "n3mo";
            password = "J0hn 0316";
          };
        };

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
