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
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<C-f>", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
