vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim", -- common library
})

vim.pack.add({"https://github.com/folke/tokyonight.nvim"}) -- colorscheme

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

vim.pack.add({"https://github.com/nvim-treesitter/nvim-treesitter"}) -- treesitter
local treesitter_setup = function()
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
end
vim.api.nvim_create_autocmd("BufReadPre", {
    callback = treesitter_setup,
})
vim.api.nvim_create_autocmd("BufNewFile", {
    callback  = treesitter_setup,
})

vim.pack.add({"https://github.com/neovim/nvim-lspconfig"})
local capabilities = vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), {
    textDocument = {
        completion = {
            completionItem = {
                -- insertReplaceSupport = false,
            },
        },
        foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true
        }
    }
})

vim.lsp.config("*", {
    capabilities = capabilities,
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("user.lsp", {}),
    callback = function(args)
        local format_on_save = {"eslint"}
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then
            return
        end
        for _, lsp in ipairs(format_on_save) do
            if lsp == client.name then
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = vim.api.nvim_create_augroup("user.lsp", { clear=false }),
                    buffer = args.buf,
                    callback = function()
                        vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
                    end,
                })
            end
        end
        if client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = false })
        end
    end,
})

vim.api.nvim_create_autocmd("LspDetach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then
            return
        end
        if client:supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({
                event = "BufWritePre",
                buffer = args.buf,
            })
        end
    end,
})

vim.lsp.enable("clangd")
vim.lsp.enable("intelephense")
vim.lsp.enable("eslint")
vim.lsp.enable("ts_ls")
vim.lsp.enable("gopls")
vim.lsp.enable("lua_ls")

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    }
})

vim.pack.add({"https://github.com/echasnovski/mini.pick"})
local MiniPick = require("mini.pick")
vim.keymap.set({"n"}, "<leader><space>", function()
    MiniPick.builtin.cli({ command = { "fd", "-I", "--type=f", "--no-follow", "--color=never" } })
end, { desc = "Search files" })
vim.keymap.set({"n"}, "<leader>b", MiniPick.builtin.buffers, { desc = "Search buffers" })
vim.keymap.set({"n"}, "<leader>e", MiniPick.builtin.resume, { desc = "Resume last search" })

vim.pack.add({"https://github.com/tpope/vim-fugitive"})

vim.pack.add({"https://github.com/editorconfig/editorconfig-vim"})
vim.g.EditorConfig_exclude_patterns = {"fugitive://.*", "scp://.*"}

vim.pack.add({"https://github.com/tpope/vim-vinegar"})
