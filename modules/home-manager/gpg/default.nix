{ pkgs, config, lib, ... }:

with lib;
{

  options.pinentryPackage = mkOption {
    default = pkgs.pinentry-curses;
    type = types.package;
    description = ''
      flavor of pinentry
    '';
  };

  config = {

    programs.gpg.enable = true;

    services.gpg-agent = {
      enable = true;
      enableSshSupport = true;
      pinentryPackage = config.pinentryPackage;
      sshKeys = [
        "7EAB46835347B4F951790A55E7BC6E0CE03B6A23"
        "B670794B2AE2CD76555645219D6767A7188CA08F"
      ];
    };

  };

}
