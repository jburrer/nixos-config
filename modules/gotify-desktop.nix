{ pkgs, ... }: {

  home.packages = with pkgs; [ gotify-desktop ];

  home.file.".config/gotify-desktop/config.toml".text = ''
    [gotify]
    url = "ws://m3d14:6060"
    token = "CmiE2bzNqmQh-K1"
  '';

  xdg.desktopEntries."gotify-desktop" = {
    name = "Gotify Desktop";
    exec = "gotify-desktop";
  };

}
