{ pkgs, ... }:

{

  imports = [ ../desktop ];
  
  programs.hyprland.enable = true;

  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "Hyprland";
        user = "n3mo";
      };
      default_session = initial_session;
    };
  };
  environment.etc."greetd/environments".text = ''
    Hyprland
  '';

}
