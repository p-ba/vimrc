return {
    "supermaven-inc/supermaven-nvim",
    config = function()
        require("supermaven-nvim").setup({
            keymaps = {
                accept_suggestion = "<Tab>",
                clear_suggestion = "<C-]>",
                accept_word = "<C-j>",
            },
            condition = function()
                return vim.bo.filetype == "fugitive" or vim.bo.filetype == "git" or vim.bo.filetype == "diff"
            end,
        })
    end,
}
