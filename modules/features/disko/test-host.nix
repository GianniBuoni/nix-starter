{config, ...}: let
  #  function to define ext4 partition
  mkExt4 = size: mountpoint: {
    inherit size;
    content = {
      inherit mountpoint;
      type = "filesystem";
      format = "ext4";
    };
  };
  key = "hosts/test_host/luks_key";
in {
  flake.modules.nixos.disko-test-host = {
    imports = [config.flake.modules.nixos.disko];

    sops.secrets.${key} = {};

    disko.devices.disk.ssd = let
      # define the boot partiton
      ESP = {
        size = "1G";
        type = "EF00";
        content = {
          type = "filesystem";
          format = "vfat";
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
          passwordFile = config.sops.secrets.${key}.path;
          settings.allowDiscards = true;
          content = {
            type = "lvm_pv";
            vg = "vg";
          };
        };
      };
    in {
      type = "disk";
      device = "/dev/nvme0n1";
      content = {
        type = "gpt";
        partitions = {
          inherit ESP luks;
        };
      };
    };

    # define logical volumes
    disko.devices.lvm_vg.vg = {
      type = "lvm_vg";
      lvs = {
        swap = {
          size = "4G";
          content = {
            type = "swap";
            discardPolicy = "both";
          };
        };
        root = mkExt4 "32G" "/";
        home = mkExt4 "80%" "/home";
      };
    };
  };
}
