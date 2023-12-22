{...}:

{

  users = {
    users.ffsync = {
      isSystemUser = true;
      uid = 512;
      group = "ffsync";
    };
    groups."ffsync".gid = 412;
  };

  virtualisation.oci-containers.containers = {

    "ffsync" = {
      autoStart = true;
      image = "mozilla/syncserver:latest";
      environment = {
        "SYNCSERVER_PUBLIC_URL" = "http://m3d14:5000";
        "SYNCSERVER_SECRET" = "supersecret";
        "SYNCSERVER_SQLURI" = "postgresql://user:password@172.17.0.11/ffsyncdb";
        "SYNCSERVER_BATCH_UPLOAD_ENABLED" = "true";
        "SYNCSERVER_FORCE_WSGI_ENVIRON" = "true";
        "PORT" = "5000";
      };
      volumes = [ "/srv/containers/ffsync:/data" ];
      ports = [ "5000:5000" ];
      dependsOn = [ "ffsync_db" ];
      extraOptions = [ "--pull=always" ];
    };

    "ffsync_db" = {
      autoStart = true;
      image = "postgres:alpine";
      environment = {
        "POSTGRES_DB" = "ffsyncdb";
        "POSTGRES_USER" = "user";
        "POSTGRES_PASSWORD" = "password";
      };
      extraOptions = [ "--pull=always" ];
    };

  };

}
