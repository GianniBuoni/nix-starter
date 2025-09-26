{userSettings, ...}: {
  # Don't forget to change passwords after install
  users.users.${userSettings.userName} = {
    inherit (userSettings) description;
    isNormalUser = true;
    initialPassword = "password";
    extraGroups = ["wheel"];
  };
}
