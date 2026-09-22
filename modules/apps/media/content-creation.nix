{
  flake.modules.homeManager.audio-record = { pkgs, ... }: {
    home.packages = [
      pkgs.audacity
    ];
  };

  flake.modules.homeManager.video-editing = { pkgs, ... }: {
    home.packages = [
      pkgs.kdePackages.kdenlive
      pkgs.ffmpeg-full
    ];
  };

  flake.modules.homeManager.speech-tools =
    { pkgs, config, ... }:
    let
      srt_equalizer = pkgs.python3Packages.buildPythonPackage rec {
        pname = "srt_equalizer";
        version = "0.1.10";
        pyproject = true;

        src = pkgs.fetchPypi {
          inherit pname version;
          sha256 = "sha256-X2sbLEixK7HKqxOCLX3dClSod3K4JKCqK6ZMAz03k1M=";
        };
        doCheck = false;
        nativeBuildInputs = [
          pkgs.python3Packages.poetry-core
        ];
        propagatedBuildInputs = [
          pkgs.python3Packages.srt
        ];
      };
    in
    {
      home.packages = with pkgs; [
        (python3.withPackages (
          python-pkgs: with python-pkgs; [
            pip
            openai-whisper
            srt
            srt_equalizer
            torch
          ]
        ))
      ];
    };

  flake.modules.homeManager.screen-recording = { pkgs, ... }: {
    home.packages = [
      pkgs.obs-studio
      pkgs.mpv
    ];
  };
}
