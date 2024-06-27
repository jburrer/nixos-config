{ pkgs, ... }:

{

  #programs.neovim = {
	#	defaultEditor = true;
	#	vimAlias = true;
	#};

  programs.nixvim = {
    enable = true;
    autoCmd = [
      {
        desc = "open all folds when opening a file";
        event = [ "BufReadPost" "FileReadPost" ];
        pattern = [ "*" ];
        command = "normal zR";
      }
    ];
    colorschemes.base16 = {
      enable = true;
      colorscheme = "tomorrow-night";
    };
    options = {
      number = true;
      wrap = false;
      cursorline = true;
      tabstop = 2;
      shiftwidth = 2;
      expandtab = false;
    };
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };
    plugins = {
      nix.enable = true;
      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;
          rust-analyzer = {
            enable = true;
            installRustc = true;
            installCargo = true;
          };
        };
      };
      treesitter = {
        enable = true;
        indent = true;
        folding = true;
        nixvimInjections = true;
      };
      indent-blankline = {
        enable = true;
      };
      rainbow-delimiters = {
        enable = true;
      };
      vimtex = {
        enable = true;
        installTexLive = true;
        extraConfig.view_general_viewer = "evince";
      };
      lualine = {
        enable = true;
        theme = "base16";
        iconsEnabled = false;
				sectionSeparators = {
					left = " ";
					right = " ";
				};
				componentSeparators = {
					left = " ";
					right = " ";
				};
      };
      # maybe add vim tmux navigator
    };
  };

  xdg.desktopEntries.nvim = {
    name = "Neovim wrapper";
    noDisplay = true;
  };

}
