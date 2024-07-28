{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {self, ...} @ inputs: let
    pkgs = inputs.nixpkgs.lib;
    system = "x86_64-linux";
  in {
    nixosConfigurations = {
      nixos = pkgs.nixosSystem {
        inherit system;
        modules = [
          inputs.disko.nixosModules.disko
          ./configuration.nix
        ];
      };
    };
  };
}
