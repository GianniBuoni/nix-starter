# Per host varaible options
{
  flake.modules.nixos.host-opts = {lib, ...}:
    with lib; {
      options.hostData = {
        hostName = mkOption {
          description = ''Host's hostname; should match nixosHost submodule'';
          type = types.str;
        };
        wirelessDevice = mkOption {
          description = ''Host's wireless network device i.e. wlan0'';
          type = types.str;
          default = "";
        };
      };
    };
}
