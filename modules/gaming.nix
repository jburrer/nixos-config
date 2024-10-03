{ pkgs, lib, config, ... }: {

  options.gaming.nvidia.enable = lib.mkOption {
    default = false;
    type = lib.types.bool;
    description = ''
      whether to set up nvidia drivers
    '';
  };

  config = {

    # steam flatpak
    home-manager.users.${config.username}.services.flatpak.packages = [
      "com.valvesoftware.Steam" 
      "io.github.Foldex.AdwSteamGtk" 
    ];

    # nvidia
    nixpkgs.config.allowUnfree = lib.mkIf config.gaming.nvidia.enable true;
    services.xserver.videoDrivers = lib.mkIf config.gaming.nvidia.enable [ "nvidia" ];
    hardware = lib.mkIf config.gaming.nvidia.enable {
      graphics.enable = true;
      nvidia = {
        package = config.boot.kernelPackages.nvidiaPackages.stable;
        modesetting.enable = true;
        open = false;
        nvidiaSettings = false;
      };
    };

  };

}
