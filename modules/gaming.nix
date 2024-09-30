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
    #nixpkgs.config.allowUnfree = true;

    # steam
    #programs.steam = {
    #  enable = true;
    #  remotePlay.openFirewall = true;
    #  dedicatedServer.openFirewall = true;
    #};

    home-manager.users.${config.username}.services.flatpak.packages = [
      "com.valvesoftware.Steam" 
      "io.github.Foldex.AdwSteamGtk" 
    ];

    # nvidia
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

    # some apps
    #home-manager.users.${config.username}.home.packages = with pkgs; [
    #  adwsteamgtk gamemode transmission_4
    #];

  };

}
