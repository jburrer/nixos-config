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
    };
  };
  networking.firewall.allowedTCPPorts = [ 80 443 ];

  security.acme = {
    acceptTerms = true;
    defaults.email = "jburrer@purdue.edu";
  };

  system.stateVersion = "23.05";

}
