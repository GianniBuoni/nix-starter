{
  inputs,
  lib,
  config,
  ...
}: {
  flake.lib = {
    # function to define nixos host
    mkNixosHost = hostName: opts:
      inputs.nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        pkgs = import inputs.nixpkgs {
          inherit (opts.hostData) system;
          config.allowUnfree = true;
        };
        modules = [
          # set stateVerison
          {system = {inherit (opts.hostData) stateVersion;};}
          # per host options
          config.flake.modules.hosts.options
          {inherit (opts) hostData;}
          # override default hosthostName with submodule name
          {hostData.hostName = lib.mkForce hostName;}
          # import main host module
          config.flake.modules.nixos.${hostName}
        ];
      };
    # function to define ext4 partition in disko
    mkExt4 = size: mountpoint: {
      inherit size;
      content = {
        inherit mountpoint;
        type = "filesystem";
        format = "ext4";
      };
    };
  };
}
