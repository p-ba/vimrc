return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        local mason = require("mason")
        mason.setup()
        local mason_lspconfig = require("mason-lspconfig")
        mason_lspconfig.setup({
            ensure_installed = {
                "tsserver",
                "intelephense",
                "html",
                "cssls",
                "lua_ls",
                "emmet_ls",
                "volar"
            },
            automatic_installation = true,
        })

        local mason_tool_installer = require("mason-tool-installer")
        mason_tool_installer.setup({
            ensure_installed = {
                "prettier",
                "eslint_d",
                "phpcbf",
            },
        })
    end
}
