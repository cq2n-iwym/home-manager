{
  # Choose one of
  # * nixos
  # * nixos-virtualbox
  # * nix-package-manager
  type = "nix-package-manager";

  # required
  user =
    {
      name = "cq2n-iwym";
      hashedPassword = "$6$0VTZ2.H/6uC/TqaV$jon2WkKJZSmKJJyHgi6QlZWkr7dQ1F0rRlXVno48hxkco5ofY.FzeNnj6qBcDBjDjaK0qbxRz2sjR8OEF2mis/";
      home = {
        username = "cq2n-iwym";
        homeDirectory = "/home/cq2n-iwym";
      };
      git = {
        userName = "cq2n-iwym";
        userEmail = "naoki.iwayama@asahi-net.com";
      };
      browser = "firefox";
      terminal = "konsole";
    };

  extraConfig = { ... }: {
  };
}
