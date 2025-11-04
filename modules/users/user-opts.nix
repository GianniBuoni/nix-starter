# Per-user options
{
  flake.modules.nixos.user-opts = {lib, ...}: {
    options.userData = with lib; {
      userName = mkOption {
        description = ''User's name'';
        type = types.str;
      };
    };
  };
}
