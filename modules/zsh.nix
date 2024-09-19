{ config, pkgs, ... } :

let extraZshConfig = ''
  setopt PROMPT_SUBST
  check_nix_shell() {
    if [[ -v IN_NIX_SHELL  ]]; then
      printf '{%s} ' "$NIX_SHELL_PACKAGES"
    fi
  }
  PROMPT='%F{yellow}$(check_nix_shell)%f%F{green}%n%f@%F{magenta}%m%f:%F{blue}%~%f > '
  
  set -o vi
  
  gpg-connect-agent /bye
  export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
  
  function vterm_printf(){
      printf "\e]%s\e\\" "$1"
  }
  if [[ "$INSIDE_EMACS" = 'vterm' ]]; then
      alias clear='vterm_printf "51;Evterm-clear-scrollback";tput clear'
  fi
  vterm_cmd() {
      local vterm_elisp
      vterm_elisp=""
      while [ $# -gt 0 ]; do
          vterm_elisp="$vterm_elisp""$(printf '"%s" ' "$(printf "%s" "$1" | sed -e 's|\\|\\\\|g' -e 's|"|\\"|g')")"
          shift
      done
      vterm_printf "51;E$vterm_elisp"
  }
  autoload -U add-zsh-hook
  add-zsh-hook -Uz chpwd (){ print -Pn "\e]2;%m:%2~\a" }
  vterm_prompt_end() {
      vterm_printf "51;A$(whoami)@$(hostname):$(pwd)"
  }
  PROMPT=$PROMPT'%{$(vterm_prompt_end)%}'
  
  eval "$(direnv hook zsh)"
'';
in {

  users.users."${config.username}".shell = pkgs.zsh;

  environment = {
    shells = [ pkgs.zsh ];
    pathsToLink = [ "/share/zsh" ];
  };

  programs.zsh.enable = true;

  home-manager.users.${config.username}.programs = {

    zsh = {
      enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      enableVteIntegration = true;
      history = {
        size = 10000;
        ignoreAllDups = true;
      };
      shellAliases = {
        ls = "ls -1 --group-directories-first --color=auto"; 
        la = "ls -1A --group-directories-first --color=auto"; 
        grep = "grep --color=auto";
        mv = "mv -v";
        cp = "cp -v";
        rm = "rm -v";
        rmdir = "rmdir -v";
        mkdir = "mkdir -v";
        neofetch = "echo && ${pkgs.fastfetch}/bin/fastfetch";
      };
      plugins = [
        {
          name = "zsh-nix-shell";
          file = "nix-shell.plugin.zsh";
          src = pkgs.fetchFromGitHub {
            owner = "chisui";
            repo = "zsh-nix-shell";
            rev = "v0.8.0";
            sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
          };
        }
      ];
      syntaxHighlighting.enable = true;
      initExtra = extraZshConfig;
    };

    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

  };

}
