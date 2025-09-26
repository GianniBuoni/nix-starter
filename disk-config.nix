# this is a configuration for a single disk.
# the first partiton contains the unencrypted boot partition,
# the rest of the disk is encrypted and contains the logical volumes.
#
{systemSettings, ...}: {
  disko.devices = {
    # partition disks
    main = {
      type = "disk";
      inherit (systemSettings) device;
      content = {
        type = "gpt";
        partitions = {
          # define the boot partiton
          ESP = {
            size = "1G";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "fat32";
              mountpoint = "/boot";
              mountOptions = ["umask=0077"];
            };
          };
          # define luks partition
          luks = {
            size = "100%";
            content = {
              type = "luks";
              name = "crypted";
              settings = {
                # point disko to your keykeyFile
                keyFile = "/tmp/secret.key";
                allowDiscards = true;
              };
              content = {
                type = "lvm_pv";
                vg = "vg";
              };
            };
          };
        };
      };
    };
    # define volume group and logical volumes
    lvm_vg = {
      vg = {
        type = "lvm_vg";
        # define logical volumes
        lvs = {
          swap = {
            size = "4G";
            content = {
              type = "swap";
              discardPolicy = "both";
            };
          };
          root = {
            size = "32G";
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/";
            };
          };
          home = {
            size = "80%";
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/home";
            };
          };
        };
      };
    };
  };
}
