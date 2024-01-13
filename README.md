# n3mo's nixos config
my personal nixos configuration spanning across all my devices, deployed with deploy-rs 

the devices include:
- system76 pangolin laptop (l4p70p)
- a custom built desktop pc (d35k70p)
- a custom built pc acting as a media server (m3d14)
- a vultr vps (vp5)

# todo 
- set up desktop

- add nixos-hardware to l4p70p
- manage secrets with sops-nix
- utilize nix for a good development workflow
    - direnv?
    - nix-shell with zsh?
- get better with neovim (IN PROGRESS)
    - code formatting
    - beautify
    - consistent spacing
    - tmux navigator?
- get into emacs
    - evil mode
    - org mode
    - org roam
    - maybe replace alacritty+tmux+neovim
- fix firefox
- declarative syncthing config (sync .gnupg directory)
- maybe vim keybindings in gnome

## grand plan
on all systems except vp5, use:
- grub
- full disk encryption with LUKS
    - ssh access during boot to boot remotely
- btrfs
- impermanence

this will require nixos to be reinstalled on l4p70p, d35k70p, and m3d14, so it may be
some time before i have the time to pull this off
