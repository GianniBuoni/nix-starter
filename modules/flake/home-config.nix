{
  inputs,
  config,
  lib,
  ...
}: {
  flake.homeConfigurations = let
    mkHost = userName: opts:
      inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = config.nixpkgs {
          inherit (opts) system;
        };
        extraSpecialArgs = inputs;
        modules = with config.flake.modules.homeManager; [
          home
        ];
      };
  in
    lib.mapAttrs mkHost config.homeHost;
}
