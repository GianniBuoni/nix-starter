{
  flake.aspects.systemPackages.base = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      curl
      fastfetch
      git
      gh
      helix
      lshw
      pstree
      pciutils
    ];

    programs.zsh.enable = true;
    programs.zsh.autosuggestions.enable = true;
  };
}
