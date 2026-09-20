{ inputs, config, ... }: {
  flake-file.inputs.stylix = {
    url = "github:nix-community/stylix/release-${config.nixpkgsStable}";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  flake.modules.homeManager.stylix = {
    programs.firefox = {
      enable = true;
      profiles.my-profile = { };
    };

    stylix.targets.firefox.profileNames = [ "my-profile" ];
  };

  flake.modules.nixos.stylix =
    { lib, pkgs, ... }:
    let
      porsche911-image = pkgs.fetchurl {
        url = "https://w.wallhaven.cc/full/8x/wallhaven-8x95oy.png";
        name = "porsche911-wallpaper.png";
        hash = "sha256-NkM4Q4sXKWjUqak9bRu9K2ijL1OptQHLoVdzV7n0bmo=";
      };

      solid-tokyonight =
        pkgs.runCommand "solid-tokyonight.png"
          {
            nativeBuildInputs = [ pkgs.imagemagick ];
          }
          ''
            magick -size 3440x1440 xc:"#1a1b26" "$out"
          '';
      radial-tokyonight =
        pkgs.runCommand "radial-tokyonight.png"
          {
            nativeBuildInputs = [ pkgs.imagemagick ];
          }
          ''
            magick -size 3440x1440 radial-gradient:"#1f2131-#151620" "$out"
          '';
    in
    {
      imports = [ inputs.stylix.nixosModules.stylix ];
      stylix = {
        enable = true;
        icons = {
          enable = true;
          dark = "Paprius-Dark";
          light = "Papirus-Light";
          package = pkgs.papirus-icon-theme;
        };
        cursor = {
          package = pkgs.bibata-cursors;
          size = 24;
          name = "Bibata-Modern-Ice";
        };
        polarity = "dark";
        base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
        image = radial-tokyonight;
        targets = {
          kmscon = {
            enable = false;
            colors.enable = false;
            fonts.enable = false;
          };
          nixvim = {
            enable = false;
          };
        };
      };
    };
}
