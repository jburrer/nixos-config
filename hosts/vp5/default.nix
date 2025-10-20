{ config, pkgs, lib, ... }: {

  imports = [
    ./hardware-configuration.nix
    ../../modules
    ./hangar6parking.nix
  ];

  hostname = "vp5";
	
  # bootloader
  boot.loader.grub.device = "/dev/vda";

  # acme
  security.acme = {
    acceptTerms = true;
    defaults.email = "jburrer@purdue.edu";
    certs = {
      "thenest207.live" = {
        domain = "thenest207.live";
        extraDomainNames = [ "*.thenest207.live" ];
        dnsProvider = "vultr";
        environmentFile = "${pkgs.writeText "vultr-creds" ''
          VULTR_API_KEY=63WDSZPPODZUYD22AIIU6PLAT4OL6SP5I3KA
        ''}";
        # ^ fix this when secrets implemented ^
        webroot = lib.mkForce null;
      };
    };
  };
  users.users.nginx.extraGroups = [ "acme" ];

  # nginx
  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    virtualHosts = {

      # whirly birds
      "whirlybirds.online" = {
        forceSSL = true;
        enableACME = true;
        root = "/var/www/whirlybirds.online";
      };

      # ydsa 
      "ydsapurdue.org" = {
        forceSSL = true;
        enableACME = true;
        root = "/var/www/ydsapurdue.org";
      };

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
        locations."/".proxyPass = "http://m3d14:3210";
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

      # row website
      "rowpurdue.org" = {
        forceSSL = true;
        enableACME = true;
        root = "/var/www/rowpurdue.org";
      };

    };
  };

  # open firewall for web hosting
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 ];
  };

  system.stateVersion = "23.05";

}
