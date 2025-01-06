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

  # copyparty 
  services.copyparty = {
    enable = true;
    settings = {
      i = "0.0.0.0";
      p = "3210";
    };
    accounts."n3mo".passwordFile = "/srv/state/copyparty/n3mo_password";
    volumes = {
      "/" = {
        path = "/srv/storage/nest";
        access = {
          r = "*";
          rw = "n3mo";
        };
      };
      "/media" = {
        path  = "/srv/storage";
        access.rw = "n3mo";
      };
    };
  };
  services.nginx.virtualHosts."copyparty.local.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "local.n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:3210";
  };

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

  # searxng 
  services.searx = {
    enable = true;
    package = pkgs.searxng;
    redisCreateLocally = true;
    settings = {
      general.instance_name = "n3mo's searx";
      ui = {
        default_locale = "en";
        query_in_title = true;
        infinite_scroll = true;
        center_alignment = true;
        default_theme = "simple";
        theme_args.simple_style = "dark";
        results_on_new_tab = true;
        hotkeys = "vim";
      };
      server = {
        base_url = "https://searx.local.n3mohomelab.xyz";
        port = 1234;
        bind_address = "127.0.0.1";
        secret_key = "superDuperSecret";
        method = "GET";
      };
      enabled_plugins = [
        "Basic Calculator"
        "Hash plugin"
        "Tor check plugin"
        "Open Access DOI rewrite"
        "Hostnames plugin"
        "Unit converter plugin"
        "Tracker URL remover"
      ];
    };
  };
  services.nginx.virtualHosts."searx.local.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "local.n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:1234";
  };

  # minecraft
  #services.minecraft-server = {
  #  enable = true;
  #  eula = true;
  #  servers."tekkit" = {
  #    enable = true;
  #    package = pkgs.fabricServers.fabric;
  #    #symlinks."mods" = "${modpack}/mods";
  #  };
  #};
  services.minecraft-server = {
    enable = true;
    eula = true;
    declarative = true;
    serverProperties = {
      gamemode = "survival";
      difficulty = "hard";
      online-mode = false;
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

  # lidarr
  services.lidarr = {
    enable = true;
    dataDir = "/srv/state/lidarr";
    user = "media";
    group = "media";
  };
  services.nginx.virtualHosts."lidarr.local.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "local.n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:8686";
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

  # immich
  services.immich = {
    enable = true;
    group = "media";
    host = "0.0.0.0";
    mediaLocation = "/srv/storage/media/photos/";
  };
  services.nginx.virtualHosts."immich.local.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "local.n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:2283";
  };

  # syncthing
  services.syncthing = {
    enable = true;
    user = "media";
    dataDir = "/srv/storage/";
    configDir = "/srv/state/syncthing/";
    overrideDevices = true;
    overrideFolders = true;
    settings = {
      devices = {
        "l4p70p".id = "KGVUOGB-QHWXGNM-HU5FOLN-U6G27HF-TBOIWGF-HFLINIT-CY7KW3L-GAMUVA7";
        "d35k70p".id = "AT4R74X-WFCYYHF-UDWSNSW-E3EAVR4-D3PQAG4-HHWTMNU-4444DTN-OWSS2QR";
      };
      folders = {
        "Music" = {
            path = "/srv/storage/media/music";
            devices = [ "l4p70p" ];
        };
        "Nest" = {
            path = "/srv/storage/nest";
            devices = [ "d35k70p" ];
        };
      };
      gui.insecureSkipHostcheck = true;
    };
  };
  services.nginx.virtualHosts."syncthing.local.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "local.n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:8384";
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
