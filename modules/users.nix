{
  pkgs,
  userSettings,
  ...
}: {
  # Don't forget to change passwords after install
  users.users.${userSettings.userName} = {
    inherit (userSettings) description;
    isNormalUser = true;
    initialPassword = "password";
    extraGroups = ["wheel"];
    shell = pkgs.zsh;
  };
  # Home manager setup
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${userSettings.userName} = import ./home.nix;
    extraSpecialArgs = {inherit userSettings;};
  };
}
