return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        lspconfig.clangd.setup({
            capabilities = capabilities,
        })
        lspconfig.tsserver.setup({
            capabilities = capabilities,
            init_options = {
                plugins = {
                    {
                        name = "@vue/typescript-plugin",
                        location = "@vue/typescript-plugin",
                        languages = {"javascript", "typescript", "vue"},
                    },
                },
            },
            filetypes = {
                "javascript",
                "typescript",
                "vue",
            },
        })
--        lspconfig.phpactor.setup({
--             capabilities = capabilities,
--        })
        lspconfig.intelephense.setup({
            capabilities = capabilities,
        })
        lspconfig.html.setup({
            capabilities = capabilities,
        })
        lspconfig.cssls.setup({
            capabilities = capabilities,
        })
        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT'
                    },
                    diagnostics = {
                        globals = { 'vim' }
                    },
                    workspace = {
                        library = {
                            vim.env.VIMRUNTIME,
                        }
                    }
                }
            }
        })
        lspconfig.volar.setup({
            capabilities=capabilities,
        })
    end
}
