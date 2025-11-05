{config, ...}: {
  # default configs
  nixosHost.test-host = {};

  # add non-core features
  flake.modules.nixos.host-test-host = {
    imports = with config.flake.modules.nixos; [
      user-jonnn
      networking
    ];
  };
}
