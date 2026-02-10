vim.pack.add({ "https://github.com/stevearc/oil.nvim" })

require("oil").setup({
    default_file_explorer = true,
    skip_confirm_for_simple_edits = true,
    columns = {
        "icon",
    }
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
