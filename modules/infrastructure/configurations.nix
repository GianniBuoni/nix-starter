{
  lib,
  config,
  ...
}: {
  # map through nixosHost submodules to create configurations
  flake.nixosConfigurations =
    lib.mapAttrs config.flake.lib.mkNixosHost
    config.nixosHost;
}
