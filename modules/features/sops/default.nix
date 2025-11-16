{inputs, ...}: let
  secretsPath = builtins.toString inputs.secrets;
in {
  flake-file.inputs = {
    sops-nix.url = "github:Mic92/sops-nix";
    secrets = {
      url = "git+ssh://git@github.com/GianniBuoni/secrets.git?ref=main&shallow=1";
      flake = false;
    };
  };

  flake.aspects.sops = {
    imports = [inputs.sops-nix.nixosModules.sops];

    sops = {
      defaultSopsFile = "${secretsPath}/secrets.yaml";
      validateSopsFiles = false;

      age = {
        sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];
        keyFile = "/var/lib/sops-nix/key.txt";
        generateKey = true;
      };
    };
  };
}
