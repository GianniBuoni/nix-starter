{
  inputs,
  config,
  lib,
  ...
}: {
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
            user-opts
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
