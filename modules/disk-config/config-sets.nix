let
  mkExt4 = size: mountpoint: {
    inherit size;
    content = {
      inherit mountpoint;
      type = "filesystem";
      format = "ext4";
    };
  };
in {
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
      # interactive login
      passwordFile = "/tmp/secret.key";
      # point disko to your keykeyFile
      settings.allowDiscards = true;
      content = {
        type = "lvm_pv";
        vg = "vg";
      };
    };
  };
  # define volume group
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
      root = mkExt4 "32G" "/";
      home = mkExt4 "80%" "/home";
    };
  };
}
