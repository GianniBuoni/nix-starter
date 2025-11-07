# DO-NOT-EDIT. This file was auto-generated using github:vic/flake-file.
# Use `nix run .#write-flake` to regenerate it.
{
  description = "GianniBuoni's nix configuration";

  outputs = inputs: import ./outputs.nix inputs;

  inputs = {
    disko = {
      url = "github:nix-community/disko";
    };
    flake-file = {
      url = "github:vic/flake-file";
    };
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };
    import-tree = {
      url = "github:vic/import-tree";
    };
    nix-auto-follow = {
      inputs = {
        nixpkgs = {
          follows = "nixpkgs";
        };
      };
      url = "github:fzakaria/nix-auto-follow";
    };
    nixpkgs = {
      url = "github:NixOs/nixpkgs?ref=nixos-unstable";
    };
  };

}
