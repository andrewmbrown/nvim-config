-- using packer.nvim as a plugin manager
-- when installing new packages (or removing old ones)
-- :w write this file to have packer auto manage
-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- try to import packer, if fails, then return
local status, packer = pcall(require, "packer")
if not status then
	return
end


return packer.startup(function(use)

    -- packer itself
    use("wbthomason/packer.nvim")
    -- lua functions that other plugins use
    use("nvim-lua/plenary.nvim")
    -- colorscheme
    use("morhetz/gruvbox")
    -- tmux & split window navigation
    use("christoomey/vim-tmux-navigator")
    -- window manager for maximizing and min
    use("szw/vim-maximizer")
    -- nifty surround
    use("tpope/vim-surround")
    -- more appropriate copy/paste without highlight
    use("vim-scripts/ReplaceWithRegister")
    -- nice block commenting
    use("numToStr/Comment.nvim")
    -- file explorer
    use("nvim-tree/nvim-tree.lua")
    -- icons
    use("kyazdani42/nvim-web-devicons")
    -- statusline
    use("nvim-lualine/lualine.nvim")
    -- fuzzy finder with telescope!
    -- dependency for telescope, first is repo name, second is option
    use({"nvim-telescope/telescope-fzf-native.nvim", run="make"})
    -- specific version of telescope
    use({"nvim-telescope/telescope.nvim", branch="0.1.x"})
    --autocompletion
    -- plugin for autocompletion
    use("hrsh7th/nvim-cmp")
    -- source, allows cmp to recomend text from buffer
    use("hrsh7th/cmp-buffer")
    -- source, for file paths to recommend
    use("hrsh7th/cmp-path")

    -- snippets
    -- snippet engine
    use("L3MON4D3/LuaSnip")
    -- source, nvim cmp for autocompletion
    use("saadparwaiz1/cmp_luasnip")
    -- collection of useful snippets for various langs
    use("rafamadriz/friendly-snippets")

    -- managing & installing lsp servers
    -- also manage linter & formatters
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    -- configuring new lsp servers
    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
    use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
    use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
    use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

    -- formatting and linting
    use("jose-elias-alvarez/null-ls.nvim")
    use("jayp0521/mason-null-ls.nvim")

    -- treesitter (better syntax highlighting, completion)
	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

    -- git integration signs plugin
    use("lewis6991/gitsigns.nvim")
	if packer_bootstrap then
		require("packer").sync()
	end	
end)

