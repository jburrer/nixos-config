{ pkgs, ... }:

let
  #argos = poetry2nixpkgs.poetry2nix.mkPoetryApplication rec{
  #  name = "argos-${version}";
  #  version = "1.12.0";
  #  src = pkgs.fetchFromGitHub {
  #    owner = "orontee";
  #    repo = "argos";
  #    rev = "v${version}";
  #    sha256 = "UOKzbC3/4YQTiXdVdGJCYjdVPHzK8vYo4IIb0ZKASac=";
  #  };
  #};
in
{

  services.mopidy = {
    enable = true;
    extensionPackages = with pkgs; [ mopidy-mpris mopidy-jellyfin ];
    settings = {
      jellyfin = {
        hostname = "http://m3d14:8096";
        username = "n3mo";
        password = "J0hn 0316";
      };
    };
  };

  # also integrate spotify into mopidy

  # eventually get some scrobbling in here

  #home.packages = ( [ argos ] );

  # package argos !!

}
