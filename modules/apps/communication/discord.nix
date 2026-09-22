{
  flake.modules.homeManager.vencord = { pkgs, ... }: {
    xdg.configFile."vesktop/themes/tokyonight.theme.css".text = ''
      /**
       * @name Tokyo Night
       * @description Tokyo Night theme for Vesktop/Vencord
       * @version 1.0.0
       */

      :root {
        --tn-bg:      #1a1b26;
        --tn-bg-dark: #16161e;
        --tn-panel:   #24283b;
        --tn-panel-hi:#292e42;
        --tn-border:  #414868;

        --tn-fg:      #c0caf5;
        --tn-fg-dim:  #a9b1d6;
        --tn-comment: #565f89;

        --tn-blue:    #7aa2f7;
        --tn-cyan:    #7dcfff;
        --tn-purple:  #bb9af7;
        --tn-green:   #9ece6a;
        --tn-yellow:  #e0af68;
        --tn-red:     #f7768e;
      }

      .theme-dark,
      .theme-midnight {
        /* Modern Discord backgrounds */
        --background-base-lowest: var(--tn-bg-dark) !important;
        --background-base-lower:  var(--tn-bg) !important;
        --background-base-low:    var(--tn-panel) !important;

        --background-surface-low:     var(--tn-bg) !important;
        --background-surface-lower:   var(--tn-bg-dark) !important;
        --background-surface-high:    var(--tn-panel) !important;
        --background-surface-higher:  var(--tn-panel-hi) !important;
        --background-surface-highest: var(--tn-border) !important;

        /* Compatibility */
        --background-primary:       var(--tn-bg) !important;
        --background-secondary:     var(--tn-bg-dark) !important;
        --background-secondary-alt: var(--tn-panel) !important;
        --background-tertiary:      var(--tn-bg-dark) !important;
        --background-floating:      var(--tn-panel) !important;

        --channeltextarea-background: var(--tn-panel) !important;

        /* Text */
        --text-normal: var(--tn-fg) !important;
        --text-muted: var(--tn-fg-dim) !important;
        --text-link: var(--tn-cyan) !important;

        --interactive-normal: var(--tn-fg-dim) !important;
        --interactive-hover: var(--tn-fg) !important;
        --interactive-active: var(--tn-blue) !important;
        --interactive-muted: var(--tn-comment) !important;

        /* Status */
        --status-positive: var(--tn-green) !important;
        --status-warning: var(--tn-yellow) !important;
        --status-danger: var(--tn-red) !important;
      }

      ::selection {
        background: rgb(122 162 247 / 35%);
        color: var(--tn-fg);
      }
    '';
    home.packages = [ pkgs.vesktop ];
  };
  flake.modules.homeManager.discord = { pkgs, ... }: {
    home.packages = [ pkgs.discord ];
  };
}
