{systemSettings, ...}: {
  networking = {
    inherit (systemSettings) hostName;
    useNetworkd = true;
    # use iwd for wireless network management
    wireless.iwd.enable = true;
  };

  # enable networkd for networking
  systemd.network = {
    enable = true;
    networks."25-wireless" = {
      matchConfig.Name = systemSettings.networkDevice;
      networkConfig = {
        DHCP = "yes";
        IgnoreCarrierLoss = "3s";
      };
    };
  };

  services = {
    # enable resolved for DNS resolution
    resolved.enable = true;
    # enable SSH
    # add more settings like trusted keys for remote rebulids
    openssh.enable = true;
  };
}
