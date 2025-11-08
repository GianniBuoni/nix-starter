{
  # replace with mkUser function?
  flake.modules.nixos.user-jonnn = {
    config,
    pkgs,
    ...
  }: let
    userName = "jonnn";
    key = "users.${userName}.hashed_password";
  in {
    userData = {
      inherit userName;
    };

    sops.secrets.${key}.neededForUsers = true;

    users.mutableUsers = false;

    users.users.${userName} = {
      isNormalUser = true;
      extraGroups = ["wheel"];
      hashedPasswordFile = config.sops.secrets.${key}.path;
      shell = pkgs.zsh;
    };
  };
}
