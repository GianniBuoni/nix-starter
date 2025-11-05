{
  flake.modules.homeManager.home = {
    config,
    inputs,
    ...
  }: let
    userData = config.userData;
  in {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = ".hm-bak";
    };
    home = {
      username = userData.userName;
      homeDirectory = "/home/${userData.userName}";
    };
    programs.home-manager.enable = true;
  };
}
