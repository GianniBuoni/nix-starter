{
  config,
  lib,
  ...
}: let
  hostName = "testHost";
in {
  nixosHost.${hostName}.hostData = {
    wirelessDevice = "wlp109s0";
    users = ["jonnn"];
  };

  flake.aspects = {aspects, ...}: {
    ${hostName} = {
      includes = with aspects; [
        required
        sops
        hardware
      ];

      nixos = let
        mkUsers = userName: config.flake.modules.nixos.${userName};
      in {
        imports =
          # import host specific modules
          [config.flake.modules.${hostName}.${hostName}]
          # import each nixos module from user aspects
          ++ lib.map mkUsers config.nixosHost.${hostName}.hostData.users;
      };

      # include host overlays in aspect
      ${hostName} = {};
    };
  };
}
