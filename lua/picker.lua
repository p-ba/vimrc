vim.pack.add({ "https://github.com/folke/snacks.nvim", "https://github.com/echasnovski/mini.icons" })
local Snacks = require("snacks")
vim.keymap.set({ "n" }, "<leader><space>", function()
    Snacks.picker.smart({
        hidden = true,
        ignored = true,
    })
end, { silent = true, noremap = true })
vim.keymap.set({ "n" }, "<leader>b", Snacks.picker.buffers, { silent = true, noremap = true })
vim.keymap.set({ "n" }, "<leader>e", Snacks.picker.recent, { silent = true, noremap = true })

