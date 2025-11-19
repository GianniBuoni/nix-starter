{
  flake.aspects.nixConfig.nixos = {config, ...}: {
    nix = {
      settings.experimental-features = ["nix-command" "flakes"];
      settings.trusted-users = [
        (builtins.toString (builtins.elemAt config.hostData.users 0))
      ];
      optimise.automatic = true;
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
      };
    };
  };
}
