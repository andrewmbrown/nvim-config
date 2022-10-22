local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
    print("nvim-tree not setup properly")
    return
end

-- recommended settings from nvim-tree docs
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
    renderer = {
        icons = {
            glyphs = {
                folder = {
                    arrow_closed = ">",
                    arrow_open = "v",
                },
            },
        },
    },v 
})

