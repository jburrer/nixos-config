{ config, pkgs, ... }:

{

  imports = [
    ./hardware-configuration.nix
    ../../modules/system
    ../../modules/tailscale
    ../../modules/ssh-server
    ../../modules/zsh
  ];

  hostname = "vp5";
	
  # bootloader
  boot.loader.grub.device = "/dev/vda";

  # nginx to serve whirly birds site
  services.nginx = {
    enable = true;
    virtualHosts."whirlybirds.online" = {
      forceSSL = true;
      enableACME = true;
      root = "/var/www/whirlybirds.online";
    };
    virtualHosts."cloud.whirlybirds.online" = {
      forceSSL = true;
      enableACME = true;
      root = "/var/www/test";
    };
  };
  networking.firewall.allowedTCPPorts = [ 80 443 ];

  # acme for whirly birds site
  security.acme = {
    acceptTerms = true;
    defaults.email = "${vars.professionalEmail}";
  };

	system.stateVersion = "23.05";

}
