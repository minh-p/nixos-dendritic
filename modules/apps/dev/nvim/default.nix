# { inputs, config, ... }: {
#   flake-file.inputs.nixvim.url = "github:nix-community/nixvim/nixos-${config.nixpkgsStable}";
#   flake.modules.nixos.nvim = {
#     imports = [ inputs.nixvim.nixosModules.nixvim ];
#     programs.neovim = {
#       defaultEditor = true;
#     };
#     programs.nixvim = {
#       enable = true;
#       colorschemes.gruvbox.enable = true;
#       opts = {
#         number = true;
#         relativenumber = true;
#         shiftwidth = 4;
#       };
#     };
#   };
# }

{
  inputs,
  ...
}:
{
  flake-file.inputs = {
    nvim-config = {
      url = "github:wlm-iii/nvim-config";
      flake = false;
    };
  };

  flake.modules.homeManager.nvim = 
  {
    pkgs,
    ...
  }:
  {
    programs.neovim = {
      enable = true;
      defaultEditor = false;
      withPython3 = false;
      withRuby = false;
    };

    home.packages = with pkgs; [
      tree-sitter
      lua-language-server
      nil
      ripgrep
      fzf
      gcc
      clang-tools
      fd
      pyright
      tinymist
      gnumake
      websocat
    ];
    
    xdg.configFile.nvim.source = inputs.nvim-config;
  };
}
