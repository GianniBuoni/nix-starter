{
  nixosHost.testHost.hostData = {
    wirelessDevice = "wlp109s0";
    users = ["jonnn"];
  };

  flake.aspects = {aspects, ...}: {
    testHost = {
      includes = with aspects; [
        boot
        disko
        hardware
        networking
        nixConfig
        sops
        systemPackages
      ];

      nixos = {};
      testHost = {};
    };
  };
}
