top @ {...}: let
  userName = "jonnn";
in {
  flake.aspects = {aspects, ...}: {
    ${userName} = {
      # user specific modules
      includes = with aspects; [
        publicSshKeys
      ];

      ${userName} = {};

      nixos = {
        config,
        pkgs,
        ...
      }: let
        passKey = "hashedPasswords/${userName}";
      in {
        # import user specific modules
        imports = [top.config.flake.modules.${userName}.${userName}];

        sops.secrets.${passKey}.neededForUsers = true;
        users.mutableUsers = false;

        users.users.${userName} = {
          isNormalUser = true;
          hashedPasswordFile = config.sops.secrets.${passKey}.path;
          extraGroups = ["wheel" "networkmanager"];
          shell = pkgs.zsh;
        };
      };
    };
  };
}
