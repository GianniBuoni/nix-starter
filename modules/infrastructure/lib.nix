{
  inputs,
  lib,
  ...
}: {
  flake.lib.mkNixosHost = hostName: opts:
    inputs.nixpkgs.lib.nixosSystem {
      inherit (opts.hostData) system;
      specialArgs = {inherit inputs;};
      modules = [
        # per host options
        inputs.self.aspects.options.hosts
        {inherit (opts) hostData;}
        # override default hosthostName with submodule name
        {hostData.hostName = lib.mkForce hostName;}
      ];
    };
}
