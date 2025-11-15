{
  lib,
  config,
  ...
}:
with lib; {
  options.nixostHost = mkOption {
    type = types.attrsOf (types.submodule config.flake.aspects.options.host);
  };
}
