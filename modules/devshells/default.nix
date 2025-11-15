{
  inputs,
  moduleWithSystem,
  config,
  ...
}: {
  flake-file.inputs = {
    devenv.url = "github:cachix/devenv";
    nix2container.url = "github:nlewo/nix2container";
    mk-shell-bin.url = "github:rrbutani/nix-mk-shell-bin";
  };
  imports = [inputs.devenv.flakeModule];

  flake.aspects.devShells.base = moduleWithSystem ({pkgs, ...}: {
    packages = with pkgs; [just];
    enterTest = ''just -V'';
  });

  perSystem.devenv.shells = with config.flake.aspects.devShells; {
    default.imports = [base];
  };
}
