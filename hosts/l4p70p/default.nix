{ config, pkgs, lib, ... }: {

  imports = [
    ./hardware-configuration.nix
    #(import ./disko-config.nix { device="/dev/nvme0n1"; })
    ../../modules
    ../../modules/gnome.nix
    ../../modules/gaming.nix
    ../../modules/printing.nix
    ../../modules/music-production.nix
  ];

  hostname = "l4p70p";
  configDir = "${config.homeDir}/Documents/nixos-config";

  # boot 
  boot = {
    # wipe root filesystem every boot, perserving old filesystems to revert to if needed
    #initrd.postDeviceCommands = lib.mkAfter ''
    #  mkdir /btrfs_tmp
    #  mount /dev/root_vg/root /btrfs_tmp
    #  if [[ -e /btrfs_tmp/root ]]; then
    #    mkdir -p /btrfs_tmp/old_roots
    #    timestamp=$(date --date="@$(stat -c %Y /btrfs_tmp/root)" "+%Y-%m-%-d_%H:%M:%S")
    #    mv /btrfs_tmp/root "/btrfs_tmp/old_roots/$timestamp"
    #  fi

    #  delete_subvolume_recursively() {
    #    IFS=$'\n'
    #    for i in $(btrfs subvolume list -o "$1" | cut -f 9- -d ' '); do
    #      delete_subvolume_recursively "/btrfs_tmp/$i"
    #    done
    #    btrfs subvolume delete "$1"
    #  }

    #  for i in $(find /btrfs_tmp/old_roots/ -maxdepth 1 -mtime +30); do
    #    delete_subvolume_recursively "$i"
    #  done

    #  btrfs subvolume create /btrfs_tmp/root
    #  umount /btrfs_tmp
    #'';
    # boot loader
    loader = {
      systemd-boot.enable = lib.mkForce false;
      efi.efiSysMountPoint = "/boot";
    };
    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };
  };

  # directories to persist between boots
  #fileSystems."/persist".neededForBoot = true;
  #environment.persistence."/persist/system" = {
  #  hideMounts = true;
  #  directories = [
  #    "/var/log"
  #    "/var/lib/bluetooth"
  #    "/var/lib/nixos"
  #    "/var/lib/systemd/coredump"
  #    "/etc/NetworkManager/system-connections"
  #    {
  #      directory = "/var/lib/colord";
  #      user = "colord";
  #      group = "colord";
  #      mode = "u=rwx,g=rx,o=";
  #    }
  #  ];
  #  files = [
  #    "/etc/machine-id"
  #    {
  #      file = "/var/keys/secret_file";
  #      parentDirectory = {
  #        mode = "u=rwx,g=,o=";
  #      };
  #    }
  #  ];
  #};

  # system76 hardware settings
  hardware.system76.enableAll = true;

  # power button
  services.logind = {
    powerKey = "suspend-then-hibernate";
    powerKeyLongPress = "poweroff";
  };

  # bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # home manager
  programs.fuse.userAllowOther = true;
  home-manager.users.${config.username} = {

    imports = [ ../../modules/thunderbird.nix ];

    services.flatpak.packages = [
      "org.libreoffice.LibreOffice"
      "org.gnome.Lollypop"
      "app.drey.EarTag"
      "org.gnome.Polari"
      "org.torproject.torbrowser-launcher"
      "org.getmonero.Monero"
    ];

    #home.persistence."/persist/home" = {
    #  directories = [
    #    "Documents"
    #    "Downloads"
    #    "Monero"
    #    "Music"
    #    "Org"
    #    "Pictures"
    #    "Templates"
    #    ".mozilla"
    #    ".thunderbird"
    #    ".password-store"
    #    ".gnupg"
    #    ".ssh"
    #    ".nixops"
    #    ".local/share/keyrings"
    #    ".local/share/direnv"
    #    {
    #        directory = ".local/share/Steam";
    #        method = "symlink";
    #    }
    #  ];
    #  files = [
    #    ".zsh_history"
    #  ];
    #  allowOther = true;
    #};

    services.syncthing.enable = true;

  };

  system.stateVersion = "23.05";

}
