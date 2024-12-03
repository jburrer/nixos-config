{ pkgs, lib, config, ... }: {

  options.gaming.nvidia.enable = lib.mkOption {
    default = false;
    type = lib.types.bool;
    description = ''
      whether to set up nvidia drivers
    '';
  };

  config = {

    nixpkgs.config.allowUnfree = true;

    # enable steam hardware
    hardware.steam-hardware.enable = true;

    # nvidia
    services.xserver.videoDrivers = lib.mkIf config.gaming.nvidia.enable [ "nvidia" ];
    hardware.graphics.enable = lib.mkIf config.gaming.nvidia.enable true;
    hardware.nvidia = lib.mkIf config.gaming.nvidia.enable {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      modesetting.enable = true;
      open = false;
      nvidiaSettings = false;
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
