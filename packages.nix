{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    curl
    git
    gh
    helix
    docker
    docker-compose
    pstree
    fastfetch
  ];

  virtualisation.docker.enable = true;
}
