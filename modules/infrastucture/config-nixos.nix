{
  inputs,
  config,
  lib,
  ...
}: {
  flake.nixosConfigurations = let
    mkUsers = user: config.flake.modules.nixos."user-${user}";
    mkHost = hostname: opts:
      inputs.nixpkgs.lib.nixosSystem {
        pkgs = import inputs.nixpkgs {
          inherit (opts) system;
          config.allowUnfree = true;
        };
        specialArgs.inputs = inputs;
        modules = with config.flake.modules.nixos;
          [
            # import basic modules
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
            # auto import host modules
            config.flake.modules.nixos."host-${hostname}"
          ]
          # auto import user modules
          ++ lib.map mkUsers opts.hostData.users;
      };
  in
    lib.mapAttrs mkHost config.nixosHost;
}
