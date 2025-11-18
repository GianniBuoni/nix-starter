# Per host varaible options that exist on the host-level.
# Optionn defined on the flake level and then passed down
# to the host in `config-nixos`
{
  flake.aspects.options.hosts = {lib, ...}: {
    options.hostData = with lib; {
      # required settings
      hostName = mkOption {
        description = ''Host's hostname; should match nixosHost submodule'';
        type = types.str;
        default = "nixos-host";
      };
      system = mkOption {
        description = ''Host's hostPlatform'';
        type = types.str;
        default = "x86_64-linux";
      };
      stateVersion = mkOption {
        description = ''Host's original nixos version'';
        type = types.str;
        default = "25.11";
      };
      # optional settings
      wirelessDevice = mkOption {
        description = ''Host's wireless network device i.e. wlan0'';
        type = types.str;
        default = "";
      };
    };
  };
}
