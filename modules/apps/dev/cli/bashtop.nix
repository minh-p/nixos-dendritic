{
  flake.modules.nixos.bashtop = { pkgs, ... }: {
    environment.systemPackages = [ pkgs.btop ];
  };
}
