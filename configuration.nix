{
  modulesPath,
  pkgs,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ./disk-config.nix
  ];

  # GRUB BOOT
  boot.loader = {
    grub = {
      devices = ["nodev"];
      efiSupport = true;
    };
    efi.canTouchEfiVariables = true;
  };

  # NETWORKING AND SSH
  networking.networkmanager.enable = true;
  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "yes";
  };

  # PACKAGES
  environment.systemPackages = with pkgs; [
    curl
    git
    gh
    neovim
    docker
  ];

  # DOCKER
  virtualisation.docker.enable = true;

  # USER
  # Don't forget to change passwords after install
  users.users.admin = {
    isNormalUser = true;
    description = "Admin Account";
    initialPassword = "password";
    extraGroups = ["networkmanager" "wheel"];
  };

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

  system.stateVersion = "24.05";
}
