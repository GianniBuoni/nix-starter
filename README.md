# NixOS Starter Config!

This is a basic starter config for a new NixOS system. It utilizes `nixos-anywhere` and `disko` to create a barebones install of NixOS.

#### Useful Commands:

```
nix run github:nix-community/nixos-anywhere -- --flake '.#myconfig' nixos@<ip_address>
```

```
ssh-keygen -R <ip_address>
```

```
nixos-rebuild switch --flake <URL to your flake> --target-host "root@<ip address>"
```

#### Useful Resources:

- [nixos-anywhere](https://github.com/nix-community/nixos-anywhere/blob/main/docs/quickstart.md)
