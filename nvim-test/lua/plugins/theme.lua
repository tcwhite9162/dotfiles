return {

	{
		"projekt0n/github-nvim-theme",
		name = "github-theme",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme github_dark_default")
		end,
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
