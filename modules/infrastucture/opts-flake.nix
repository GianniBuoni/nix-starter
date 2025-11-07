{
  lib,
  config,
  ...
}: let
  inherit (lib) types mkOption mergeAttrsList;
in {
  # option declarations for both nixosHosts and homeManagerHosts
  options = let
    baseHostModule.options = {
      system = mkOption {
        description = ''Host's hostPlatform'';
        type = types.str;
        default = "x86_64-linux";
      };
      stateVersion = mkOption {
        description = ''Host's initial nixos version'';
        type = types.str;
      };
    };
    # merge options defined for the host level
    nixosAttrs = types.submodule (mergeAttrsList [
      baseHostModule
      config.flake.modules.nixos.opts-host
    ]);
  in {
    nixosHost = mkOption {
      type = types.attrsOf nixosAttrs;
    };
  };
}
