return {
    {
        'stevearc/oil.nvim',
        dependencies = { { "nvim-mini/mini.icons", opts = {} } },
        lazy = false,
        config = function()
            require("oil").setup({
                keymaps      = {
                    ["?"] = "actions.show_help",
                    ["<C-s>"] = { "actions.select", opts = { vertical = true, split = "belowright" } },
                    ["L"] = "actions.select",
                    ["H"] = { "actions.parent", mode = "n" },
                },
                view_options = { natural_order = true, },

                float        = {
                    padding = 3,
                    max_width = 0.85,
                    border = "rounded",
                    preview_split = "right",
                },

                preview = {},

                progress     = { border = "rounded", },
                ssh          = { border = "rounded", },
                keymaps_help = { border = "rounded", },
            })
        end
    },

    {
        'nvim-mini/mini.nvim',
        version = false,

        config = function()
            require('mini.files').setup({
                mappings = {
                    close = '<ESC>'
                },
                windows = {
                    preview = true,
                    -- Width of focused window
                    width_focus = 30,
                    -- Width of non-focused window
                    width_nofocus = 20,
                    -- Width of preview window
                    width_preview = 55,
                },
            })
        end
    }
}
