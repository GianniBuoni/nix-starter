{config, ...}: {
  # default configs
  nixosHost.test-host = {
    stateVersion = "25.11";
    hostData = {
      hostName = "test-host";
      wirelessDevice = "wlan0";
    };
  };

  # add non-core features
  flake.modules.nixos.host-test-host = {
    imports = with config.flake.modules.nixos; [
      user-jonnn
      networking
    ];
  };
}
