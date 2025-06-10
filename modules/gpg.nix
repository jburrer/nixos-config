{ pkgs, lib, config, osConfig, ... }: {

  options.pinentryPackage = lib.mkOption {
    default = pkgs.pinentry-curses;
    type = lib.types.package;
    description = ''
      flavor of pinentry
    '';
  };

  config = {

    programs.gpg = {
      enable = true;
      settings.keyserver = "hkps://keys.openpgp.org";
    };

    services.gpg-agent = {
      enable = true;
      enableSshSupport = true;
      pinentryPackage = osConfig.pinentryPackage;
      sshKeys = [
        "7EAB46835347B4F951790A55E7BC6E0CE03B6A23"
        "B670794B2AE2CD76555645219D6767A7188CA08F"
      ];
    };

  };

}
