-- a vimscript command
-- vim.cmd("colorscheme nightfly")
-- but its not safe, so we use below

-- proctected call to setup vim colorscheme
-- in case its not found
local status, _ = pcall(vim.cmd, "colorscheme nightfly")
if not status then
    print("colorscheme not found")
    return
end

