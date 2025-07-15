# n3mo's nixos config
my personal nixos configuration spanning across all my devices

the devices include:
- system76 pangolin laptop (l4p70p)
- a custom built desktop pc (d35k70p)
- a custom built pc acting as a media server (m3d14)
- a vultr vps (vp5)

## todo
- manage secrets with sops-nix
- impermanence
  - switch to btrfs
  - requires reinstall
- fix distrobox
- declarative syncthing config

## grand plan
on all systems except vp5, use:
- full disk encryption with LUKS
    - ssh access during boot to boot remotely
- btrfs
- impermanence

this will require nixos to be reinstalled on l4p70p, d35k70p, and m3d14, so it may be
some time before i have the time to pull this off
