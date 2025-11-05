{
  #instantialize home manager config
  homeHost.jonnn = {
    stateVersion = "25.11";
  };

  # replace with mkUser function?
  flake.modules.nixos.user-jonnn = {
    config,
    pkgs,
    ...
  }: let
    userData = config.userData;
  in {
    users.users.${userData.userName} = {
      isNormalUser = true;
      initialPassword = "password";
      extraGroups = ["wheel"];
      shell = pkgs.zsh;
    };
  };
}
