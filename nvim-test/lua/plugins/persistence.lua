return {

	{
		"stevearc/dressing.nvim",
		opts = {},
	},

	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = {
			-- save session when leaving Neovim
			options = { "buffers", "curdir", "tabpages", "winsize" },
		},
	},
}
