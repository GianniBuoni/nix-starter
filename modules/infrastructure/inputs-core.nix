{inputs, ...}: {
  flake-file.inputs = {
    flake-aspects.url = "github:vic/flake-aspects";
    flake-file.url = "github:vic/flake-file";
    import-tree.url = "github:vic/import-tree";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  imports = with inputs; [
    flake-file.flakeModules.nix-auto-follow
    flake-file.flakeModules.default
    flake-aspects.flakeModule
  ];
}
