{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {nixpkgs, ...} @ inputs: let
    inherit (import ./env.nix) systemSettings userSettings;
  in {
    nixosConfigurations.${systemSettings.hostName} = nixpkgs.lib.nixosSystem {
      inherit (systemSettings) system;
      specialArgs = {
        inherit systemSettings;
        inherit userSettings;
      };
      modules = [
        inputs.disko.nixosModules.disko
        ./configuration.nix
      ];
    };
  };
}
