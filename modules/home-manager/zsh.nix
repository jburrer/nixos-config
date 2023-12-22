{ config, pkgs, ... }:

let
	vars = import ../../vars.nix;
in
{

	programs.zsh = {
		enable = true;
		enableAutosuggestions = true;
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
			neofetch = "echo && neofetch";
		};
		initExtra = ''
			PS1='%F{green}%n%f@%F{magenta}%m%f:%F{blue}%~%f > '
			PATH="$PATH:${vars.scriptsDir}"
      export EDITOR="nvim"
			set -o vi
			gpg-connect-agent /bye
			export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
			if [ "$TERM" = 'alacritty' ] && [ -z "$TMUX" ] && \
			    [[ ! "$(tmux ls -F '#{session_id},#{session_attached}')" =~ '$0,1' ]]
			then
			  exec tmux new-session -A -s main
			fi
		'';
		syntaxHighlighting.enable = true;
	};

  home.packages = ( with pkgs; [ neofetch ] );

}
