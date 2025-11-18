{
  nixosHost.testHost.hostData = {
    wirelessDevice = "wlp109s0";
    users = ["jonnn"];
  };

  flake.aspects = {aspects, ...}: {
    testHost = {
      includes = with aspects; [
        required
        hardware
        sops
      ];

      nixos = {};
      testHost = {};
    };
  };
}
