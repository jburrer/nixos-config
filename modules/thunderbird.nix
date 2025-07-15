{ osConfig, lib, pkgs, thunderbird-gnome-theme, ... }:

let
  thunderbirdDaemonShellScript = pkgs.writeShellScriptBin "thunderbirdDaemonShellScript" ''
    while true; do
      ${pkgs.coreutils}/bin/sleep 10m
      ${pkgs.coreutils}/bin/timeout 10 ${pkgs.thunderbird}/bin/thunderbird --headless
    done
  '';
in {

  home.file.".thunderbird/${osConfig.username}/chrome/thunderbird-gnome-theme".source = thunderbird-gnome-theme;

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

  accounts.email.accounts = {

    "jburrer@purdue.edu" = {
      primary = true;
      address = "jburrer@purdue.edu";
      userName = "jburrer@purdue.edu";
      realName = "Jonathan Burrer";
      flavor = "outlook.office365.com";
      imap = {
        host = "outlook.office365.com";
        port = 993;
        tls.enable = true;
      };
      smtp = {
        host = "smtp.office365.com";
        port = 587;
        tls.useStartTls= true;
      };
      thunderbird = {
        enable = true;
        settings = id: {
          "mail.smtpserver.smtp_${id}.authMethod" = 10;
          "mail.server.server_${id}.authMethod" = 10;
        };
      };
    };

    "n3mo@startmail.com" = {
      address = "n3mo@startmail.com";
      thunderbird.enable = true;
      userName = "n3mo@startmail.com";
      passwordCommand = """
        pass personal/startmail.com | \
        grep ${osConfig.hostname} | \
        awf -F': ' '{print $2}'
      """;
      realName = "n3mo";
      imap = {
        host = "imap.startmail.com";
        port = 993;
        tls.enable = true;
      };
      smtp = {
        host = "smtp.startmail.com";
        port = 465;
        tls.enable = true;
      };
    };

    "thenestvenue207@gmail.com" = {
      address = "thenestvenue207@gmail.com";
      thunderbird.enable = true;
      userName = "thenestvenue207@gmail.com";
      flavor = "gmail.com";
      #passwordCommand = """
      #  pass personal/nest/gmail.com | \
      #  grep ${osConfig.hostname} | \
      #  awf -F': ' '{print $2}'
      #""";
      realName = "Johnny Burrer";
      #imap = {
      #  host = "imap.startmail.com";
      #  port = 993;
      #  tls.enable = true;
      #};
      #smtp = {
      #  host = "smtp.startmail.com";
      #  port = 465;
      #  tls.enable = true;
      #};
      thunderbird = {
        settings = id: {
          "mail.smtpserver.smtp_${id}.authMethod" = 10;
          "mail.server.server_${id}.authMethod" = 10;
        };
      };
    };

  };

}
