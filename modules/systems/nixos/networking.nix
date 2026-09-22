{
  flake.modules.nixos.networking = { config, pkgs, ... }: {
    networking.hostName = config.myHost.name;
    networking.networkmanager = {
      enable = true;
      wifi.backend = "iwd";
      plugins = [ pkgs.networkmanager-openconnect ];
    };
    networking.wireless.iwd.enable = true;
  };
}
