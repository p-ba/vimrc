return {
	'hrsh7th/nvim-cmp',
    event = { "InsertEnter" },
	dependencies = {
		'L3MON4D3/LuaSnip',
		'saadparwaiz1/cmp_luasnip',
        'rafamadriz/friendly-snippets',
		"hrsh7th/cmp-buffer", -- source for text in buffer
	},
	config = function()
		local cmp = require('cmp')

		local has_words_before = function()
		    unpack = unpack or table.unpack
		    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		local luasnip = require('luasnip')
		require("luasnip.loaders.from_vscode").load()

		cmp.setup({
		    snippet = {
		        expand = function(args)
		            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
		            luasnip.lsp_expand(args.body) -- For `luasnip` users.
		            -- snippy.expand_snippet(args.body) -- For `snippy` users.
		            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		        end,
		    },
		    sources = cmp.config.sources({
		        { name = 'nvim_lsp' },
		        { name = 'buffer' },
				--{ name = 'file' },
		        -- { name = 'vsnip' }, -- For vsnip users.
		        { name = 'luasnip' }, -- For luasnip users.
		        -- { name = 'ultisnips' }, -- For ultisnips users.
		        -- { name = 'snippy' }, -- For snippy users.
		    }),
		    mapping = cmp.mapping.preset.insert({
		        -- `Enter` key to confirm completion
		        ['<Enter>'] = cmp.mapping.confirm({select = false}),

		        -- Ctrl+Space to trigger completion menu
		        ['<C-Space>'] = cmp.mapping.complete(),

		        -- Scroll up and down in the completion documentation
		        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
		        ['<C-d>'] = cmp.mapping.scroll_docs(4),
		        ["<Tab>"] = cmp.mapping(function(fallback)
		            if luasnip.expand_or_jumpable() then
		                luasnip.expand_or_jump()
		            else
		                fallback()
		            end
		        end, { "i", "s" }),

		        ["<S-Tab>"] = cmp.mapping(function(fallback)
		            if luasnip.jumpable(-1) then
		                luasnip.jump(-1)
		            else
		                fallback()
		            end
		        end, { "i", "s" }),
		    })
		})
	end
}
