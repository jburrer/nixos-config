{ pkgs, ... }: {

  virtualisation.oci-containers.containers = {

    akaunting-db = {
      image = "docker.io/mariadb:10.11";
      autoStart = true;
      environment = {
        MYSQL_ROOT_PASSWORD_FILE = "/var/lib/db_password";
        MYSQL_DATABASE = "akaunting";
        MYSQL_USER = "akaunting";
        MYSQL_PASSWORD_FILE = "/var/lib/db_password";
      };
      volumes = [
        "/srv/state/akaunting/:/var/lib/"
      ];
    };

    akaunting-redis = {
      image = "docker.io/redis:7-alpine";
      autoStart = true;
      volumes = [
        "/srv/state/akaunting/redis/:/data/"
      ];
    };

    akaunting-app = {
      image = "docker.io/akaunting/akaunting:latest";
      autoStart = true;
      dependsOn = [ "akaunting-db" "akaunting-redis" ];
      environment = {
        DB_HOST = "akaunting-db";
        DB_PORT = "3306";
        DB_DATABASE = "akaunting";
        DB_USERNAME = "akaunting";
        DB_PASSWORD_FILE = "/var/www/akaunting/db_password";
        REDIS_HOST = "akaunting-redis";
        REDIS_PORT = "6379";
        CACHE_DRIVER = "redis";
        SESSION_DRIVER = "redis";
        QUEUE_CONNECTION = "redis";
        APP_URL = "https://accounting.thenest207.live";
        APP_ENV = "production";
        APP_DEBUG = "false";
        APP_LOG_LEVEL = "warning";
        MAIL_DRIVER = "log"; # change later?
        AKAUNTING_SETUP = "true";
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
    };
    
  };

}
