{ pkgs, ... } :

let
	vars = import ../vars.nix;
in
{

  users.users."${vars.username}".shell = pkgs.zsh;

  environment = {
    shells = [ pkgs.zsh ];
    pathsToLink = [ "/share/zsh" ];
  };

  programs.zsh.enable = true;

}
