{ pkgs, lib, config, ... }: {

  options.gaming.nvidia.enable = lib.mkOption {
    default = false;
    type = lib.types.bool;
    description = ''
      whether to set up nvidia drivers
    '';
  };

  config = {

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

    home-manager.users.${config.username} = {

      # steam flatpak
      services.flatpak.packages = [
        "com.valvesoftware.Steam" 
        "io.github.Foldex.AdwSteamGtk" 
      ];

      # prism launcher
      home.packages = with pkgs; [ prismlauncher jdk8 ];

    };

  };

}
