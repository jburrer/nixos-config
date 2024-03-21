{ config, pkgs, ... }:

{

  imports = [
    ./hardware-configuration.nix
    ../../modules/system
    ../../modules/tailscale
    ../../modules/zsh
  ];

  hostname = "vp5";
	
  # bootloader
  boot.loader.grub.device = "/dev/vda";

  # nginx to serve whirly birds site
  services.nginx = {
    enable = true;
    virtualHosts = {
      "whirlybirds.online" = {
        forcessl = true;
        enableacme = true;
        root = "/var/www/whirlybirds.online";
      };
      "cloud.whirlybirds.online" = {
        forceSSL = true;
        enableACME = true;
        root = "/var/www/test";
      };
      "vp5" = {
        #forcessl = true;
        #enableacme = true;
        root = "/var/www/ydsapurdue.online";
      };
    };
  };
  networking.firewall.allowedTCPPorts = [ 80 443 ];

  # acme for whirly birds site
  security.acme = {
    acceptTerms = true;
    defaults.email = "jburrer@purdue.edu";
  };

  system.stateVersion = "23.05";

}
