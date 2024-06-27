{ config, pkgs, ... }: {

  imports = [
    ./hardware-configuration.nix
    ../../modules
    ./containers
  ];

  hostname = "m3d14";
	
  # bootloader
  boot.loader.systemd-boot.enable = true;

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
  ssh-server.port = 222;

  system.stateVersion = "23.05";

}
