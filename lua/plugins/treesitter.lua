return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "windwp/nvim-ts-autotag",
    },
    config = function()
        -- import nvim-treesitter plugin
        local treesitter = require("nvim-treesitter.configs")
        treesitter.setup {
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "php", "javascript", "typescript", "html", "css", "scss" },
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = '<CR>',
                    node_incremental = '<TAB>',
                    scope_incremental = '<CR>',
                    node_decremental = '<S-TAB>'
                }
            }
        }
    end
}
