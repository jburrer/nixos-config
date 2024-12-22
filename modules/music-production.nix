{ pkgs, lib, config, ... }: {

  # adds user to needed groups
  users.users."${config.username}".extraGroups = [ "audio" "video" ];

  # pipewire jack suuport
  services.pipewire = {
    jack.enable = true;
    wireplumber.enable = true;
  };

  # musnix
  musnix = {
    enable = true;
    kernel.realtime = true;
    rtirq.enable = true;
    rtcqs.enable = true;
    alsaSeq.enable = true;
  };

  # hardware specific to d35k70p
  powerManagement.cpuFreqGovernor = lib.mkIf (config.hostname == "d35k70p") "performance";
  services.pipewire.extraConfig.pipewire."92-low-latency".context.properties =
      lib.mkIf (config.hostname == "d35k70p") {
    default.clock.rate = 48000;
    default.clock.quantum = 32;
    default.clock.min-quantum = 32;
    default.clock.max-quantum = 32;
  };


  # home manager
  home-manager.users.${config.username} = {

    # add programs (from stable branch)
    home.packages = with pkgs.stable; [
      ardour helvum supercollider
    ] ++ lib.lists.optionals (config.hostname == "d35k70p") [
      hydrogen audacity
      (
        pkgs.stdenv.mkDerivation {
          name = "xruncounter";
          src = pkgs.fetchFromGitHub {
            owner = "Gimmeapill";
            repo = "xruncounter";
            rev = "4c234dd";
            sha256 = "sha256-ShhkJ0GzXsJ8ZfhvVkASHeFZ5V2a/0KPj0zXpE9D/JU=";
          };
          buildInputs = [
            pkgs.libjack2
          ];
          buildPhase = ''
            gcc -Wall xruncounter.c -ljack -o xruncounter
          '';
          installPhase = ''
            mkdir -p $out/bin
            cp xruncounter $out/bin
          '';
        }
      )
    ];

    # add obs flatpak
    services.flatpak.packages = [
      "org.kde.kdenlive"
    ] ++ lib.lists.optionals (config.hostname == "d35k70p") [
      "com.obsproject.Studio"
    ];
    
  };

}
