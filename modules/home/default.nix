{
  flake.modules.homeManager.home = {
    config,
    inputs,
    ...
  }: let
    userData = config.userData;
    hostData = config.hostData;
  in {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = ".hm-bak";
    };
    home = {
      username = userData.userName;
      homeDirectory = "/home/${userData.userName}";
      inherit (hostData) stateVersion;
    };
    programs.home-manager.enable = true;
  };
}
