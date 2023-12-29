{ ... }:

{

  options = { 

    port = lib.mkOption {
      default = 22;
      type = lib.types.port;
      description = ''
        port on which to host ssh server
      '';
    };

  };

  config = {

    services.openssh = {
      enable = true;
      ports = [ config.port ];
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
    };

  };

}
