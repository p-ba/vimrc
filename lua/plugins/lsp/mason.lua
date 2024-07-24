return {
    "williamboman/mason.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "nvimtools/none-ls.nvim",
        "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        require("mason").setup{}
        local mason_lspconfig = require("mason-lspconfig")
        mason_lspconfig.setup({
            ensure_installed = {
                "tsserver",
                "intelephense",
                "html",
                "cssls",
                "eslint",
                "lua_ls",
                "pyright"
            },
            automatic_installation = true,
        })

        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                require("none-ls.code_actions.eslint"),
                null_ls.builtins.formatting.black,
            },
        })

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        mason_lspconfig.setup_handlers {
            function (server_name)
                require("lspconfig")[server_name].setup {
                    capabilities = capabilities,
                }
            end,
            ["omnisharp"] = function ()
                require("lspconfig").omnisharp.setup {
                    capabilities = capabilities,
                    cmd = { "dotnet", vim.fn.stdpath "data" .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },
                    settings = {
                        FormattingOptions = {
                            EnableEditorConfigSupport = true,
                            OrganizeImports = nil,
                        },
                        MsBuild = {
                            LoadProjectsOnDemand = nil,
                        },
                        RoslynExtensionsOptions = {
                            EnableAnalyzersSupport = true,
                            EnableImportCompletion = true,
                            AnalyzeOpenDocumentsOnly = true,
                        },
                        Sdk = {
                            IncludePrereleases = true,
                        },
                    },
                }
            end,
            ["lua_ls"] = function ()
                require("lspconfig").lua_ls.setup {
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
                }
            end,
            ["eslint"] = function ()
                require("lspconfig").eslint.setup {
                    on_attach = function(client, bufnr)
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            buffer = bufnr,
                            command = "EslintFixAll",
                        })
                    end,

                }
            end,
        }
    end
}
