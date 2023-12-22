{ config, pkgs, ... }:

#let
#  tmux-ssh-split = pkgs.tmuxPlugins.mkTmuxPlugin {
#    pluginName = "tmux-ssh-split";
#    version = "0.0";
#    src = pkgs.fetchFromGitHub {
#      owner = "pschmitt";
#      repo = "tmux-ssh-split";
#      rev = "eafb25975a0264e47d858cd4761574daaaeb24bd";
#      sha256 = null;
#    };
#  };
#in
{

  programs.tmux = {
    enable = true;
    keyMode = "vi";
    mouse = true;
    terminal = "tmux-256color";
    plugins = with pkgs.tmuxPlugins ; [
      yank
      #tmux-ssh-split
    ];
    extraConfig = ''
      set -g status-bg '#1e1e1e' 
      set -g status-fg white
      set -g status-right '#(whoami)@#(hostname)'
      set -g pane-border-style 'fg=#1e1e1e bg=#1e1e1e'
      set -g pane-active-border-style 'fg=white bg=#1e1e1e'

      set-option -sg escape-time 10
      set-option -sa terminal-features ',xterm-256color:RGB'

      bind-key -T copy-mode-vi 'v' send -X begin-selection
      bind-key -T copy-mode-vi 'y' send -X copy-selection-and-cancel
    '';
      #set-option -g @ssh-split-h-key "|"
      #set-option -g @ssh-split-v-key "S"
  };

}
