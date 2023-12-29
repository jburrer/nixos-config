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
      rust-vim
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

      syntax enable
      filetype plugin indent on
      let g:vimtex_view_general_viewer = 'evince'
		'';
    extraLuaConfig = ''
      require("ibl").setup()
    '';
	};

  xdg.desktopEntries.nvim = {
    name = "Neovim wrapper";
    noDisplay = true;
  };

}
