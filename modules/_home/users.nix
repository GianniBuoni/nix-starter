{userSettings, ...}: {
  # Don't forget to change passwords after install
  # Home manager setup
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${userSettings.userName} = import ./home.nix;
    extraSpecialArgs = {inherit userSettings;};
    backupFileExtension = ".hm-bak";
  };
}
