{
  flake.modules.nixos.global-pkgs = {pkgs, ...}: {
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

    programs.zsh = {
      enable = true;
      autosuggestions.enable = true;
    };
  };
}
