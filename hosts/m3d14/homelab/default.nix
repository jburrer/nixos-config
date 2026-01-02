{ pkgs, config, lib, ... }: {

  imports = [
    ./homepage.nix
    ./matrix.nix
    #./dawarich.nix
  ];

  # acme wildcard certificate
  security.acme = {
    acceptTerms = true;
    defaults.email = "n3mo@startmail.com";
    certs."n3mohomelab.xyz" = {
      domain = "n3mohomelab.xyz";
      extraDomainNames = [ "*.n3mohomelab.xyz" ];
      dnsProvider = "vultr";
      environmentFile = "${pkgs.writeText "vultr-creds" ''
        VULTR_API_KEY=63WDSZPPODZUYD22AIIU6PLAT4OL6SP5I3KA
      ''}";
      # ^ fix this when secrets implemented ^
      webroot = lib.mkForce null;
    };
  };
  users.users.nginx.extraGroups = [ "acme" ];

  # enable nginx for proxying
  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
  };

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
  system.activationScripts.mkDockerNetwork =
    let
      docker = config.virtualisation.oci-containers.backend;
      dockerBin = "${pkgs.${docker}}/bin/${docker}";
    in
      ''
     ${dockerBin} network inspect medianet >/dev/null 2>&1 || \\
     ${dockerBin} network create medianet
     '';

  # watchtower
  virtualisation.oci-containers.containers."watchtower" = {
    autoStart = true;
    image = "containrrr/watchtower";
    volumes = [
      "/var/run/docker.sock:/var/run/docker.sock"
    ]; 
  };

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

  # vaultwarden
  virtualisation.oci-containers.containers."vaultwarden" = {
    image = "vaultwarden/server:latest";
    user = "10000:10000";
    volumes = [
      "/srv/state/vaultwarden:/data"
    ]; 
    ports = [
      "8001:80"
    ];
  };
  services.nginx.virtualHosts."vaultwarden.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:8001";
  };

  # forgejo
  #services.forgejo = {
  #  enable = true;
  #  settings.server.ROOT_URL = "forgejo.local.n3mohomelab.xyz";
  #};
  #services.nginx.virtualHosts."forgejo.local.n3mohomelab.xyz" = {
  #  forceSSL = true;
  #  useACMEHost = "local.n3mohomelab.xyz";
  #  locations."/".proxyPass = "http://localhost:3000";
  #};

  # jellyfin
  virtualisation.oci-containers.containers."jellyfin" = {
    image = "jellyfin/jellyfin";
    user = "10000:10000";
    volumes = [
      "/srv/state/jellyfin:/config"
      "/srv/state/jellyfin/cache:/cache"
      "/srv/storage/media:/media"
    ];
    ports = [
      "8096:8096"
    ];
    extraOptions = [ "--network=medianet" ];
  };
  services.nginx.virtualHosts."jellyfin.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:8096";
  };

  # jellyseerr
  virtualisation.oci-containers.containers."jellyseerr" = {
    image = "fallenbagel/jellyseerr";
    user = "10000:10000";
    volumes = [ "/srv/state/jellyseerr:/app/config" ];
    ports = [ "5055:5055" ];
    extraOptions = [ "--network=medianet" ];
  };
  services.nginx.virtualHosts."jellyseerr.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:5055";
  };

  # navidrome
  virtualisation.oci-containers.containers."navidrome" = {
    image = "deluan/navidrome:latest";
    user = "10000:10000";
    ports = [ "4533:4533" ];
    volumes = [
      "/srv/state/navidrome:/data"
      "/srv/storage/media/music:/music:ro"
    ];
    extraOptions = [ "--network=medianet" ];
  };
  services.nginx.virtualHosts."navidrome.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:4533";
  };

  # radarr
  virtualisation.oci-containers.containers."radarr" = {
    image = "lscr.io/linuxserver/radarr:latest";
    volumes = [
      "/srv/state/radarr:/config"
      "/srv/storage:/storage"
    ];
    ports = [
      "7878:7878"
    ];
    environment = {
      "PUID" = "10000";
      "PGID" = "10000";
    };
    extraOptions = [ "--network=medianet" ];
  };
  services.nginx.virtualHosts."radarr.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:7878";
  };

  # sonarr 
  virtualisation.oci-containers.containers."sonarr" = {
    image = "lscr.io/linuxserver/sonarr:latest";
    volumes = [
      "/srv/state/sonarr:/config"
      "/srv/storage:/storage"
    ];
    ports = [
      "8989:8989"
    ];
    environment = {
      "PUID" = "10000";
      "PGID" = "10000";
    };
    extraOptions = [ "--network=medianet" ];
  };
  services.nginx.virtualHosts."sonarr.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:8989";
  };

  # lidarr
  virtualisation.oci-containers.containers."lidarr" = {
    #image = "blampe/lidarr:lidarr-plugins-2.13.1.4678";
    image = "ghcr.io/hotio/lidarr:pr-plugins";
    volumes = [
      "/srv/state/lidarr:/config"
      "/srv/storage:/storage"
    ];
    ports = [
      "8686:8686"
    ];
    environment = {
      "PUID" = "10000";
      "PGID" = "10000";
    };
    extraOptions = [ "--network=medianet" ];
  };
  services.nginx.virtualHosts."lidarr.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:8686";
  };

  # prowlarr
  virtualisation.oci-containers.containers."prowlarr" = {
    image = "lscr.io/linuxserver/prowlarr:latest";
    volumes = [
      "/srv/state/prowlarr:/config"
    ];
    ports = [
      "9696:9696"
    ];
    environment = {
      "PUID" = "10000";
      "PGID" = "10000";
    };
    extraOptions = [ "--network=medianet" ];
  };
  services.nginx.virtualHosts."prowlarr.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:9696";
  };

  # autobrr
  virtualisation.oci-containers.containers."autobrr" = {
    image = "ghcr.io/autobrr/autobrr:latest";
    volumes = [ "/srv/state/autobrr:/config" ];
    ports = [
      "7474:7474"
    ];
    user = "10000:10000";
    extraOptions = [ "--network=medianet" ];
  };
  services.nginx.virtualHosts."autobrr.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:7474";
  };

  # bazarr
  virtualisation.oci-containers.containers."bazarr" = {
    image = "lscr.io/linuxserver/bazarr:latest";
    volumes = [
      "/srv/state/bazarr:/config"
      "/srv/storage:/storage"
    ];
    ports = [
      "6767:6767"
    ];
    environment = {
      "PUID" = "10000";
      "PGID" = "10000";
    };
    extraOptions = [ "--network=medianet" ];
  };
  services.nginx.virtualHosts."bazarr.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:6767";
  };

  # flaresolverr
  virtualisation.oci-containers.containers."flaresolverr" = {
    image = "ghcr.io/flaresolverr/flaresolverr:latest";
    ports = [
      "8191:8191"
    ];
    extraOptions = [ "--network=medianet" ];
  };

  # calibre web automated
  virtualisation.oci-containers.containers."cwa" = {
    image = "crocodilestick/calibre-web-automated:latest";
    ports = [
      "8083:8083"
    ];
    volumes = [
      "/srv/state/cwa:/config"
      "/srv/storage/cwa:/cwa-book-ingest"
      "/srv/storage/media/books:/calibre-library"
    ];
    environment = {
      "PUID" = "10000";
      "PGID" = "10000";
    };
    extraOptions = [ "--network=medianet" ];
  };
  services.nginx.virtualHosts."cwa.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:8083";
  };

  # calibre web automated book downloader
  virtualisation.oci-containers.containers."cwa-book-downloader" = {
    image = "ghcr.io/calibrain/calibre-web-automated-book-downloader:latest";
    ports = [
      "8084:8084"
    ];
    volumes = [
      "/srv/state/cwa-book-downloader:/config"
      "/srv/storage/cwa:/cwa-book-ingest"
    ];
    extraOptions = [ "--network=medianet" ];
  };
  services.nginx.virtualHosts."cwa-book-downloader.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:8084";
  };

  # readarr for audiobooks
  virtualisation.oci-containers.containers."readarr-audiobooks" = {
    image = "lscr.io/linuxserver/readarr:develop";
    volumes = [
      "/srv/state/readarr-audiobooks:/config"
      "/srv/storage:/storage"
    ];
    ports = [
      "9797:8787"
    ];
    environment = {
      "PUID" = "10000";
      "PGID" = "10000";
    };
    extraOptions = [ "--network=medianet" ];
  };
  services.nginx.virtualHosts."readarr-audiobooks.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:9797";
  };

  # audiobookshelf
  services.audiobookshelf = {
    enable = true;
    user = "media";
    group = "media";
  };
  services.nginx.virtualHosts."audiobookshelf.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:8000";
  };

  # recyclarr 
  services.recyclarr = {
    enable = true;
    user = "media";
    group = "media";
    command = "sync";
    schedule = "daily";
    configuration = {
      radarr = [
        {
          api_key = "05b2359314844434be39b5e05f4d7195";
          base_url = "http//localhost:7878";
          instance_name = "main";
        }
      ];
      sonarr = [
        {
          api_key = "b16bb26b3db641e99403d55c693b8987";
          base_url = "http://localhost:8989";
          instance_name = "main";
        }
      ];
    }; 
  };

  # tailscale
  virtualisation.oci-containers.containers."tailscalewithmullvad" = {
    image = "tailscale/tailscale:latest";
    hostname = "transmission-container";
    volumes = [
      "/srv/state/tailscale:/var/lib/tailscale"
    ];
    ports = [
      # for transmission
      "9091:9091"
      "41413:51413"
      "41413:51413/udp"
      # for slskd
      "5030:5030"
      "5031:5031"
      "50300:50300"
    ];
    environment = {
      "TS_AUTHKEY" = "kG7sjEn3RB21CNTRL";
      "TS_EXTRA_ARGS" = ''
        --reset
        --advertise-tags=tag:container
        --exit-node=100.117.167.110
        --exit-node-allow-lan-access=true
      ''; 
      "TS_STATE_DIR" = "/var/lib/tailscale";
      "TS_USERSPACE" = "false";
    };
    extraOptions = [
      "--network=medianet"
      "--cap-add=NET_ADMIN"
      "--cap-add=NET_RAW"
      "--device=/dev/net/tun:/dev/net/tun"
      "--dns=127.0.0.11"
      "--dns=1.1.1.1"
      "--dns=100.100.100.100"
    ];
  };

  # transmission (with vpn for public trackers)
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
    dependsOn = [ "tailscalewithmullvad" ];
    extraOptions = [
      "--network=container:tailscalewithmullvad"
    ];
  };
  services.nginx.virtualHosts."transmission.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "n3mohomelab.xyz";
    locations."/".proxyPass = "http://transmission-container:9091";
  };

  # transmission (without vpn for private trackers)
  virtualisation.oci-containers.containers."transmission1" = {
    image = "lscr.io/linuxserver/transmission:latest";
    volumes = [
      "/srv/state/transmission1:/config"
      "/srv/storage/torrents:/downloads"
    ];
    ports = [
      "8091:9091"
      "51413:51413"
      "51413:51413/udp"
    ];
    environment = {
      "PUID" = "10000";
      "PGID" = "10000";
    };
    extraOptions = [ "--network=medianet" ];
  };
  services.nginx.virtualHosts."transmission1.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:8091";
  };

  # sabnzbd
  virtualisation.oci-containers.containers."sabnzbd" = {
    image = "lscr.io/linuxserver/sabnzbd:latest";
    volumes = [
      "/srv/state/sabnzbd:/config"
      "/srv/storage/usenet:/downloads"
    ];
    ports = [ "8080:8080" ];
    environment = {
      "PUID" = "10000";
      "PGID" = "10000";
    };
    extraOptions = [ "--network=medianet" ];
  };
  services.nginx.virtualHosts."sabnzbd.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:8080";
  };

  # slskd
  virtualisation.oci-containers.containers."slskd" = {
    image = "slskd/slskd:latest";
    volumes = [
      "/srv/state/slskd:/app"
      "/srv/storage/soulseek:/downloads"
      "/srv/storage/media/music:/music"
    ];
    user = "10000:10000";
    environment = {
      "SLSKD_REMOTE_CONFIGURATION" = "true";
    };
    dependsOn = [ "tailscalewithmullvad" ];
    extraOptions = [
      "--network=container:tailscalewithmullvad"
    ];
  };
  services.nginx.virtualHosts."slskd.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "n3mohomelab.xyz";
    locations."/".proxyPass = "http://transmission-container:5030";
  };

  # immich
  services.immich = {
    enable = true;
    group = "media";
    host = "0.0.0.0";
    mediaLocation = "/srv/storage/media/photos/";
  };
  services.nginx.virtualHosts."immich.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:2283";
  };

  # gotify
  virtualisation.oci-containers.containers."gotify" = {
    image = "gotify/server";
    volumes = [ "/srv/state/gotify:/app/data" ];
    ports = [ "6060:80" ];
    extraOptions = [ "--network=medianet" ];
  };
  services.nginx.virtualHosts."gotify.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:6060";
  };

  # radicale
  services.radicale = {
    enable = true;
    settings = {
      server.hosts = [ "0.0.0.0:5232" ];
      auth.type = "none";
    };
  };
  services.nginx.virtualHosts."radicale.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "n3mohomelab.xyz";
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
  services.nginx.virtualHosts."searx.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:1234";
  };

  # hauk 
  virtualisation.oci-containers.containers."hauk" = {
    image="bilde2910/hauk:latest";
    ports = [
      "8082:80"
    ];
    volumes = [
      "/srv/state/hauk:/etc/hauk"
    ];
  };
  services.nginx.virtualHosts."hauk.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:8082";
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
        "ph0n3".id = "6UXKBRR-DEEFFKO-YFD4WTR-EZCVVCN-CXKRVYE-J7D5XOH-HBLODJC-TT3ZVAE";
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
        "Books" = {
            path = "/srv/storage/media/books";
            devices = [ "l4p70p" "ph0n3" ];
        };
      };
      gui.insecureSkipHostcheck = true;
    };
  };
  services.nginx.virtualHosts."syncthing.n3mohomelab.xyz" = {
    forceSSL = true;
    useACMEHost = "n3mohomelab.xyz";
    locations."/".proxyPass = "http://localhost:8384";
  };

}
