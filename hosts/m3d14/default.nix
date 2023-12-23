{ config, pkgs, ... }:

let
  vars = import ../../vars.nix;
in
{

  imports = [
    ./hardware-configuration.nix
    ./containers
    ../../modules/system.nix
    ../../modules/tailscale.nix
    ../../modules/ssh-server.nix
    ../../modules/zsh.nix
  ];
	
  # bootloader
	boot.loader.systemd-boot.enable = true;

  # networking
  networking.hostName = "m3d14";

  # time
	time.timeZone = "America/Indianapolis";

  # user
	users = {
    mutableUsers = false;
		users."${vars.username}" = {
      isNormalUser = true;
		  description = "${vars.username}";
      hashedPassword = "$6$SbShs85kCNZRdQ4f$J5.gwBoKIO8GSW2vFETLbiAFHRvL/6ngCdQKDuwwB4HIJg.F569vtCkQUrKMf578l3kDHE1peUjAANVT.C5PW0";
      extraGroups = [ "wheel" ];
      openssh.authorizedKeys.keys = [ (builtins.readFile ../../key.pub) ];
    };
	};

  # filesystems
  environment.systemPackages = with pkgs; [ mergerfs ];
  services.snapraid = {
    enable = true;
    parityFiles = [ "/srv/diskp/snapraid.parity" ];
    contentFiles = [
      "/var/snapraid/snapraid.content"
      "/srv/disk0/snapraid.content"
    ];
    dataDisks = {
      d0 = "/srv/disk0";
    };
  };

  # nginx proxy for qbittorrent
  services.nginx = {
    enable = true;
    virtualHosts."m3d14" = {
      listen = [
        {
          addr = "100.125.106.24";
          port = 8080;
        }
      ];
      locations."/".proxyPass = "http://127.0.0.1:801";
      extraConfig = ''
        proxy_http_version 1.1;
        proxy_set_header Host 127.0.0.1:30000;
        proxy_set_header X-Forwarded-Host $http_host;
        proxy_set_header X-Forwarded-For $remote_addr;
        client_max_body_size 100M;
      '';
    };
  };

  # change ssh server port to access gitea on port 22
  services.openssh.ports = [ 222 ];

	system.stateVersion = "23.05";

}
