vim.pack.add({ "https://github.com/folke/tokyonight.nvim" }) -- colorscheme

if os.getenv("TERM_PROGRAM") == "Apple_Terminal" then
    vim.cmd([[colorscheme blue]])
    vim.opt.termguicolors = false
else
    local transparent = true
    vim.opt.termguicolors = true
    require("tokyonight").setup({
        style = "moon",
        transparent = transparent,
        styles = {
            sidebars = transparent and "transparent" or "moon",
            floats = transparent and "transparent" or "moon",
        },
        on_colors = function(colors)
            colors.bg_dark = transparent and colors.none or colors.bg_dark
            colors.bg_sidebar = transparent and colors.none or colors.bg_sidebar
            colors.bg_statusline = transparent and colors.none or colors.bg_statusline
        end,
    })
    vim.cmd([[colorscheme tokyonight]])
end

vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" }) -- treesitter
local treesitter = require("nvim-treesitter.configs")
treesitter.setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "go", "javascript", "typescript", "html", "css", "scss" },
    auto_install = true,
    highlight = {
        enable = true,
    },
    indent = { enable = true },
    modules = {},
    sync_install = false,
    ignore_install = {},
})
