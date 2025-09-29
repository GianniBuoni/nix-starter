{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {nixpkgs, ...} @ inputs: let
    inherit (import ./constants.nix) systemSettings userSettings;
  in {
    nixosConfigurations.${systemSettings.hostName} = nixpkgs.lib.nixosSystem {
      system = inputs.flake-utils.lib.system.x86_64-linux;
      specialArgs = {
        inherit systemSettings;
        inherit userSettings;
      };
      modules = [
        inputs.disko.nixosModules.disko
        inputs.home-manager.nixosModules.home-manager
        ./modules
      ];
    };
  };
}
