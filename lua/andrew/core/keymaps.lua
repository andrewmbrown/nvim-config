-- default is backslash, replace with space
vim.g.mapleader = " "

local keymap = vim.keymap  -- map for conciseness

-- general keymaps
-- when in insert mode, jk will put us back to normal mode
keymap.set("i", "jk", "<ESC>")

-- in normal mode, don't copy x delete chars into default register
keymap.set("n", "x", '"_x')

-- plugin keymaps
-- vim-maximizer
--
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

