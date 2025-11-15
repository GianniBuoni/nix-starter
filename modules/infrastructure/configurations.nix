{
  lib,
  inputs,
  config,
  ...
}: {
  # map through nixosHost submodules to create configurations
  flake.nixosConfigurations =
    lib.mapAttrs inputs.self.lib.mkNixosHost
    config.nixosHost;
}
