{ config, pkgs, lib, ... }:

let

  updateNestWebsiteScript = pkgs.writeShellScript "update-nest-website-script" ''
    #!/bin/sh
    set -e
    USER_ID=$(id -u n3mo)
    export XDG_RUNTIME_DIR="/run/user/$USER_ID"
    export DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus"
    ${pkgs.git}/bin/git pull
    ${pkgs.systemd}/bin/systemctl restart nest-website-backend
  '';

  updateYdsaWebsiteScript = pkgs.writeShellScript "update-ydsa-website-script" ''
    #!/bin/sh
    ${pkgs.git}/bin/git pull
  '';

in {

  imports = [
    ./gandicloud.nix
    ../../modules
  ];

  hostname = "vp5";
	
  # bootloader
  boot.loader.grub.device = "/dev/vda";

  # necessary for gandi.net
  services.openssh.settings.PermitRootLogin = lib.mkForce "prohibit-password";

  # acme
  security.acme = {
    acceptTerms = true;
    defaults.email = "n3mo@startmail.com";
    certs."thenest207.live" = {
      domain = "thenest207.live";
      extraDomainNames = [ "*.thenest207.live" ];
      dnsProvider = "gandiv5";
      environmentFile = "${pkgs.writeText "gandi-creds" ''
        GANDIV5_PERSONAL_ACCESS_TOKEN=9b457fcd4c18437b4f4cf967ea36d2ce61cd4d92
      ''}";
      # ^ fix this when secrets implemented ^
      webroot = lib.mkForce null;
    };
  };
  users.users.nginx.extraGroups = [ "acme" ];

  # give n3mo write access to update websites
  users.users."${config.username}".extraGroups = [ "nginx" ];

  # systemd service for nest website backend
  systemd.services."nest-website-backend" = {
    description = "Backend for thenest207.live";
    after = [ "network.target" ];
    serviceConfig = {
      WorkingDirectory="/var/www/thenest207.live";
      ExecStart = "/var/www/thenest207.live/.venv/bin/python ./app.py";
      User = "n3mo";
      Restart = "always";
    };
  };

  # nginx
  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    virtualHosts = {
      # nest website
      "thenest207.live" = {
        forceSSL = true;
        enableACME = true;
        locations."/".proxyPass = "http://localhost:5000";
      };
      # nest file server
      "files.thenest207.live" = {
        forceSSL = true;
        useACMEHost = "thenest207.live";
        locations."/".proxyPass = "http://m3d14:8081";
      };
      # nest password manager
      "passwords.thenest207.live" = {
        forceSSL = true;
        useACMEHost = "thenest207.live";
        locations."/".proxyPass = "http://m3d14:8001";
      };
      # nest accounting software
      "accounting.thenest207.live" = {
        forceSSL = true;
        useACMEHost = "thenest207.live";
        locations."/".proxyPass = "http://m3d14:8889";
      };
      # remote jellyfin access 
      "jellyfin.thenest207.live" = {
        forceSSL = true;
        useACMEHost = "thenest207.live";
        locations."/".proxyPass = "http://m3d14:8096";
      };
      # remote jellyseerr access 
      "jellyseerr.thenest207.live" = {
        forceSSL = true;
        useACMEHost = "thenest207.live";
        locations."/".proxyPass = "http://m3d14:5055";
      };
      # remote immich access 
      "immich.thenest207.live" = {
        forceSSL = true;
        useACMEHost = "thenest207.live";
        locations."/".proxyPass = "http://m3d14:2283";
      };
      # remote hauk access 
      "hauk.thenest207.live" = {
        forceSSL = true;
        useACMEHost = "thenest207.live";
        locations."/".proxyPass = "http://m3d14:8082";
      };
      # raisas writing portfolio
      "raisa.thenest207.live" = {
        forceSSL = true;
        enableACME = true;
        root = "/var/www/raisa.thenest207.live";
      };
      # ydsa purdue website
      "ydsapurdue.org" = {
        forceSSL = true;
        enableACME = true;
        root = "/var/www/ydsapurdue.org";
      };
      # webhook 
      "webhook.thenest207.live" = {
        forceSSL = true;
        enableACME = true;
        locations."/".proxyPass = "http://localhost:9000";
      };
    };
    # remote minecraft access 
    appendConfig = ''
      stream {
        upstream minecraft_backend {
          server m3d14:25565;
        }
        server {
          listen 25565;
          proxy_pass minecraft_backend;
        }
      }
    '';
  };

  # webhook (to update websites on github push)
  services.webhook = {
    enable = true;
    user = "n3mo";
    group = "users";
    hooks = {
      update-nest-website = {
        execute-command = "${updateNestWebsiteScript}";
        command-working-directory = "/var/www/thenest207.live";
        response-message = "OK\n";
      };
      update-ydsa-website = {
        execute-command = "${updateYdsaWebsiteScript}";
        command-working-directory = "/var/www/ydsapurdue.org";
        response-message = "OK\n";
      };
    };
  };

  # open firewall for web hosting
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 25565 ];
  };

}
