{ config, pkgs, ... }: {

  imports = [
    ./hardware-configuration.nix
    ../../modules
    #./homelab.nix
    #./containers
    ./nextcloud.nix
    #./docker-osx.nix
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
      "/mnt/disks/disk0/snapraid.content"
      "/mnt/disks/disk1/snapraid.content"
    ];
    dataDisks = {
      d0 = "/mnt/disks/disk0";
      d1 = "/mnt/disks/disk1";
    };
  };
  fileSystems."/srv/storage" = {
    device = "/mnt/disks/*";
    fsType = "fuse.mergerfs";
  };

  # nginx proxy for qbittorrent
  #services.nginx = {
  #  enable = true;
  #  #virtualHosts."m3d14" = {
  #  #  listen = [
  #  #    {
  #  #      addr = "100.125.106.24";
  #  #      port = 8080;
  #  #    }
  #  #  ];
  #  #  locations."/".proxyPass = "http://127.0.0.1:801";
  #  #  extraConfig = ''
  #  #    proxy_http_version 1.1;
  #  #    proxy_set_header Host 127.0.0.1:30000;
  #  #    proxy_set_header X-Forwarded-Host $http_host;
  #  #    proxy_set_header X-Forwarded-For $remote_addr;
  #  #    client_max_body_size 100M;
  #  #  '';
  #  #};
  #  #virtualHosts."nextcloud" = {
  #  #  listen = [
  #  #    {
  #  #      addr = "172.19.0.1";
  #  #      port = 800;
  #  #    }
  #  #  ];
  #  #  locations."/".proxyPass = "http://127.0.0.1:800";
  #  #  #extraConfig = ''
  #  #  #  proxy_http_version 1.1;
  #  #  #  proxy_set_header Host 127.0.0.1:800;
  #  #  #  proxy_set_header X-Forwarded-Host $http_host;
  #  #  #  proxy_set_header X-Forwarded-For $remote_addr;
  #  #  #  client_max_body_size 100M;
  #  #  #'';
  #  #};
  #};

  # change ssh server port to access gitea on port 22
  sshServer.port = 222;

  system.stateVersion = "23.05";

}
