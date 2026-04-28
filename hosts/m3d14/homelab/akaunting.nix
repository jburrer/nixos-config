{ pkgs, config, ... }: {

  system.activationScripts.mkAkauntingNetwork =
    let
      docker = config.virtualisation.oci-containers.backend;
      dockerBin = "${pkgs.${docker}}/bin/${docker}";
    in
      ''
     ${dockerBin} network inspect akaunting >/dev/null 2>&1 || \\
     ${dockerBin} network create akaunting 
     '';

  virtualisation.oci-containers.containers = {

    akaunting-db = {
      image = "docker.io/mariadb:10.11";
      autoStart = true;
      environment = {
        MYSQL_ROOT_PASSWORD = "this is my db password";
        MYSQL_DATABASE = "akaunting";
        MYSQL_USER = "akaunting";
        MYSQL_PASSWORD = "this is my db password";
      };
      volumes = [
        "/srv/state/akaunting/:/var/lib/"
      ];
      extraOptions = [
        "--network=akaunting"
      ];
    };

    akaunting-redis = {
      image = "docker.io/redis:7-alpine";
      autoStart = true;
      volumes = [
        "/srv/state/akaunting/redis/:/data/"
      ];
      extraOptions = [
        "--network=akaunting"
      ];
    };

    akaunting-app = {
      image = "docker.io/akaunting/akaunting:latest";
      autoStart = true;
      dependsOn = [ "akaunting-db" "akaunting-redis" ];
      environment = {
        DB_HOST = "akaunting-db";
        DB_PORT = "3306";
        DB_NAME = "akaunting";
        DB_DATABASE = "akaunting";
        DB_USERNAME = "akaunting";
        DB_PASSWORD = "this is my db password";
        REDIS_HOST = "akaunting-redis";
        REDIS_PORT = "6379";
        CACHE_DRIVER = "redis";
        SESSION_DRIVER = "redis";
        QUEUE_CONNECTION = "redis";
        APP_URL = "https://accounting.thenest207.live";
        TRUSTED_PROXIES = "172.20.0.0/16 127.0.0.0/8 10.0.0.0/8";
        APP_ENV = "production";
        APP_DEBUG = "false";
        APP_LOG_LEVEL = "warning";
        MAIL_DRIVER = "log"; # change later?
        #AKAUNTING_SETUP = "true";
        LOCALE = "en-US";
        COMPANY_NAME = "Nest Productions Incorporated";
        COMPANY_EMAIL = "thenestvenue207@gmail.com";
        ADMIN_EMAIL = "thenestvenue207@gmail.com";
        ADMIN_PASSWORD = "FratBrotherJesse";
      };
      volumes = [
        "/srv/state/akaunting/:/var/www/akaunting/"
      ];
      ports = [
        "8889:8080"
      ];
      extraOptions = [
        "--network=akaunting"
      ];
    };
    
  };

}
