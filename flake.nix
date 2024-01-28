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
    # add impermanence?
    arkenfox.url = "github:dwarfmaster/arkenfox-nixos";
    musnix.url = "github:musnix/musnix";
    stylix.url = "github:danth/stylix";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-gnome-theme = {
      url = "github:rafaelmardojai/firefox-gnome-theme";
      flake = false;
    };
    firefox-cascade-theme = {
      url = "github:andreasgrafen/cascade";
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
    arkenfox,
    musnix,
    stylix,
    nixvim,
    emacs-overlay,
    firefox-gnome-theme,
    firefox-cascade-theme,
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
        };
        gc = {
          automatic = true;
          dates = "weekly";
          options = "--delete-older-than 7d";
        };
      };
    };
  in {
    nixosConfigurations = {
      "l4p70p" = nixpkgs.lib.nixosSystem {
			  inherit system;
        modules = [
          ./hosts/l4p70p
          (nixConf pkgs)
	  ({pkgs, ...}: {
	    nixpkgs.overlays = [ emacs-overlay.overlay ];
	  })
          musnix.nixosModules.musnix
          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = inputs;
              users."${user}" = {
                imports = [
                  ./hosts/l4p70p/home.nix
                  nur.hmModules.nur
                  arkenfox.hmModules.arkenfox
                  nixvim.homeManagerModules.nixvim
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
          musnix.nixosModules.musnix
          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = inputs;
              users."${user}".imports = [
                ./hosts/d35k70p/home.nix
                nur.hmModules.nur
                arkenfox.hmModules.arkenfox
                nixvim.homeManagerModules.nixvim
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
          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users."${user}".imports = [
                ./hosts/m3d14/home.nix
                nixvim.homeManagerModules.nixvim
              ];
            };
          }
        ];
      };
      "vp5" = nixpkgs.lib.nixosSystem {
			  inherit system;
        modules = [
          ./hosts/vp5
          (nixConf pkgs)
          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users."${user}".imports = [
                ./hosts/vp5/home.nix
                nixvim.homeManagerModules.nixvim
              ];
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
