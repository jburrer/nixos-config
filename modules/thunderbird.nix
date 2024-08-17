{ config, osConfig, pkgs, thunderbird-gnome-theme, ... }:

{

  home.file.".thunderbird/${osConfig.username}/chrome/thunderbird-gnome-theme".source =
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

}
