{
  inputs,
  config,
  lib,
  ...
}: let
  inherit (lib) types mkOption mapAttrs;
in {
  # option declarations for hostData
  options.nixosHost = let
    nixosHostAttrs = types.submodule {
      options = {
        system = mkOption {
          description = ''Host's hostPlatform'';
          type = types.str;
          default = "x86_64-linux";
        };
      };
    };
  in
    mkOption {
      type = types.attrsOf nixosHostAttrs;
    };

  # use option declaration to configure nixos host
  config = {
    flake.nixosConfigurations = let
      mkHost = hostname: opts:
        inputs.nixpkgs.lib.nixosSystem {
          inherit (opts) system;
          # add to use inputs as nixosModules
          specialArgs.inputs = inputs;
          modules = with config.flake.modules.nixos;
            [
              boot
              global-pkgs
              host-opts
              nix-config
            ]
            ++ [
              config.flake.modules.nixos."host-${hostname}"
            ];
        };
    in
      mapAttrs mkHost config.nixosHost;
  };
}
