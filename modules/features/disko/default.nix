{inputs, ...}: {
  flake-file.inputs.disko.url = "github:nix-community/disko";
  flake.aspects.disko.nixos.imports = [inputs.disko.nixosModules.disko];
}
