{
  flake.aspects.nixConfig.base = {
    nix = {
      settings.experimental-features = ["nix-command" "flakes"];
      optimise.automatic = true;
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
      };
    };
  };
}
