return {
    "folke/tokyonight.nvim",
    dependencies = {
        --"andreypopp/vim-colors-plain",
    },
    priority = 1000,
    lazy = false,
    config = function()
        if os.getenv('TERM_PROGRAM') == 'Apple_Terminal' then
            vim.cmd([[colorscheme blue]])
            vim.opt.termguicolors = false
        else
            vim.opt.termguicolors = true
            vim.cmd([[colorscheme tokyonight]])
            vim.cmd[[hi Normal ctermbg=NONE guibg=NONE]]
        end
    end,
}
