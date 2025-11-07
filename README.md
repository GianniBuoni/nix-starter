# NixOS Starter Config

Starter nixos-config using `disko` and `nixos-anywhere` to set up a basic system with disk encryption and logical volumes.

## Prerequisites

- Target system booted into a live ISO
- (Optional but recomended) `ssh` from a working machine into the target system.

## Install using nixos-anywhere

```sh
nix run github:nix-community/nixos-anywhere -- --flake <FLAKE_URL> nixos@<IP_ADDRESS>
```

## Remote rebuilding

```sh
nixos-rebuild switch --flake <FLAKE_URL> --target-host "<USER>@<IP_ADDRESS>" --ask-sudo
```

## Links:

- [nixos-anywhere](https://github.com/nix-community/nixos-anywhere/blob/main/docs/quickstart.md)
