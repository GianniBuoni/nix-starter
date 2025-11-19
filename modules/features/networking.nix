{
  flake.aspects.networking.nixos = {config, ...}: let
    inherit (config) hostData;
  in {
    sops.secrets."wifi.env" = {};

    networking = {
      inherit (hostData) hostName;
      networkmanager = {
        enable = true;
        ensureProfiles = {
          environmentFiles = [config.sops.secrets."wifi.env".path];
          profiles.home-wifi = {
            connection = {
              id = "home-wifi";
              type = "wifi";
            };
            wifi.ssid = "$HOME_WIFI_SSID";
            wifi-security = {
              key-mgmt = "wpa-psk";
              psk = "$HOME_WIFI_PSK";
            };
          };
        };
      };
    };
  };
}
