{ osConfig, lib, pkgs, thunderbird-gnome-theme, ... }:

let
  thunderbirdDaemonShellScript = pkgs.writeShellScriptBin "thunderbirdDaemonShellScript" ''
    while true; do
      ${pkgs.coreutils}/bin/sleep 10m
      ${pkgs.coreutils}/bin/timeout 10 ${pkgs.thunderbird}/bin/thunderbird --headless
    done
  '';
in {

  home.file.".thunderbird/${osConfig.username}/chrome/thunderbird-gnome-theme".source =
    thunderbird-gnome-theme;

  programs.thunderbird = {
    enable = true;
    profiles."${osConfig.username}" = {
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

  systemd.user.services."thunderbird-daemon" = {
    Unit = {
      Description = "make thunderbird check emails every 5min";
      After = [ "network.target" ];
    };
    Install.WantedBy = [ "default.target" ];
    Service = {
      Type = "simple";
      ExecStart = "${lib.getExe thunderbirdDaemonShellScript}";
    };
  };

}
