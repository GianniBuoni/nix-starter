# DO-NOT-EDIT. This file was auto-generated using github:vic/flake-file.
# Use `nix run .#write-flake` to regenerate it.
{

  outputs = inputs: import ./outputs.nix inputs;

  inputs = {
    devshell = {
      url = "github:numtide/devshell";
    };
    disko = {
      url = "github:nix-community/disko";
    };
    flake-aspects = {
      url = "github:vic/flake-aspects";
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
      url = "github:nixos/nixpkgs/nixpkgs-unstable";
    };
    secrets = {
      flake = false;
      url = "git+ssh://git@github.com/GianniBuoni/secrets.git?ref=main&shallow=1";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
    };
  };

}
