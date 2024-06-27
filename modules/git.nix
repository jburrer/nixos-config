{ pkgs, ... }:

let
  # script slightly modified from https://pickard.cc/posts/git-identity-home-manager/
  gitIdentity = pkgs.writeShellScriptBin "git-identity" ''

# get each set of usernames from the git config (generated from nixos config)
IDENTITIES=$(git config --global --name-only --get-regexp "user.*..name" | sed -e 's/^user.//' -e 's/.name$//')

# filter them with fzf
ID=$(echo "$IDENTITIES" | ${pkgs.fzf}/bin/fzf -e -1 +m -q "$1")
if ! git config --global --get-regexp "user.$ID.name" > /dev/null; then
  printf 'Please use a valid git identity\nOptions:'
	git config --global --name-only --get-regexp "user.*..name" | sed -e 's/^user.//' -e 's/.name$//' -e 's/^/\t/'
	exit 1
fi

# set the id locally in each repo
git config user.name "$(git config user.$ID.name)"
git config user.email "$(git config user.$ID.email)"

echo "Name: $(git config user.name)"
echo "Email: $(git config user.email)"

  '';
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

  home.packages = with pkgs; [ git gitIdentity ];

}
