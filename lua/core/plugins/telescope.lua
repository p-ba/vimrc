return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    branch = "0.1.x",
    config = function()
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>p', builtin.find_files, {})
        vim.keymap.set('n', '<leader>f', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>F', builtin.grep_string, {})
        vim.keymap.set('n', '<leader>b', builtin.buffers, {})
        vim.keymap.set('n', '<leader>e', builtin.oldfiles, {})
        vim.keymap.set('n', '<leader>h', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>r', builtin.treesitter, {})
        --vim.keymap.set('n', '<leader>r', builtin.lsp_document_symbols, {})
        vim.keymap.set('n', '<leader>j', builtin.jumplist, {})

        local actions = require("telescope.actions")
        local telescope = require("telescope")
        telescope.setup {
            extensions = {
                fzf = {
                    fuzzy = true,                   -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true,    -- override the file sorter
                    case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                }
            },
            defaults = {
                mappings = {
                    i = {
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist
                    },
                },
            }
        }
        telescope.load_extension('fzf')
    end
}
