{ config, pkgs, ... }:

let

  postgresUser = "postgres";
  postgresPassword = "iseLDMMpDKDyJjDTdAtbP3iARMdabbRP";
  postgresDb = "dawarich_development";
  appPort = 3000;
  secretKeyBase = "6P5sCMHk4wnOl2raiRLEtUsMW2n3UqNA";
  
  minMinutesSpentInCity = 60;
  timeZone = "America/Indianapolis";
  applicationProtocol = "http";
  applicationHosts = "localhost,::1,127.0.0.1,dawarich.n3mohomelab.xyz,dawarich.thenest207.live";
  selfHosted = true;
  storeGeodata = true;

in {

  system.activationScripts.mkDawarichDockerNetwork =
    let
      docker = config.virtualisation.oci-containers.backend;
      dockerBin = "${pkgs.${docker}}/bin/${docker}";
    in
      ''
     ${dockerBin} network inspect dawarich >/dev/null 2>&1 || \\
     ${dockerBin} network create dawarich 
     '';

  virtualisation.oci-containers.containers.dawarich_redis = {
    image = "redis:7.4-alpine";
    cmd = [ "redis-server" ];
    volumes = [ "dawarich_shared:/data" ];
    extraOptions = [
      "--network=dawarich"
      #"--restart=always"
      "--health-cmd=redis-cli --raw incr ping"
      "--health-interval=10s"
      "--health-retries=5"
      "--health-start-period=30s"
      "--health-timeout=10s"
    ];
  };

  virtualisation.oci-containers.containers.dawarich_db = {
    image = "postgis/postgis:17-3.5-alpine";
    #shmSize = "1G";
    volumes = [
      "dawarich_db_data:/var/lib/postgresql/data"
      "dawarich_shared:/var/shared"
    ];
    environment = {
      POSTGRES_USER = postgresUser;
      POSTGRES_PASSWORD = postgresPassword;
      POSTGRES_DB = postgresDb;
    };
    dependsOn = [ "dawarich_redis" ];
    extraOptions = [
      "--network=dawarich"
      #"--restart=always"
      "--health-cmd=pg_isready -U ${postgresUser} -d ${postgresDb}"
      "--health-interval=10s"
      "--health-retries=5"
      "--health-start-period=30s"
      "--health-timeout=10s"
    ];
  };

  virtualisation.oci-containers.containers.dawarich_app = {
    image = "freikin/dawarich:latest";
    ports = [ "${toString appPort}:3000" ];
    volumes = [
      "dawarich_public:/var/app/public"
      "dawarich_watched:/var/app/tmp/imports/watched"
      "dawarich_storage:/var/app/storage"
      "dawarich_db_data:/dawarich_db_data"
    ];
    environment = {
      RAILS_ENV = "production";
      REDIS_URL = "redis://dawarich_redis:6379";
      DATABASE_HOST = "dawarich_db";
      DATABASE_PORT = "5432";
      DATABASE_USERNAME = postgresUser;
      DATABASE_PASSWORD = postgresPassword;
      DATABASE_NAME = postgresDb;
      MIN_MINUTES_SPENT_IN_CITY = toString minMinutesSpentInCity;
      APPLICATION_HOSTS = applicationHosts;
      TIME_ZONE = timeZone;
      APPLICATION_PROTOCOL = applicationProtocol;
      PROMETHEUS_EXPORTER_ENABLED = "false";
      PROMETHEUS_EXPORTER_HOST = "0.0.0.0";
      PROMETHEUS_EXPORTER_PORT = "9394";
      SECRET_KEY_BASE = secretKeyBase;
      RAILS_LOG_TO_STDOUT = "true";
      SELF_HOSTED = toString selfHosted;
      STORE_GEODATA = toString storeGeodata;
    };
    dependsOn = [ "dawarich_db" "dawarich_redis" ];
    entrypoint = "web-entrypoint.sh";
    cmd = [ "bin/rails" "server" "-p" "3000" "-b" "::" ];
    extraOptions = [
      "--network=dawarich"
      #"--restart=on-failure"
      "--health-cmd=wget -qO - http://127.0.0.1:3000/api/v1/health | grep -q '\"status\"\\s*:\\s*\"ok\"'"
      "--health-interval=10s"
      "--health-retries=30"
      "--health-start-period=30s"
      "--health-timeout=10s"
      "--log-driver=json-file"
      "--log-opt=max-size=100m"
      "--log-opt=max-file=5"
      "--cpus=0.50"
      "--memory=4G"
    ];
  };

  virtualisation.oci-containers.containers.dawarich_sidekiq = {
    image = "freikin/dawarich:latest";
    volumes = [
      "dawarich_public:/var/app/public"
      "dawarich_watched:/var/app/tmp/imports/watched"
      "dawarich_storage:/var/app/storage"
    ];
    environment = {
      RAILS_ENV = "production";
      REDIS_URL = "redis://dawarich_redis:6379";
      DATABASE_HOST = "dawarich_db";
      DATABASE_PORT = "5432";
      DATABASE_USERNAME = postgresUser;
      database_PASSWORD = postgresPassword;
      DATABASE_NAME = postgresDb;
      APPLICATION_HOSTS = applicationHosts;
      BACKGROUND_PROCESSING_CONCURRENCY = "10";
      APPLICATION_PROTOCOL = applicationProtocol;
      PROMETHEUS_EXPORTER_ENABLED = "false";
      PROMETHEUS_EXPORTER_HOST_SIDEKIQ = "dawarich_app";
      PROMETHEUS_EXPORTER_PORT = "9394";
      SECRET_KEY_BASE = secretKeyBase;
      RAILS_LOG_TO_STDOUT = "true";
      SELF_HOSTED = toString selfHosted;
      STORE_GEODATA = toString storeGeodata;
    };
    dependsOn = [ "dawarich_db" "dawarich_redis" "dawarich_app" ];
    entrypoint = "sidekiq-entrypoint.sh";
    cmd = [ "sidekiq" ];
    extraOptions = [
      "--network=dawarich"
      #"--restart=on-failure"
      "--health-cmd=pgrep -f sidekiq"
      "--health-interval=10s"
      "--health-retries=30"
      "--health-start-period=30s"
      "--health-timeout=10s"
      "--log-driver=json-file"
      "--log-opt=max-size=100m"
      "--log-opt=max-file=5"
    ];
  };

  systemd.tmpfiles.rules = [
    "d /var/lib/docker/volumes/dawarich_db_data 0755 root root -"
    "d /var/lib/docker/volumes/dawarich_shared 0755 root root -"
    "d /var/lib/docker/volumes/dawarich_public 0755 root root -"
    "d /var/lib/docker/volumes/dawarich_watched 0755 root root -"
    "d /var/lib/docker/volumes/dawarich_storage 0755 root root -"
  ];

  services.nginx.virtualHosts."dawarich.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:${toString appPort}";
  };

}
