{ config, pkgs, ... }: {

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
    certs."n3mohomelab.xyz" = {
      domain = "n3mohomelab.xyz";
      extraDomainNames = [ "*.n3mohomelab.xyz" ];
      dnsProvider = "vultr";
      dnsPropagationCheck = true;
      environmentFile = "${pkgs.writeText "vultr-creds" ''
        VULTR_API_KEY=KYV2E5DMYYWELBZASVAVVKPW7JRVUJF3X6VQ
      ''}";
      # ^ fix this when secrets implemented ^
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
      # remote jellyfin access 
      "jellyfin.n3mohomelab.xyz" = {
        forceSSL = true;
        useACMEHost = "n3mohomelab.xyz";
        locations."/".proxyPass = "http://m3d14:8096";
      };
      # remote jellyseerr access 
      "jellyseerr.n3mohomelab.xyz" = {
        forceSSL = true;
        useACMEHost = "n3mohomelab.xyz";
        locations."/".proxyPass = "http://m3d14:5055";
      };
      "thenest207.live" = {
        forceSSL = true;
        enableACME = true;
        root = "/var/www/thenest207.live";
        locations."~/(.*)$".proxyPass = "http://m3d14:3210$1";
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
