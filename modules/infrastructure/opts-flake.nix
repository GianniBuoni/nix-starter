{
  lib,
  config,
  ...
}:
with lib; {
  options.nixostHost = mkOption {
    type = attrsOf config.flake.aspects.options.host;
  };
}
