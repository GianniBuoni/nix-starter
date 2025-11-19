{
  flake.aspects.hardware = {
    nixos = {
      hardware.bluetooth.enable = true;
    };
    testHost.hardware = {
      cpu.intel.updateMicrocode = true;
      enableAllFirmware = true;
    };
  };
}
