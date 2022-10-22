local status, lualine = pcall(require, "lualine")
if not status then
    print("missing lualine setup")
    return
end

local lualine_gruvbox = require("lualine.themes.gruvbox")

lualine.setup({
    options = {
        icons_enaled = true,
        theme = "auto"
    }
})
