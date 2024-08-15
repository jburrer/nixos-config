{ config, pkgs, ... }: {

  systemd.services."hangar6parking" = {
    description = "Application to Manage Aircraft Locations for Purdue's Flight School";
    after = [ "network.target" ];
    serviceConfig = {
      ExecStart = "cd /var/www/hangar6parking.xyz/ && ${pkgs.nodejs}/bin/npm run start";
      User = "n3mo";
      Restart = "always";
    };
  };

  services.nginx.virtualHosts."hangar6parking.online" = {
    forceSSL = true;
    enableACME = true;
    locations."/".proxyPass = "http://127.0.0.1:8080";
  };

};
