{
  flake.modules.homeManager.latex = { pkgs, ... }: {
    home.packages = [
      (pkgs.texliveMedium.withPackages (
        ps: with ps; [
          standalone
          varwidth
          dvisvgm
          mylatexformat
        ]
      ))
    ];
  };
}
