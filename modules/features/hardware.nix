{
  flake.aspects.hardware = {
    nixos = {
      hardware.bluetooth.enable = true;
    };

    testHost = {
      hardware.enableRedistributableFirmware = true;
    };
  };
}
