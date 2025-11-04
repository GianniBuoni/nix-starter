{
  flake.modules.nixos.host-test-host.hostData = {
    hostName = "test-host";
    wirelessDevice = "wlan0";
  };
}
