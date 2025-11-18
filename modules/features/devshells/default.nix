{
  inputs,
  moduleWithSystem,
  config,
  ...
}: {
  flake-file.inputs.devshell.url = "github:numtide/devshell";
  imports = [inputs.devshell.flakeModule];

  flake.aspects.devShells.base = moduleWithSystem ({pkgs, ...}: {
    packages = with pkgs; [just];
    commands = [
      {
        help = "Test development environment.";
        name = "enterTest";
        command = ''just -V'';
      }
    ];
  });

  perSystem.devshells = with config.flake.aspects.devShells; {
    default.imports = [base];
  };
}
