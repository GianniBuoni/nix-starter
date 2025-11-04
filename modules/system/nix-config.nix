{
  flake.modules.nixos.nix-config = {
    nix = {
      settings.experimental-features = ["nix-command" "flakes"];
      optimise.automatic = true;
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
      };
    };
    system.stateVersion = "25.11";
  };
}
