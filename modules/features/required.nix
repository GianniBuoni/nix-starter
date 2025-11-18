# The required aspect handles any part of a "class" that it needs to
# boot, use a tty, and connect to the intenet
{
  flake.aspects = {aspects, ...}: {
    required.includes = with aspects; [
      boot
      disko
      networking
      nixConfig
      systemPackages
      users
    ];
  };
}
