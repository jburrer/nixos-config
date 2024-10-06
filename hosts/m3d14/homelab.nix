{ pkgs, ... }: {

  # enable nginx for proxying
  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
  };

  # acme wildcard certificate
  security.acme = {
    acceptTerms = true;
    defaults.email = "jburrer@purdue.edu";
    certs."local.n3mohomelab.xyz" = {
      domain = "local.n3mohomelab.xyz";
      extraDomainNames = [ "*.local.n3mohomelab.xyz" ];
      dnsProvider = "vultr";
      dnsPropagationCheck = true;
      environmentFile = "${pkgs.writeText "vultr-creds" ''
        VULTR_API_KEY=KYV2E5DMYYWELBZASVAVVKPW7JRVUJF3X6VQ
      ''}";
      # ^ fix this when secrets implemented ^
    };
  };
  users.users.nginx.extraGroups = [ "acme" ];

  # filegator
  #virtualisation.oci-containers.containers."filegator" = {
  #  image = "filegator/filegator";
  #  ports = [ "8080:7070" ];
  #};

  # radicale
  services.radicale = {
    enable = true;
    settings.server.hosts = [ "0.0.0.0:5232" ];
  };
  services.nginx.virtualHosts."radicale.local.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "local.n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:5232";
  };

  # vaultwarden
  services.vaultwarden = {
    enable = true;
    config = {
      DOMAIN = "https://vaultwarden.local.n3mohomelab.xyz";
      SIGNUPS_ALLOWED = true;
      ROCKET_ADDRESS = "127.0.0.1";
      ROCKET_PORT = 8222;
    };
  };
  services.nginx.virtualHosts."vaultwarden.local.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "local.n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:8222";
  };

  # minecraft
  services.minecraft-server = {
    enable = true;
    eula = true;
    declarative = true;
    serverProperties = {
      gamemode = "survival";
      difficulty = "hard";
      offline = true;
    };
  };
  services.nginx.virtualHosts."minecraft.local.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "local.n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:25565";
  };

  ### media server ### 

  # set up media user
  users.users."media" = {
    isSystemUser = true;
    uid = 10000;
    group = "media";
  };
  users.groups."media".gid = 10000;

  # jellyfin
  services.jellyfin = {
    enable = true;
    user = "media";
    group = "media";
    dataDir = "/srv/state/jellyfin";
    cacheDir = "/srv/state/jellyfin/cache";
  };
  services.nginx.virtualHosts."jellyfin.local.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "local.n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:8096";
  };

  # jellyseer
  services.jellyseerr.enable = true;
  services.nginx.virtualHosts."jellyseerr.local.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "local.n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:5055";
  };

  # radarr
  services.radarr = {
    enable = true;
    dataDir = "/srv/state/radarr";
    user = "media";
    group = "media";
  };
  services.nginx.virtualHosts."radarr.local.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "local.n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:7878";
  };

  # sonarr 
  services.sonarr = {
    enable = true;
    dataDir = "/srv/state/sonarr";
    user = "media";
    group = "media";
  };
  services.nginx.virtualHosts."sonarr.local.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "local.n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:8989";
  };

  # bazarr
  services.bazarr = {
    enable = true;
    user = "media";
    group = "media";
  };
  services.nginx.virtualHosts."bazarr.local.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "local.n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:6767";
  };

  # prowlarr
  services.prowlarr.enable = true;
  services.nginx.virtualHosts."prowlarr.local.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "local.n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:9696";
  };

  # transmission + wireguard

  #vpnnamespaces.wg = {
  #  enable = true;
  #  wireguardConfigFile = "/srv/state/transmission/wg0.conf";
  #  accessibleFrom = [ "192.168.0.0/24" ];
  #  portMappings = [
  #    {
  #      from = 9091;
  #      to = 9091;
  #    }
  #  ];
  #  openVPNPorts = [
  #    {
  #      port = 60729;
  #      protocol = "both";
  #    }
  #  ];
  #};
  #systemd.services.transmission.vpnconfinement = {
  #  enable = true;
  #  vpnnamespace = "wg";
  #};

  networking.nat = {
    enable = true;
    internalInterfaces = [ "ve-+" ];
    externalInterface = "enp4s0";
  };

  containers.transmission = {
    autoStart = true;

    privateNetwork = true;
    hostAddress = "192.168.100.10";
    localAddress = "192.168.100.11";

    config = { config, pkgs, lib, ... }: {

      # transmission
      services.transmission = {
        enable = true;
        home = "/srv/state/transmission";
        user = "media";
        group = "media";
        settings = {
          download-dir = "/srv/storage/torrents";
          incomplete-dir = "/srv/storage/torrents/incomplete";
          rpc-bind-address = "192.168.15.1";
          rpc-whitelist-enabled = false;
          rpc-host-whitelist-enabled = false;
        };
      };

      # networking (firewall + tailscale) 
      networking = {
        firewall = {
          enable = true;
          checkReversePath = "loose";
          trustedInterfaces = [ "tailscale0" ];
          allowedUDPPorts = [ config.services.tailscale.port ];
        };
        useHostResolvConf = lib.mkForce false;
      };
      services = {
        tailscale = {
          enable = true;
          interfaceName = "userspace-networking";
        };
        resolved.enable = true;
      };

      #tailscale set --exit-node=100.127.203.60 --exit-node-allow-lan-access=true

      system.stateVersion = "23.05";

    };
    
  };

  services.nginx.virtualHosts."transmission.local.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "local.n3mohomelab.xyz";
    locations."/".proxyPass = "http://192.168.15.1:9091";
  };

  # sabnzbd
  services.sabnzbd = {
    enable = true;
    user = "media";
    group = "media";
    #configFile = /srv/state/sabnzbd/sabnzbd.ini;
  };
  services.nginx.virtualHosts."sabnzbd.local.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "local.n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:8080";
  };

  # gotify
  services.gotify = {
    enable = true;
    environment.GOTIFY_SERVER_PORT = 6060;
  };
  services.nginx.virtualHosts."gotify.local.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "local.n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:6060";
  };

}
