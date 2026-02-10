require("_init")
require("theme")
require("settings")
require("keymaps")

vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function()
        require("tagfunc")
        require("picker")
        require("lsp")
        require("misc")
        require("oil_config")
        require("markdown")
        local local_lsp_config = vim.fn.stdpath("config") .. "/lua/_local_lsp.lua"
        if vim.fn.filereadable(local_lsp_config) == 1 then
            require("_local_lsp")
        end
    end,
})
