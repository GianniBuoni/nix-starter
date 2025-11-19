# function to make temporary directory
TEMP := shell('mktemp -d')
# location of age key on origin host
ORIGIN_AGE_KEY := "~/.config/sops/age/keys.txt"
# parent directory of target key
TARGET_AGE_DIR := TEMP + "/var/lib/sops-nix"
# location where sops-nix expects an age key to be
TARGET_AGE_KEY := TARGET_AGE_DIR + "/key.txt"
# location of a luks keyfile on origin host
ORIGIN_LUKS_KEY := "/run/secrets/luksKeys"
# location of the target host's luks key for installation
TARGET_LUKS_KEY := "/tmp/secret.key"

write:
    git add .
    nix run .#write-flake

test: write
    nix flake check

# install script assumes the target host is using a nixos installer and already has sops nix running via nixos or home manager
install hostname ip source:
    install -d {{TARGET_AGE_DIR}}
    cp {{ORIGIN_AGE_KEY}} {{TARGET_AGE_KEY}}

    nix run github:nix-community/nixos-anywhere -- \
        --disk-encryption-keys {{TARGET_LUKS_KEY}} "{{ORIGIN_LUKS_KEY}}/{{hostname}}" \
        --extra-files "{{TEMP}}" \
        --flake {{source}}#{{hostname}} \
        nixos@{{ip}}
