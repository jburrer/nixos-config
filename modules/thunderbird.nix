{ config, lib, pkgs, thunderbird-gnome-theme, ... }:

let
  thunderbirdDaemonShellScript = pkgs.writeShellScriptBin "thunderbirdDaemonShellScript" ''
    while true; do
      sleep 10m
      timeout 10 ${pkgs.thunderbird}/bin/thunderbird --headless
    done
  '';
in {

  home-manager.users.${config.username} = {

    home.file.".thunderbird/${config.username}/chrome/thunderbird-gnome-theme".source =
      thunderbird-gnome-theme;

    programs.thunderbird = {
      enable = true;
      profiles."n3mo" = {
        isDefault = true;
        settings = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "svg.context-properties.content.enabled" = true;
        };
        userChrome = ''
        @import "thunderbird-gnome-theme/userChrome.css";
        '';
        userContent = ''
        @import "thunderbird-gnome-theme/userContent.css";
        '';
      };
    };

  };

  systemd.user.services."thunderbird-daemon" = {
    enable = true;
    after = [ "network.target" ];
    wantedBy = [ "default.target" ];
    description = "Make thunderbird check emails every 5min";
    serviceConfig = {
      Type = "simple";
      ExecStart = "${lib.getExe thunderbirdDaemonShellScript}";
    };
  };

}
