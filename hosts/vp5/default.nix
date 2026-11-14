{ config, pkgs, lib, ... }:

let

  nestWebPort = "8000";

  nestWebEnv = pkgs.python3.withPackages (ps: with ps; [
    flask
    flask-sqlalchemy
    gunicorn
  ]);

  updateNestWebsiteScript = pkgs.writeShellScript "update-nest-website-script" ''
    #!/bin/sh
    set -e
    USER_ID=$(id -u n3mo)
    export XDG_RUNTIME_DIR="/run/user/$USER_ID"
    export DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus"
    ${pkgs.git}/bin/git pull
    ${pkgs.systemd}/bin/systemctl restart nest-website-backend
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
      ExecStart = ''
        ${nestWebEnv}/bin/gunicorn --bind 127.0.0.1:${nestWebPort}
        --workers 3 wsgi:app
      '';
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

      ## nest online services ##
      # nest file server
      "files.thenest207.live" = {
        forceSSL = true;
        useACMEHost = "thenest207.live";
        locations."/".proxyPass = "http://file-server:8080";
      };
      # nest password manager
      "passwords.thenest207.live" = {
        forceSSL = true;
        useACMEHost = "thenest207.live";
        locations."/".proxyPass = "http://file-server:8001";
      };
      # nest git forge
      "git.thenest207.live" = {
        forceSSL = true;
        useACMEHost = "thenest207.live";
        locations."/".proxyPass = "http://file-server:3000";
        # may also need to proxy port 22 for ssh access ?
      };
      # nest website
      "thenest207.live" = {
        forceSSL = true;
        enableACME = true;
        locations."/".proxyPass = "http://localhost:${nestWebPort}";
      };
      # webhook  (for updating website)
      "webhook.thenest207.live" = {
        forceSSL = true;
        enableACME = true;
        locations."/".proxyPass = "http://localhost:9000";
      };

      ## remote access to personal services via nest website ##
      # remote jellyfin access 
      "jellyfin.thenest207.live" = {
        forceSSL = true;
        useACMEHost = "thenest207.live";
        locations."/".proxyPass = "http://m3d14:8096";
      };
      ## remote jellyseerr access 
      #"jellyseerr.thenest207.live" = {
      #  forceSSL = true;
      #  useACMEHost = "thenest207.live";
      #  locations."/".proxyPass = "http://m3d14:5055";
      #};
      ## remote immich access 
      #"immich.thenest207.live" = {
      #  forceSSL = true;
      #  useACMEHost = "thenest207.live";
      #  locations."/".proxyPass = "http://m3d14:2283";
      #};

    };
  };

  # webhook (to update websites on github push)
  services.webhook = {
    enable = true;
    user = "n3mo";
    group = "users";
    hooks.update-nest-website = {
      execute-command = "${updateNestWebsiteScript}";
      command-working-directory = "/var/www/thenest207.live";
      response-message = "OK\n";
    };
  };

  # open firewall for web hosting
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 ];
  };

}
