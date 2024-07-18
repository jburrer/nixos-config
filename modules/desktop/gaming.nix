{ pkgs, lib, config, ... }: {

  options.gaming = {
    enable = lib.mkEnableOption "whether to set stuff up for gaming";
    nvidia = lib.mkEnableOption "whether to set up nvidia drivers";
  };

  config = lib.mkIf config.gaming.enable {

    # allow proprietary nixpkgs
    nixpkgs.config.allowUnfree = true;

    # steam
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };

    # nvidia
    services.xserver.videoDrivers = lib.mkIf config.gaming.nvidia [ "nvidia" ];
    hardware = lib.mkIf config.gaming.nvidia {
        opengl = {
        enable = true;
        driSupport = true;
        driSupport32Bit = true;
      };
      nvidia = {
        package = config.boot.kernelPackages.nvidiaPackages.stable;
        modesetting.enable = true;
        open = false;
        nvidiaSettings = false;
      };
    };

    # some apps
    home-manager.users.${config.username}.home.packages
        = lib.lists.optionals (config.desktop == "gnome") [
      pkgs.gnomeExtensions.gamemode-indicator-in-system-settings
    ] ++ [ pkgs.lutris pkgs.gamemode pkgs.transmission ];

  };

}
