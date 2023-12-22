{ config, pkgs, thunderbird-gnome-theme, ... }:

let
  vars = import ../../vars.nix;
in
{

  #accounts.email.accounts."school" = {
  #  address = "jburrer@purdue.edu";
  #  flavor = "outlook.office365.com";
  #  primary = true;
  #  userName = "jburrer";
  #  realName = "Jonathan Burrer";
  #  imap = {
  #    host = "outlook.office365.com";
  #    port = 993;
  #    tls = {
  #      enable = true;
  #      useStartTls = true;
  #    };
  #  };
  #  smtp = {
  #    host = "smtp.office365.com";
  #    port = 587;
  #    tls = {
  #      enable = true;
  #      useStartTls = true;
  #    };
  #  };
  #  thunderbird.enable = true;
  #};

  home.file.".thunderbird/${vars.username}/chrome/thunderbird-gnome-theme".source = thunderbird-gnome-theme;

  programs.thunderbird = {
    enable = true;
    profiles."n3mo" = {
      isDefault = true;
      extraConfig = ''
        user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
        user_pref("svg.context-properties.content.enabled", true);
      '';
      userChrome = ''
        @import "thunderbird-gnome-theme/userChrome.css";
      '';
      userContent = ''
        @import "thunderbird-gnome-theme/userContent.css";
      '';
    };
  };

}
