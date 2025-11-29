{ pkgs, config, ... }: {

  system.activationScripts.mkDawarichDockerNetwork =
    let
      docker = config.virtualisation.oci-containers.backend;
      dockerBin = "${pkgs.${docker}}/bin/${docker}";
    in
      ''
     ${dockerBin} network inspect dawarich >/dev/null 2>&1 || \\
     ${dockerBin} network create dawarich 
     '';



}
