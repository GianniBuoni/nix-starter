# Per-user options
{
  flake.modules.nixos.opts-user = {lib, ...}: {
    options.userData = with lib; {
      userName = mkOption {
        description = ''User's name'';
        type = types.str;
      };
    };
  };
}
