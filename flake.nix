{

  description = "my nixos configuration, including my laptop, desktop, media server, and vps";

  inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
    };
    deploy-rs.url = "github:serokell/deploy-rs";
    nur.url = "github:nix-community/NUR";
    # add nixos hardware?
    # add impermanence?
		arkenfox.url = "github:dwarfmaster/arkenfox-nixos";
    musnix.url = "github:musnix/musnix";
    stylix.url = "github:danth/stylix";
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
    arkenfox,
    musnix,
    stylix,
    firefox-gnome-theme,
    thunderbird-gnome-theme
  }:
  let
		system = "x86_64-linux";
		pkgs = import nixpkgs {
			inherit system;
			config.allowUnfree = true;
		};
    nixConf = pkgs: {
      documentation.doc.enable = false;
      nix = {
        package = pkgs.nixFlakes;
        settings = {
          auto-optimise-store = true;
          experimental-features = [ "nix-command" "flakes" ];
        };
        gc = {
          automatic = true;
          dates = "weekly";
          options = "--delete-older-than 7d";
        };
        binaryCachePublicKeys = [ (builtins.readFile ./nix-pub.pem) ];
      };
    };
    vars = import ./vars.nix;
  in {
    nixosConfigurations = {
      "l4p70p" = nixpkgs.lib.nixosSystem {
			  inherit system;
        modules = [
          ./hosts/l4p70p
          (nixConf pkgs)
          musnix.nixosModules.musnix
          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = inputs;
              users."n3mo".imports = [
                ./hosts/l4p70p/home.nix
                nur.hmModules.nur
                arkenfox.hmModules.arkenfox
              ];
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
              users."n3mo".imports = [
                ./hosts/d35k70p/home.nix
                nur.hmModules.nur
                arkenfox.hmModules.arkenfox
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
              users."n3mo".imports = [ ./hosts/m3d14/home.nix ];
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
              users."n3mo".imports = [ ./hosts/vp5/home.nix ];
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
          hostname = "whirlybirds.online"; # change to vp5 after first deploy
          profiles.system.path =
              deploy-rs.lib.x86_64-linux.activate.nixos
                  self.nixosConfigurations."vp5";
        };
      };
      sshUser = "n3mo";
      user = "root";
    };

    checks = builtins.mapAttrs
        (system: deployLib: deployLib.deployChecks self.deploy) deploy-rs.lib;

  };

}
