{ inputs, self, ... }: {
  systems = [ "x86_64-linux" ];
  nixpkgsStable = "26.05";

  flake.modules.nixos.Noah = { pkgs, ... }: {
    nixpkgs.hostPlatform = "x86_64-linux";
    system.stateVersion = "24.05";
    time.timeZone = "America/Los_Angeles";

    myHost = {
      name = "Noah";
      diskLabels = {
        root = "NIXBOOT";
        swap = "NIXSWAP";
        home = "NIXHOME";
        boot = "NIXROOT";
      };
      vendors = {
        cpu = "amd";
        gpu = "amd";
      };
      extraBootKernModules = [ "uinput" ];
      peripherals = {
        touchpad = true;
        fingerprint = {
          enable = true;
          driver = pkgs.libfprint-2-tod1-goodix-550a;
        };
        displays = [
          {
            name = "eDP-1";
          }
          # {
          #   name = "HDMI-A-1";
          #   rotation = 270;
          #   position = {
          #     x = 3440;
          #     y = 0;
          #   };
          # }
        ];
      };
    };

    imports = with self.modules.nixos; [
      options
      nix-settings
      nixpkgs-unstable
      git

      hardware
      fileSystems
      grub
      silentboot
      networking
      fingerprint
      audio
      printing

      greetd
      stylix
      fonts
      fcitx5
      thunar

      firefox
      nvim
      emacs

      gpu-screen-recorder

      niri
      home-manager
      hmp
      flatpak
      studying
      tailscale
      bashtop
      zoom-us
    ];
  };

  flake.nixosConfigurations.Noah = inputs.nixpkgs.lib.nixosSystem {
    modules = [ self.modules.nixos.Noah ];
  };
}
