{ config, lib, ... }:

with lib;

{

  options = {

    username = mkOption {
      default = "n3mo";
      type = types.str;
      description = ''
        username of main user
      '';
    };
    
    hostname = mkOption {
      type = types.str;
      description = ''
        hostname of nixos machine
      '';
    };

    homeDir = mkOption {
      default = "/home/${config.username}";
      type = types.str;
      description = ''
        home directory of main user
      '';
    };

    configDir = mkOption {
      default = "${config.homeDir}/nixos-config";
      type = types.str;
      description = ''
        directory storing nixos config
      '';
    };

    timezone = mkOption {
      default = "America/Indiana/Indianapolis";
      type = types.str;
      description = ''
        timezone that sytem primarily resides in
      '';
    };

    ssh-server.port = mkOption {
      default = 22;
      type = types.port;
      description = ''
        port on which to host ssh server
      '';
    };

  };

  config = {

    networking.hostName = config.hostname;

    time.timeZone = config.timezone;

    i18n = {
      defaultLocale = "en_US.UTF-8";
      extraLocaleSettings = {
        LC_ADDRESS = "en_US.UTF-8";
        LC_IDENTIFICATION = "en_US.UTF-8";
        LC_MEASUREMENT = "en_US.UTF-8";
        LC_MONETARY = "en_US.UTF-8";
        LC_NAME = "en_US.UTF-8";
        LC_NUMERIC = "en_US.UTF-8";
        LC_PAPER = "en_US.UTF-8";
        LC_TELEPHONE = "en_US.UTF-8";
        LC_TIME = "en_US.UTF-8";
      };
    };

    services.xserver = {
      layout = "us";
      xkbVariant = "";
      xkbOptions = "caps:swapescape";
    };
    console.useXkbConfig = true;

    users = {
      mutableUsers = false;
      users."${config.username}" = {
        isNormalUser = true;
        description = "${config.username}";
        hashedPassword = "$6$SbShs85kCNZRdQ4f$J5.gwBoKIO8GSW2vFETLbiAFHRvL/6ngCdQKDuwwB4HIJg.F569vtCkQUrKMf578l3kDHE1peUjAANVT.C5PW0";
        extraGroups = [ "wheel" ];
        openssh.authorizedKeys.keyFiles = [ ../../key.pub ];
      };
    };

    services.openssh = {
      enable = true;
      ports = [ config.ssh-server.port ];
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
    };

    security.sudo.extraRules = [{
      groups = [ "wheel" ];
      commands = [
        {
          command = "ALL";
          options = [ "NOPASSWD" ];
        }
      ];
    }];

    documentation.doc.enable = false;

  };

}
