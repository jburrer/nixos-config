{ config, pkgs, ... }:

let
  vars = import ../../vars.nix;
in
{

  imports = [
    ./hardware-configuration.nix
    ../../modules/system.nix
    ../../modules/tailscale.nix
    ../../modules/ssh-server.nix
    ../../modules/zsh.nix
  ];
	
  # bootloader
  boot.loader.grub.device = "/dev/vda";

  # networking
  networking.hostName = "birdsbirdsbirds";

  # time
	time.timeZone = "America/Chicago";

  # user
	users = {
    mutableUsers = false;
		users."${vars.username}" = {
      isNormalUser = true;
		  description = "${vars.username}";
      hashedPassword = "$6$ydXSqwLCnkiWttxu$wTBOwycGI00ThHLnzBjBziyXVwwti8LT0kNRwI3wD/5yjK5CKV9Dt7czt/phJ0Ypdp8Pj8N2KB6EzTUyI4c4C/";
      extraGroups = [ "wheel" ];
      openssh.authorizedKeys.keys = [ (builtins.readFile ../../key.pub) ];
    };
	};

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
