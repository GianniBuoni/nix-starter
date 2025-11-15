write:
    git add .
    nix run .#write-flake

test:
    just write
    nix flake check
