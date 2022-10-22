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

	if packer_bootstrap then
		require("packer").sync()
	end	
end)

