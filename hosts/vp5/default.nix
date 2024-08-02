{ config, pkgs, ... }: {

  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

  hostname = "vp5";
	
  # bootloader
  boot.loader.grub.device = "/dev/vda";

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
      "ydsapurdue.mooo.com" = {
        forceSSL = true;
        enableACME = true;
        root = "/var/www/ydsapurdue.mooo.com";
      };
      # dispatch dashboard
      "dispatchdashboard.mooo.com" = {
        forceSSL = true;
        enableACME = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:8080";
          extraConfig = ''
            proxy_ssl_server_name on;
            proxy_pass_header Authorization;
          '';
        };
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
    };
  };

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
    };
  };
  users.users.nginx.extraGroups = [ "acme" ];

  # open firewall for web hosting
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 ];
  };

  system.stateVersion = "23.05";

}
