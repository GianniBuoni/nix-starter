{
  flake.aspects.boot.nixos = {pkgs, ...}: {
    i18n.defaultLocale = "en_US.UTF-8";

    console = {
      # vconsole set up earlier in the boot process to allow font change
      earlySetup = true;
      # increase size of console font
      font = "latarcyrheb-sun32";
    };

    boot = {
      kernelPackages = pkgs.linuxPackages_latest;
      loader.systemd-boot.enable = true;
      tmp.cleanOnBoot = true;
    };
  };
}
