{
  flake.modules.nixos.redistributable-firmware = {
    hardware.enableRedistributableFirmware = true;
  };
}
