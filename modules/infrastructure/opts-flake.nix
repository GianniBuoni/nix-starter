{
  lib,
  config,
  ...
}:
with lib; {
  options.nixosHost = mkOption {
    type = types.attrsOf (types.submodule config.flake.aspects.options.hosts);
  };
}
