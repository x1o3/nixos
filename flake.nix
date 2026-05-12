{
  description = "very smol snowflake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    private.url = "path:/home/x1o3/pvtconfs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
  let
    privateExists = builtins.pathExists /home/x1o3/pvtconfs;
  in
  {
    nixosConfigurations.nyx = nixpkgs.lib.nixosSystem {
      modules = [
        ./config/configuration.nix
        inputs.private.nixosModules.hc
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "HMBackup";
          home-manager.extraSpecialArgs = { inherit inputs; system = "x86_64-linux"; };
          home-manager.users.x1o3.imports = [ ./config/home.nix ];
        }
      ]
      ++ (
          if privateExists then
            [ inputs.private.nixosModules.hc ]
          else
            [ ]
        );
    };
  };
}
