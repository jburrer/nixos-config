{ config, pkgs, ... }: {

  imports = [
    ./hardware-configuration.nix
    ../../modules
    ./homelab.nix
    ./docker-osx.nix
  ];

  hostname = "m3d14";
	
  # bootloader
  boot.loader.systemd-boot.enable = true;

  # filesystems
  environment.systemPackages = with pkgs; [ mergerfs ];
  services.snapraid = {
    enable = true;
    parityFiles = [ "/srv/diskp/snapraid.parity" ];
    contentFiles = [
      "/var/snapraid/snapraid.content"
      "/mnt/disks/disk0/snapraid.content"
      "/mnt/disks/disk1/snapraid.content"
    ];
    dataDisks = {
      d0 = "/mnt/disks/disk0";
      d1 = "/mnt/disks/disk1";
    };
  };
  fileSystems."/srv/storage" = {
    device = "/mnt/disks/*";
    fsType = "fuse.mergerfs";
    options = [ "category.create=mfs" ];
  };

  # something abt mergerfs mfs needs this i think?
  nixpkgs.config.allowUnfree = true;

  # change ssh server port to access gitea on port 22
  sshServer.port = 222;

  # needed to get ssl certs for tailscale address
  #services.tailscale.interfaceName = "userspace-networking";

  system.stateVersion = "23.05";

}
