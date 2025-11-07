{config, ...}: {
  # default configs
  nixosHost.test-host = {
    stateVersion = "25.11";
    hostData = {
      hostName = "test-host";
      wirelessDevice = "wlp109s0";
    };
  };

  # add non-core features
  flake.modules.nixos.host-test-host = {
    imports = with config.flake.modules.nixos; [
      disko-test-host
      redistributable-firmware
      user-jonnn
    ];
  };
}
