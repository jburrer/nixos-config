{ config, pkgs, ... }: {

  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

  hostname = "vp5";
	
  # bootloader
  boot.loader.grub.device = "/dev/vda";

  # nginx to serve whirly birds site
  services.nginx = {
    enable = true;
    virtualHosts = {
      "whirlybirds.online" = {
        forceSSL = true;
        enableACME = true;
        root = "/var/www/whirlybirds.online";
      };
      "ydsapurdue.mooo.com" = {
        forceSSL = true;
        enableACME = true;
        root = "/var/www/ydsapurdue.mooo.com";
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
