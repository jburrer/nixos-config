{

  description = "my nixos configuration, including my laptop, desktop, media server, and vps";

  inputs = {
    nixpkgs.url = "github:NixOs/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    deploy-rs.url = "github:serokell/deploy-rs";
    nur.url = "github:nix-community/NUR";
    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    impermanence.url = "github:nix-community/impermanence";
    betterfox.url = "github:HeitorAugustoLN/betterfox-nix";
    musnix.url = "github:musnix/musnix";
    #vpnconfinement = {
    #  url = "github:Maroka-chan/VPN-Confinement";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
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
    home-manager,
    deploy-rs,
    nur,
    lanzaboote,
    disko,
    impermanence, 
    betterfox,
    musnix,
    #vpnconfinement,
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
        package = pkgs.nixFlakes;
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
	  ({pkgs, ...}: { nixpkgs.overlays = [ emacs-overlay.overlay ]; })
          disko.nixosModules.disko
          lanzaboote.nixosModules.lanzaboote
          impermanence.nixosModules.impermanence
          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = inputs;
              users."${user}" = {
                imports = [
                  impermanence.nixosModules.home-manager.impermanence
                  nur.hmModules.nur
                  betterfox.homeManagerModules.betterfox
                ];
              };
            };
          }
        ];
      };
      "d35k70p" = nixpkgs.lib.nixosSystem {
	inherit system;
        modules = [
          ./hosts/d35k70p
          (nixConf pkgs)
	  ({pkgs, ...}: { nixpkgs.overlays = [ emacs-overlay.overlay ]; })
          impermanence.nixosModules.impermanence
          musnix.nixosModules.musnix
          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = inputs;
              users."${user}".imports = [
                nur.hmModules.nur
                betterfox.homeManagerModules.betterfox
              ];
            };
          }
        ];
      };
      "m3d14" = nixpkgs.lib.nixosSystem {
	inherit system;
        modules = [
          ./hosts/m3d14
          (nixConf pkgs)
          impermanence.nixosModules.impermanence
          #vpnconfinement.nixosModules.default
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
        modules = [
          ./hosts/vp5
          (nixConf pkgs)
          impermanence.nixosModules.impermanence
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

    deploy = {
      nodes = {
        "l4p70p" = {
          hostname = "l4p70p";
          profiles.system.path =
              deploy-rs.lib.x86_64-linux.activate.nixos
                  self.nixosConfigurations."l4p70p";
        };
        "d35k70p" = {
          hostname = "d35k70p";
          profiles.system.path =
              deploy-rs.lib.x86_64-linux.activate.nixos
                  self.nixosConfigurations."d35k70p";
        };
        "m3d14" = {
          hostname = "m3d14";
          sshOpts = [ "-p" "222" ];
          profiles.system.path =
              deploy-rs.lib.x86_64-linux.activate.nixos
                  self.nixosConfigurations."m3d14";
        };
        "vp5" = {
          hostname = "vp5";
          profiles.system.path =
              deploy-rs.lib.x86_64-linux.activate.nixos
                  self.nixosConfigurations."vp5";
        };
      };
      sshUser = "${user}";
      user = "root";
    };

    checks = builtins.mapAttrs
        (system: deployLib: deployLib.deployChecks self.deploy) deploy-rs.lib;

  };

}
