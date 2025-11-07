# Inputs core to the flake's infrastucture
{inputs, ...}: {
  imports = with inputs; [
    flake-parts.flakeModules.modules
    flake-file.flakeModules.default
    flake-file.flakeModules.nix-auto-follow
  ];
  flake-file = {
    description = "GianniBuoni's nix configuration";
    inputs = {
      nixpkgs.url = "github:NixOs/nixpkgs?ref=nixos-unstable";
      flake-parts.url = "github:hercules-ci/flake-parts";
      flake-file.url = "github:vic/flake-file";
      import-tree.url = "github:vic/import-tree";
    };
  };
}
