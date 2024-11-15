{ pkgs, lib, config, ... }: {

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

  powerManagement.cpuFreqGovernor = "performance";

  # low latency pipewire conf, will need to tweak
  services.pipewire.extraConfig.pipewire."92-low-latency".context.properties = {
    default.clock.rate = 48000;
    default.clock.quantum = 32;
    default.clock.min-quantum = 32;
    default.clock.max-quantum = 32;
  };

  # adds user to needed groups
  users.users."${config.username}".extraGroups = [ "audio" "video" ];

  # add programs with home manager
  home-manager.users.${config.username}.home.packages = with pkgs.stable; [
    ardour helvum hydrogen audacity x42-avldrums supercollider
    obs-studio pitivi
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

}
