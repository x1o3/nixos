{
  description = "very smol snowflake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = { self, nixpkgs, home-manager, zen-browser, ... } @ inputs: {
    nixosConfigurations.nyx = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      USER = "x1o3";
      specialArgs = { inherit inputs; };

      modules = [
        ./config/configuration.nix
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.backupFileExtension = "HMBackup";
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit inputs; system = "x86_64-linux"; };
          home-manager.users.${USER}.imports = [ ./config/home.nix ];
        }
      ];
    };
  };
}
