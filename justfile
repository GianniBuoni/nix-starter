write:
    git add .
    nix run .#write-flake

test:
    just write
    nix flake check

# untested
# install script assumes the target host is using a nixos installer
# and already has sops nix running via nixos or home manager
install hostname ip source:
    scp /run/secrets/luks_keys/$hostname /tmp/secret.key
    nix run github:nix-community/nixos-anywhere -- --flake $source#$hostname nixos@$ip
