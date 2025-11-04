{modulesPath, ...}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ./disk-config
    ./boot.nix
    ./networking.nix
    ./users.nix
    ./packages.nix
  ];

  # NIX SETTINGS
  nix = {
    settings.experimental-features = ["nix-command" "flakes"];
    optimise.automatic = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  system.stateVersion = "25.05";
}
