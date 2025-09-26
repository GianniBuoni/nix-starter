# this is a configuration for a single disk.
# the first partiton contains the unencrypted boot partition,
# the rest of the disk is encrypted and contains the logical volumes.
#
{systemSettings, ...}: let
  inherit (import ./config-sets.nix) ESP luks vg;
in {
  disko.devices = {
    # partition disks
    disk = {
      main = {
        type = "disk";
        inherit (systemSettings) device;
        content = {
          type = "gpt";
          partitions = {
            inherit ESP luks;
          };
        };
      };
    };
    # define volume group and logical volumes
    lvm_vg = {
      inherit vg;
    };
  };
}
