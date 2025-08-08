local capabilities = vim.tbl_deep_extend('force', vim.lsp.protocol.make_client_capabilities(), {
    textDocument = {
        completion = {
            completionItem = {
                --insertReplaceSupport = false,
            },
        },
        foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true
        }
    }
})

vim.lsp.config('*', {
    capabilities = capabilities,
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('user.lsp', {}),
    callback = function(args)
        local format_on_save = {"eslint"}
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        for _, lsp in ipairs(format_on_save) do
            if lsp == client.name then
                vim.api.nvim_create_autocmd('BufWritePre', {
                    group = vim.api.nvim_create_augroup('user.lsp', { clear=false }),
                    buffer = args.buf,
                    callback = function()
                        vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
                    end,
                })
            end
        end
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = false })
        end
    end,
})

vim.api.nvim_create_autocmd('LspDetach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client:supports_method('textDocument/formatting') then
            vim.api.nvim_clear_autocmds({
                event = 'BufWritePre',
                buffer = args.buf,
            })
        end
    end,
})

return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
    config = function()
        require("mason").setup{}
        require("mason-lspconfig").setup({
            ensure_installed = {
                "intelephense",
                "eslint",
            },
            automatic_installation = true,
        })
    end
}
