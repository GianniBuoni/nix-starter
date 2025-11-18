{
  inputs,
  lib,
  config,
  ...
}: {
  flake.lib.mkNixosHost = hostName: opts:
    inputs.nixpkgs.lib.nixosSystem {
      inherit (opts.hostData) system;
      specialArgs = {inherit inputs;};
      modules = [
        # per host options
        config.flake.modules.hosts.options
        {inherit (opts) hostData;}
        # override default hosthostName with submodule name
        {hostData.hostName = lib.mkForce hostName;}
        # import main host module
        config.flake.modules.nixos.${hostName}
        # import host specific overlays
        config.flake.modules.${hostName}.${hostName}
      ];
    };
}
