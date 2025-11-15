{inputs, ...}: {
  flake.lib.mkNixosHost = hostname: opts: {
    flake.nixosConfiguration.test-host = inputs.nixpkgs.lib.nixosSystem {
      system = opts.system;
      specialArgs = {inherit inputs;};
      modules = [inputs.self.modules.nixos.${hostname}];
    };
  };
}
