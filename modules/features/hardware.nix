{
  flake.aspects.hardware = {
    nixos = {
      hardware.bluetooth.enable = true;
    };

    testHost = {pkgs, ...}: {
      hardware = {
        cpu.intel.updateMicrocode = true;
        firmware = with pkgs; [linux-firmware];
      };
    };
  };
}
