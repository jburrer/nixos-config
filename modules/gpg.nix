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
        "D1957E7F42F26CFF3ABE6E85E0D1D9CA823FC878"
        "0F3652794185092A050DD6C37A7A3AC17B8B5A89"
      ];
    };

  };

}
