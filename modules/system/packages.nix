{
  flake.modules.nixos.global-pkgs = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      curl
      git
      gh
      helix
      pstree
      fastfetch
    ];

    programs.zsh = {
      enable = true;
      autosuggestions.enable = true;
    };
  };
}
