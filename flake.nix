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

  outputs = { self, nixpkgs, home-manager, zen-browser, ... } @ inputs:{
    scripts = {
      bat_notify = ./dotfiles/.scripts/bat_notify.sh;
      bat_notify_rule = ./dotfiles/.scripts/bat_notify.rules;
    };  
    nixosConfigurations.nyx = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { 
        inherit inputs;
        batnotifyrule = self.scripts.bat_notify;
        batnotifyscript = self.scripts.bat_notify_rule;
      };
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
    };
  };
}
