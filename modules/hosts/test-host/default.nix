{config, ...}: {
  # default configs
  nixosHost.test-host = {};

  # add non-core features
  flake.modules.nixos.host-test-host.imports = with config.flake.modules.nixos; [
    user-opts
    user-jonnn # turn in a flake host option?
    networking
  ];
}
