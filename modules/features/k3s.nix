{
  # testHost is a single node custer
  flake.aspects.k3s.testHost = {
    networking.firewall = {
      allowedTCPPorts = [6443];
      allowedUDPPorts = [8472];
    };
    services.k3s = {
      enable = true;
      role = "server";
      extraFlags = toString ["--disable-helm-controller"];
    };
  };
}
