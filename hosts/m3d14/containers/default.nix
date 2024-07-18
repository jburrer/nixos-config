{ pkgs, config, ... }:

let
  docker = config.virtualisation.oci-containers.backend;
  dockerBin = "${pkgs.${docker}}/bin/${docker}";
in
{

  imports = [
    #./jellyfin.nix
    #./radarr.nix
    #./sonarr.nix
    #./lidarr.nix
    #./readarr.nix
    #./bazarr.nix
    #./prowlarr.nix
    #./qbittorrent.nix
    #./sabnzbd.nix
    ./nextcloud.nix
    #./gitea.nix
    #./pihole.nix
    #./ffsync.nix
  ];

  # docker
  #virtualisation.oci-containers.backend = "docker";
  #system.activationScripts."createMedia_net" = ''
  #  ${dockerBin} network create media_net --subnet 172.18.0.0/16
  #'';
  #system.activationScripts."createGitea_net" = ''
  #  ${dockerBin} network create gitea_net --subnet 172.20.0.0/16
  #'';

  # extra groups
  #users.groups = {
  #  "media".gid = 200;
  #  "torrents".gid = 201;
  #  "usenet".gid = 202;
  #};

}
