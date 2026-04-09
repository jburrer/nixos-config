{ pkgs, lib, config, ... }:

let

launchFlatpak = pkgs.writeShellScriptBin "launch-flatpak" ''
  APP=$1
  flatpak run $APP
  LAUNCH_PID=$(flatpak ps --columns=child-pid --columns=application | grep $APP | cut -d $'\t' -f 1)
  echo $LAUNCH_PID
  cleanup() {
      echo "Shutting down..."
      flatpak kill $APP
      exit 0
  }
  trap cleanup SIGTERM SIGINT
  tail --pid=$LAUNCH_PID -f /dev/null
  echo "Launcher quitting..."
'';

in
{

  # adds user to neded groups
  users.users."${config.username}".extraGroups = [ "audio" "video" "dialout" ];

  # udev rules for usb dmx interface
  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6001", MODE="0666", GROUP="dialout"
  '';

  # pipewire, with low latency and jack suuport
  services.pipewire = {
    jack.enable = true;
    wireplumber.enable = true;
    extraConfig.pipewire = lib.mkIf (config.hostname == "d35k70p") {
      "92-low-latency" = {
        context.properties = {
          default.clock.rate = 48000;
          default.clock.quantum = 128;
          default.clock.min-quantum = 128;
          default.clock.max-quantum = 128;
        };
      };
      "91-live-sinks" = {
        "context.objects" = [
          {
            factory = "spa-node-factory";
            args = {
              "factory.name" = "support.node.driver";
              "node.name" = "Dummy-Driver";
              "priority.driver" = 8000;
            };
          }
          {
            factory = "adapter";
            args = {
              "factory.name" = "support.null-audio-sink";
              "node.name" = "spotify-sink";
              "node.description" = "sink for spotify";
              "media.class" = "Audio/Sink";
              "audio.position" = "FL,FR";
            };
          }
        ];
      };
    };
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

  # home manager
  home-manager.users.${config.username} = {

    home.packages = with pkgs.stable; [
      ardour x42-plugins x42-avldrums qlcplus pulseaudio
      (pkgs.callPackage ./custom-raysession.nix {})
    ] ++ [
      lsp-plugins launchFlatpak
    ];

    services.flatpak.packages = [
      "org.kde.kdenlive"
      "org.nickvision.tubeconverter"
      # obs and plugins
      "com.obsproject.Studio"
      "com.obsproject.Studio.Plugin.AitumMultistream"
      "com.obsproject.Studio.Plugin.VerticalCanvas"
    ];
    
  };

}
