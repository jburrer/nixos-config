{ config, pkgs, lib, ... }: {

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

  # nginx
  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    virtualHosts = {

      ## whirly birds
      #"whirlybirds.online" = {
      #  forceSSL = true;
      #  enableACME = true;
      #  root = "/var/www/whirlybirds.online";
      #};

      ## ydsa 
      #"ydsapurdue.org" = {
      #  forceSSL = true;
      #  enableACME = true;
      #  root = "/var/www/ydsapurdue.org";
      #};

      ## row website
      #"rowpurdue.org" = {
      #  forceSSL = true;
      #  enableACME = true;
      #  root = "/var/www/rowpurdue.org";
      #};

      # nest website
      "thenest207.live" = {
        forceSSL = true;
        enableACME = true;
        root = "/var/www/thenest207.live";
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

    };
  };

  # open firewall for web hosting
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 ];
  };

}
