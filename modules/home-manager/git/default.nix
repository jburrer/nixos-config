{ pkgs, ... }:

let
  gitIdentity = pkgs.writeShellScriptBin "git-identity" (builtins.readFile ./git-identity);
in
{

  programs = {

    git = {
      enable = true;
      extraConfig = {
        user.useConfigOnly = true;
        commit.gpgSign = true;
        user.professional.name = "jb-24";
        user.professional.email = "jburrer@purdue.edu";
        user.professional.signingkey = "EBDE10F25B613962";
        user.personal.name = "n3mo";
        user.personal.email = "n3mo@no.one";
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

  home.packages = with pkgs; [ git fzf gitIdentity ];

}
