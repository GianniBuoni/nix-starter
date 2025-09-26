{systemSettings, ...}: {
  networking = {
    inherit (systemSettings) hostName;
    useNetworkd = true;
    # use iwd for wireless network management
    wireless.iwd = {
      enable = true;
      settings = {
        Network = {EnableIPv6 = true;};
        Settings = {
          AutoConnect = true;
        };
      };
    };
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
    resolved = {
      enable = true;
      # extra settings for authenticity and encryption
      dnssec = "true";
      dnsovertls = "true";
    };
    # enable SSH
    openssh = {
      enable = true;
    };
  };
}
