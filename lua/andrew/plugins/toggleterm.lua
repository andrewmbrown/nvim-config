local toggleterm_setup, toggleterm = pcall(require, "toggleterm")
if not toggleterm_setup then
    print("Missing toggleterm setup")
    return
end

toggleterm.setup({
    size = 13,
    open_mapping = [[<c-t>]],
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = '1',
    start_in_insert = true,
    persist_size = true,
    direction = 'horizontal'
})
