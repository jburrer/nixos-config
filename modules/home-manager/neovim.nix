{ pkgs, ... }:

let
  fromGitHub = ref: repo: pkgs.vimUtils.buildVimPlugin {
    pname = "${pkgs.lib.strings.sanitizeDerivationName repo}";
    version = ref;
    src = builtins.fetchGit {
      url = "https://github.com/${repo}.git";
      ref = ref;
    };
  };
in
{

	programs.neovim = {
		enable = true;
		defaultEditor = true;
		vimAlias = true;
		plugins = with pkgs.vimPlugins; [
			vim-nix
			indent-blankline-nvim
      vimtex
		];
		extraConfig = ''
			set number
      set nowrap

			set tabstop=2
			set shiftwidth=2
			set noexpandtab	

			set clipboard+=unnamedplus

			set termguicolors
      set cursorline

      filetype plugin indent on
      syntax enable
      let g:vimtex_view_general_viewer = 'evince'
		'';
	};

  xdg.desktopEntries.nvim = {
    name = "Neovim wrapper";
    noDisplay = true;
  };

}
