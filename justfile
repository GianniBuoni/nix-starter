write:
    git add .
    nix run .#write-flake

test:
    git add .
    nix flake check
