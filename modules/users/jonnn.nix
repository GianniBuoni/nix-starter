{
  # replace with mkUser function?
  flake.modules.nixos.user-jonnn = {
    config,
    pkgs,
    ...
  }: {
    userData = {
      userName = "jonnn";
    };

    users.users.${config.userData.userName} = {
      isNormalUser = true;
      initialPassword = "password";
      extraGroups = ["wheel"];
      shell = pkgs.zsh;
    };
  };
}
