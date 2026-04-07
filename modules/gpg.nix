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
      pinentry.package = osConfig.pinentryPackage;
      sshKeys = [
        "810179FAEAB9AD7A463A2EF6F5A2E879D4DBA0AA" # n3mo@startmail.com
        "8AB1FE5F03658EC4F0B032C832DEC49A3BA01D98" # jburrer@purdue.edu
      ];
    };

  };

}
