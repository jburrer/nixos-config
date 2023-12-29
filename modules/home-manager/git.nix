{ pkgs, ... }:

let
  vars = import ../../vars.nix;
  gitIdentity =
    pkgs.writeShellScriptBin "git-identity"
    (builtins.readFile "${vars.scriptsDir}/git-identity");
in
{

  programs = {

    git = {
      enable = true;
      extraConfig = {
        user.useConfigOnly = true;
        commit.gpgSign = true;
        user.professional.name = "${vars.professionalUsername}";
        user.professional.email = "${vars.professionalEmail}";
        user.professional.signingkey = "EBDE10F25B613962";
        user.personal.name = "${vars.personalUsername}";
        user.personal.email = "${vars.personalEmail}";
        user.personal.signingkey = "0F0B80DCA5FC0EE6";
      };
      aliases = {
        identity = "! git-identity";
        id = "! git-identity";
      };
    };

    ssh = {
      enable = true;
      matchBlocks = {
        "gitea" = {
          hostname = "m3d14";
          port = 22;
        };
        "m3d14" = {
          hostname = "m3d14";
          port = 222;
        };
        "74bl37" = {
          user = "root";
        };
      };
    };

  };

}
