local opts = { layout = { preset = "ivy", layout = { position = "bottom" } }}
return {
    "folke/snacks.nvim",
    opts = {
        picker = {},
        explorer = {},
    },
    keys = {
        -- Top Pickers & Explorer
        { "<leader><space>", function() Snacks.picker.smart({
            hidden = true,
            ignored = true,
        }) end, desc = "Smart Find Files" },
        { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
        { "<leader>e", function() Snacks.picker.recent() end, desc = "Recent files" },
        { "<leader>/", function() Snacks.explorer() end, desc = "File Explorer" },
        -- find
        { "<leader>b", function() Snacks.picker.buffers() end, desc = "Buffers" },
        { "<leader>f", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
        -- git
        { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
        { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
        { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
        { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
        { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
        { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
        { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
    },
}
