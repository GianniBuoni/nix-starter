# Per host varaible options that exist on the host-level.
# Optionn defined on the flake level and then passed down
# to the host in `config-nixos`
{
  flake.modules.nixos.opts-host = {lib, ...}: {
    options.hostData = with lib; {
      # required settings
      hostName = mkOption {
        description = ''Host's hostname; should match nixosHost submodule'';
        type = types.str;
      };
      # optional settings
      wirelessDevice = mkOption {
        description = ''Host's wireless network device i.e. wlan0'';
        type = types.str;
        default = "";
      };
      users = mkOption {
        description = ''List of users on the host'';
        type = listOf types.str;
        default = [];
      };
    };
  };
}
