{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    nixcord.url = "github:kaylorben/nixcord";
    nvf.url = "github:notashelf/nvf";
    stylix = {
      url = "github:danth/stylix/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, chaotic, stylix, nvf, ... }@inputs:
    let
    system = "x86_64-linux";
	  host = "hydrogen";
	  username = "ari";
    in
    {
      nixosConfigurations = {
        "${host}" = nixpkgs.lib.nixosSystem { 
          specialArgs = {
      inherit system;
	    inherit inputs;
	    inherit username;
	    inherit host;
	  };
          modules = [
	    ./host/configuration.nix
	    chaotic.nixosModules.default
	    stylix.nixosModules.stylix
	    nvf.nixosModules.default
	    home-manager.nixosModules.home-manager
	    {
              home-manager.extraSpecialArgs = {
                inherit username;
	        inherit inputs;
	        inherit host;
	      };
	      home-manager.useGlobalPkgs = true;
	      home-manager.useUserPackages = true;
	      home-manager.backupFileExtension = "backup";
	      home-manager.users.${username} = import ./home/home.nix;
	      home-manager.sharedModules = [
	        inputs.nixcord.homeManagerModules.nixcord
	      ];
	    }
	  ];
	};
      };
    };
}
