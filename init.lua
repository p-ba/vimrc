require("_init")
require("theme")
require("settings")
require("keymaps")
require("tagfunc")
require("picker")
require("lsp")
require("misc")

local local_lsp_config = vim.fn.stdpath("config") .. "/lua/_local_lsp.lua"
if vim.fn.filereadable(local_lsp_config) == 1 then
    require("_local_lsp")
else
    local f = assert(io.open(local_lsp_config, "w"))
    f:close()
end
