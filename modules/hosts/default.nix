{inputs, ...}: {
  flake.nixosConfigurations.gary-too = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    # add to use inputs as nixosModules
    specialArgs.inputs = inputs;
    modules = with inputs.self.modules.nixos; [nix-config boot test-host];
  };
}
