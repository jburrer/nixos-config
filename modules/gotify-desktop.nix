{ pkgs, ... }: {

  home.packages = with pkgs; [ gotify-desktop ];

  home.file.".config/gotify-desktop/config.toml".text = ''
    [gotify]
    url = "wss://m3d14:6060"
    token = "CmiE2bzNqmQh-K1"

    [action]
    on_msg_command = "${pkgs.libnotify}/bin/notify-send $GOTIFY_MSG_TITLE $GOTIFY_MSG_TEXT"
  '';

}
