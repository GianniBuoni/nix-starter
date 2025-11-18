let
  hostName = "testHost";
in {
  nixosHost.${hostName}.hostData = {
    wirelessDevice = "wlp109s0";
  };

  flake.aspects = {aspects, ...}: {
    ${hostName} = {
      includes = with aspects; [
        required
        hardware
        sops
      ];

      nixos = {};
      ${hostName} = {};
    };
  };
}
