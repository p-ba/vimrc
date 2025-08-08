return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function ()
        require("codecompanion").setup({
            adapters = {
                gem = function()
                    return require("codecompanion.adapters").extend("gemini", {
                        name = 'gem',
                        env = {
                            api_key = os.getenv('GEMINI_KEY'),
                        },
                    })
                end,
            },
            strategies = {
                chat = {
                    adapter = 'gem',
                },
                inline = {
                    adapter = 'gem',
                },
                agent = {
                    adapter = 'gem',
                },
            },
        })
    end
}
