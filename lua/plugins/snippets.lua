return {
    "L3MON4D3/LuaSnip",
	version = "v2.*",
	build = "make install_jsregexp",
    dependencies = {
        "rafamadriz/friendly-snippets"
    },
    config = function ()
        local ls = require("luasnip")
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/LuaSnip/" })
        vim.keymap.set({"i"}, "<C-e>", function() ls.expand() end, {silent = true})
        vim.keymap.set({"i"}, "<C-n>", function()
            if ls.jumpable(1) then
                ls.jump(1)
            end
        end, {silent = true})
        vim.keymap.set({"i"}, "<C-p>", function()
            if ls.jumpable(-1) then
                ls.jump(-1)
            end
        end, {silent = true})
    end
}
