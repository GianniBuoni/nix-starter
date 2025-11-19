temp := shell('mktemp -d')

write:
    git add .
    nix run .#write-flake

test: write
    nix flake check

# untested
# install script assumes the target host is using a nixos installer and already has sops nix running via nixos or home manager
install hostname ip source:
    install -d "{{temp}}/var/lib/sops-nix"
    cp ~/.config/sops/age/keys.txt "{{temp}}/var/lib/sops-nix/key.txt"

    sudo nix run github:nix-community/nixos-anywhere -- \
        --disk-encryption-keys /tmp/secret.key  /run/secrets/luksKeys/{{hostname}} \
        --extra-files "{{temp}}" \
        --flake {{source}}#{{hostname}} \
        nixos@{{ip}}
