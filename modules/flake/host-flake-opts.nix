{lib, ...}: let
  inherit (lib) types mkOption;
in {
  # option declarations for both nixosHosts and homeManagerHosts
  options = let
    baseHostModule.options = {
      system = mkOption {
        description = ''Host's hostPlatform'';
        type = types.str;
        default = "x86_64-linux";
      };
    };
    baseHostAttrs = types.submodule [baseHostModule];
  in {
    nixosHost = mkOption {
      type = types.attrsOf baseHostAttrs;
    };
    homeHost = mkOption {
      type = types.attrsOf baseHostAttrs;
    };
  };
}
