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
      "/storage" = {
        path  = "/srv/storage";
        access.rw = "n3mo";
      };
    };
  };

  # radicale
  services.radicale = {
    enable = true;
    settings.server.hosts = [ "0.0.0.0:5232" ];
    auth.type = "none";
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

  ### media server ### 

  # set up media user
  users.users."media" = {
    isSystemUser = true;
    uid = 10000;
    group = "media";
  };
  users.groups."media".gid = 10000;

  # set up docker
  virtualisation = {
    docker.enable = true;
    oci-containers.backend = "docker"; 
  };

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
  virtualisation.oci-containers.containers."lidarr" = {
    image = "lscr.io/linuxserver/lidarr:latest";
    volumes = [
      "/srv/state/lidarr:/config"
      "/srv/storage:/storage"
      "/srv/state/lidarr/custom-services.d:/custom-services.d"
      "/srv/state/lidarr/custom-cont-init.d:/custom-cont-init.d"
    ];
    ports = [
      "8686:8686"
    ];
    environment = {
      "PUID" = "10000";
      "PGID" = "10000";
    };
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

  # tailscale
  virtualisation.oci-containers.containers."tailscaleWithMullvad" = {
    image = "tailscale/tailscale:latest";
    hostname = "transmission-container";
    volumes = [
      "/srv/state/tailscale:/var/lib/tailscale"
    ];
    ports = [ # for transmission
      "9091:9091"
      "51413:51413"
      "51413:51413/udp"
    ];
    environment = {
      "TS_AUTHKEY" = "tskey-auth-k11e8QBcpC11CNTRL-8D2hWayRGk9H9FazgqdKk9aoT65e1DGm9";
      "TS_EXTRA_ARGS" = ''
        --reset
        --advertise-tags=tag:container
        --exit-node=100.117.167.110
        --exit-node-allow-lan-access=false
      ''; 
      "TS_STATE_DIR" = "/var/lib/tailscale";
      "TS_USERSPACE" = "false";
    };
    extraOptions = [
      "--cap-add=NET_ADMIN"
      "--cap-add=NET_RAW"
      "--device=/dev/net/tun:/dev/net/tun"
      "--dns=1.1.1.1"
      "--dns=100.100.100.100"
    ];
  };

  # transmission
  virtualisation.oci-containers.containers."transmission" = {
    image = "lscr.io/linuxserver/transmission:latest";
    volumes = [
      "/srv/state/transmission:/config"
      "/srv/storage/torrents:/downloads"
    ];
    environment = {
      "PUID" = "10000";
      "PGID" = "10000";
    };
    dependsOn = [ "tailscaleWithMullvad" ];
    extraOptions = [
      "--network=container:tailscaleWithMullvad"
    ];
  };
  services.nginx.virtualHosts."transmission.local.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "local.n3mohomelab.xyz";
    locations."/".proxyPass = "http://transmission-container:9091";
  };

  # sabnzbd
  virtualisation.oci-containers.containers."sabnzbd" = {
    image = "lscr.io/linuxserver/sabnzbd:latest";
    volumes = [
      "/srv/state/sabnzbd:/config"
      "/srv/storage/usenet:/downloads"
    ];
    ports = [
      "8080:8080"
    ];
    environment = {
      "PUID" = "10000";
      "PGID" = "10000";
    };
  };
  services.nginx.virtualHosts."sabnzbd.local.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "local.n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:8080";
  };

  # slskd
  virtualisation.oci-containers.containers."slskd" = {
    image = "slskd/slskd:latest";
    volumes = [
      "/srv/state/slskd:/app"
      "/srv/storage/soulseek:/downloads"
    ];
    ports = [
      "5030:5030"
      "5031:5031"
      "50300:50300"
    ];
    user = "1000:1000";
    environment = {
      "SLSKD_REMOTE_CONFIGURATION" = true;
    };
  };
  services.nginx.virtualHosts."slskd.local.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "local.n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:5030";
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
