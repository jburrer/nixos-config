{ config, pkgs, ... } :

{

  users.users."${config.username}".shell = pkgs.zsh;

  environment = {
    shells = [ pkgs.zsh ];
    pathsToLink = [ "/share/zsh" ];
  };

  programs.zsh.enable = true;

}
