{ config, lib, ... }:

{

  options.ssh-server.port = lib.mkOption {
    default = 22;
    type = lib.types.port;
    description = ''
      port on which to host ssh server
    '';
  };

  config = {

    services.openssh = {
      enable = true;
      ports = [ config.ssh-server.port ];
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
    };

    users.users."${config.username}".openssh.authorizedKeys.keyFiles = [ ../../key.pub ];

  };

}
