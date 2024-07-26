{ pkgs, lib, config, ... }: {

  options.gaming.nvidia.enable = lib.mkOption {
    default = false;
    type = lib.types.bool;
    description = ''
      whether to set up nvidia drivers
    '';
  };

  config = {

    # allow proprietary nixpkgs
    nixpkgs.config.allowUnfree = true;

    # steam
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };

    # nvidia
    services.xserver.videoDrivers = lib.mkIf config.gaming.nvidia.enable [ "nvidia" ];
    hardware = lib.mkIf config.gaming.nvidia.enable {
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
    home-manager.users.${config.username}.home.packages = with pkgs; [
      gamemode transmission #lutris
    ];

  };

}
