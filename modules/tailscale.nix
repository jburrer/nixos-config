{ config, ... }:

{

	networking.firewall = {
    checkReversePath = "loose";
    trustedInterfaces = [ "tailscale0" ];
    allowedUDPPorts = [ config.services.tailscale.port ];
	};

	services.tailscale.enable = true;

}
