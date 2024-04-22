{ config, ... }:

{

  services.pipewire = {
    enable = true;
    alsa = {
	enable = true;
	support32Bit = true;
    };
    jack.enable = true;
  };
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire.extraConfig.pipewire."92-low-latency"."context.properties" = {
    "default.clock.rate" = 48000;
    "default.clock.quantum" = 32;
    "default.clock.min-quantum" = 32;
    "default.clock.max-quantum" = 32;
  };

  musnix = {
    enable = true;
    kernel.realtime = true;
  };

  users.users."${config.username}".extraGroups = [
    "video"
    "audio"
  ];

}
