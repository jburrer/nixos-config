{

  description = "my nixos configuration, including my laptop, desktop, media server, and vps";

  inputs = {
    nixpkgs.url = "github:NixOs/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOs/nixpkgs/release-24.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";
    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #disko = {
    #  url = "github:nix-community/disko";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
    #impermanence.url = "github:nix-community/impermanence";
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flatpaks.url = "github:gmodena/nix-flatpak";
    betterfox.url = "github:HeitorAugustoLN/betterfox-nix";
    musnix.url = "github:musnix/musnix";
    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-gnome-theme = {
      url = "github:rafaelmardojai/firefox-gnome-theme";
      flake = false;
    };
    thunderbird-gnome-theme = {
      url = "github:rafaelmardojai/thunderbird-gnome-theme";
      flake = false;
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    nur,
    lanzaboote,
    #disko,
    #impermanence, 
    sops-nix,
    flatpaks,
    betterfox,
    musnix,
    emacs-overlay,
    firefox-gnome-theme,
    thunderbird-gnome-theme
  }:
  let
    user = "n3mo";
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    nixConf = pkgs: {
      nix = {
        package = pkgs.nixVersions.stable;
        settings = {
          auto-optimise-store = true;
          experimental-features = [ "nix-command" "flakes" ];
          trusted-users = [ "${user}" ];
          substituters = [ 
            "https://cache.nixos.org"
            "https://nix-community.cachix.org"
          ];
          trusted-public-keys = [
            "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          ];
        };
      };
    };
  in {
    nixosConfigurations = {
      "l4p70p" = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = inputs;
        modules = [
          ./hosts/l4p70p
          (nixConf pkgs)
          ({pkgs, ...}: { nixpkgs.overlays = [
            emacs-overlay.overlay
            nur.overlays.default
            (final: _: {
              stable = import inputs.nixpkgs-stable {
                inherit (final.stdenv.hostPlatform) system;
                inherit (final) config;
              };
            })
          ]; })
          lanzaboote.nixosModules.lanzaboote
          #disko.nixosModules.disko
          #impermanence.nixosModules.impermanence
          sops-nix.nixosModules.sops
          musnix.nixosModules.musnix
          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = inputs;
              users."${user}".imports = [
                #impermanence.nixosModules.home-manager.impermanence
                flatpaks.homeManagerModules.nix-flatpak
                betterfox.homeModules.betterfox
              ];
            };
          }
        ];
      };
      "d35k70p" = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = inputs;
        modules = [
          ./hosts/d35k70p
          (nixConf pkgs)
          ({pkgs, ...}: { nixpkgs.overlays = [
            emacs-overlay.overlay
            nur.overlays.default
            (final: _: {
              stable = import inputs.nixpkgs-stable {
                inherit (final.stdenv.hostPlatform) system;
                inherit (final) config;
              };
            })
          ]; })
          #impermanence.nixosModules.impermanence
          sops-nix.nixosModules.sops
          musnix.nixosModules.musnix
          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = inputs;
              users."${user}".imports = [
                flatpaks.homeManagerModules.nix-flatpak
                betterfox.homeModules.betterfox
              ];
            };
          }
        ];
      };
      "m3d14" = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = inputs;
        modules = [
          ./hosts/m3d14
          (nixConf pkgs)
          #impermanence.nixosModules.impermanence
          sops-nix.nixosModules.sops
          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = inputs;
            };
          }
        ];
      };
      "vp5" = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = inputs;
        modules = [
          ./hosts/vp5
          (nixConf pkgs)
          sops-nix.nixosModules.sops
          #impermanence.nixosModules.impermanence
          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = inputs;
            };
          }
        ];
      };
    };
  };
}
