{
  flake.aspects.jonnn.nixos = {
    config,
    pkgs,
    ...
  }: let
    jonnnPass = "hashed_passwords/jonnn";
  in {
    sops.secrets.${jonnnPass}.neededForUsers = true;
    users.mutableUsers = false;

    users.users.jonnn = {
      isNormalUser = true;
      hashedPasswordFile = config.sops.secrets.${jonnnPass}.path;
      extraGroups = ["wheel"];
      shell = pkgs.zsh;
    };
  };
}
