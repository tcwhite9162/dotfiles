return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority =
        1000,
		config = function()
			vim.cmd("colorscheme catppuccin-mocha")
		end,
    },

	{
		"projekt0n/github-nvim-theme",
		name = "github-theme",
		lazy = false,
		priority = 1000,
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
		"eldritch-theme/eldritch.nvim",
		lazy = false,
		priority = 1000,
	},

}
