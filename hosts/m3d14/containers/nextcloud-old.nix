{...}:
{

  users = {
    users.nextcloud = {
      isSystemUser = true;
      uid = 509;
      group = "nextcloud";
      extraGroups = [ "media" "torrents" "usenet" ];
    };
    groups."nextcloud".gid = 409;
  };

  virtualisation.oci-containers.containers = {

    "nextcloud" = {
      image = "nextcloud";
      ports = [ "800:80" ];
      environment = {
        MYSQL_PASSWORD = "nextcloud";
        MYSQL_DATABASE = "nextcloud";
        MYSQL_USER = "nextcloud";
        MYSQL_HOST = "172.19.0.21:3306";
      };
      dependsOn = [ "nextcloud-db" ];
      volumes = [
        "/srv/containers/nextcloud/:/var/www/html"
        "/srv/storage/data/:/var/www/html/data"
      ];
      extraOptions = [
        "--pull=always"
        "--net=nextcloud_net"
        "--ip=172.19.0.20"
      ];
    };

    "nextcloud-db" = {
      autoStart = true;
      image = "mariadb:10.5";
      cmd = [ "--transaction-isolation=READ-COMMITTED" "--binlog-format=ROW" ];
      volumes = [ "nextcloud-db:/var/lib/mysql" ];
      ports = [ "3306:3306" ];
      environment = {
        MYSQL_ROOT_PASSWORD = "nextcloud";
        MYSQL_PASSWORD = "nextcloud";
        MYSQL_DATABASE = "nextcloud";
        MYSQL_USER = "nextcloud";
      };
      extraOptions = [
        "--pull=always"
        "--net=nextcloud_net"
        "--ip=172.19.0.21"
      ];
    };

  };

}
