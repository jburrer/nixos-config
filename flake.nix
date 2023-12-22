{

  description = "my nixos configuration, including my laptop, desktop, media server, and vps";

  inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # maybe add stable nixpkgs as well? determine which to use for which host?
    home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
    };
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
    nur,
    home-manager,
    firefox-gnome-theme,
    thunderbird-gnome-theme,
    arkenfox,
    musnix,
    stylix
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
      };
    };
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
      "birdsbirdsbirds" = nixpkgs.lib.nixosSystem {
			  inherit system;
        modules = [
          ./hosts/birdsbirdsbirds
          (nixConf pkgs)
          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users."n3mo".imports = [ ./hosts/birdsbirdsbirds/home.nix ];
            };
          }
        ];
      };
    };
  };

}
