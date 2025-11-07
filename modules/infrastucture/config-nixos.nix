{
  inputs,
  config,
  lib,
  ...
}: {
  flake.nixosConfigurations = let
    mkHost = hostname: opts:
      inputs.nixpkgs.lib.nixosSystem {
        # add to use inputs as nixosModules
        specialArgs.inputs = inputs;
        pkgs = import inputs.nixpkgs {
          inherit (opts) system;
          config.allowUnfree = true;
        };
        modules = with config.flake.modules.nixos;
          [
            boot
            global-pkgs
            networking
            nix-config
            opts-host
            opts-user
            {
              system = {inherit (opts) stateVersion;};
              inherit (opts) hostData;
            }
          ]
          ++ [
            config.flake.modules.nixos."host-${hostname}"
          ];
      };
  in
    lib.mapAttrs mkHost config.nixosHost;
}
