let
  dev-machine = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDbNe1fwEsVI9zMFX+0tPB+mHbc4VzrnGE/t9MrwDsoq";
in {
  flake.aspects.ssh.nixos.services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  flake.aspects.publicSshKeys.jonnn = {
    users.users.jonnn = {
      openssh.authorizedKeys.keys = [dev-machine];
    };
  };
}
