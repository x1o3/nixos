{
  description = "very smol snowflake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, zen-browser, home-manager, ... } @ inputs:
  let
    system = "x86_64-linux";
  in {
      nixosConfigurations.nyx = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./config/configuration.nix
	      home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.backupFileExtension = "HMBackup";
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; system = "x86_64-linux"; };
            home-manager.users.x1o3.imports = [
              ./config/home.nix
            ];
          }
        ];
        specialArgs = {
          zen = zen-browser.packages.${system}.specific;
        }; 
      };
    };
}
