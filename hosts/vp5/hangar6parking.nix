{ pkgs, ... }: {

  systemd.services."hangar6parking" = {
    description = "Application to Manage Aircraft Locations for Purdue's Flight School";
    after = [ "network.target" ];
    serviceConfig = {
      WorkingDirectory="/var/www/hangar6parking.xyz";
      ExecStart = "${pkgs.nodejs}/bin/node ./src/index.js";
      User = "n3mo";
      Restart = "always";
    };
  };

  services.nginx.virtualHosts."hangar6parking.online" = {
    forceSSL = true;
    enableACME = true;
    locations."/" = {
      proxyPass = "http://127.0.0.1:8080";
      extraConfig = ''
        proxy_redirect off;
        proxy_set_header Connection "";
        proxy_http_version 1.1;
        chunked_transfer_encoding off;
        proxy_buffering off;
        proxy_cache off;
        proxy_read_timeout 24h;
      '';
    };
  };

}
