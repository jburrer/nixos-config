{...}:

{

  users = {
    users.gitea = {
      isSystemUser = true;
      uid = 510;
      group = "gitea";
    };
    groups."gitea".gid = 410;
  };

  virtualisation.oci-containers.containers = {

    "gitea" = {
      image = "gitea/gitea:latest";
      ports = [
        "3000:3000"
        "22:22"
      ];
      environment = {
        USER_UID = "510";
        USER_GID = "410";
        GITEA__database__DB_TYPE = "postgres";
        GITEA__database__HOST = "172.20.0.21:5432";
        GITEA__database__NAME = "gitea";
        GITEA__database__USER = "gitea";
        GITEA__database__PASSWD = "gitea";
      };
      volumes = [
        "/srv/containers/gitea:/data"
        "/etc/timezone:/etc/timezone:ro"
        "/etc/localtime:/etc/localtime:ro"
      ];
      dependsOn = [ "gitea-db" ];
      extraOptions = [
        "--pull=always"
        "--net=gitea_net"
        "--ip=172.20.0.20"
      ];
    };

    "gitea-db" = {
      autoStart = true;
      image = "postgres:14";
      volumes = [
        "/srv/containers/gitea/db:/var/lib/postgresql/data"
      ];
      environment = {
        POSTGRES_USER = "gitea";
        POSTGRES_PASSWORD = "gitea";
        POSTGRES_DB = "gitea";
      };
      extraOptions = [
        "--pull=always"
        "--net=gitea_net"
        "--ip=172.20.0.21"
      ];
    };

  };

}
