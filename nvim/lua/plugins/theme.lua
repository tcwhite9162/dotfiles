return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority =
            1000,
        -- config = function()
        --     vim.cmd("colorscheme catppuccin-mocha")
        -- end,
    },

    {
        "tiagovla/tokyodark.nvim",
    },

    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
    },

    {
        "vague-theme/vague.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd("colorscheme vague")
        end
    },

    {
        "aktersnurra/no-clown-fiesta.nvim",
        priority = 1000,
        lazy = false,
        -- config = function()
        --     vim.cmd("colorscheme no-clown-fiesta")
        -- end

    }

}
