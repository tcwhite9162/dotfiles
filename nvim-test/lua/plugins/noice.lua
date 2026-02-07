return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({

            messages = {
                enabled = false
            },

			cmdline = {
				view = "cmdline_popup",
				opts = {
					position = {
						row = "10%",
						col = "75%",
					},
					size = {
						width = "auto",
						height = "auto",
						min_width = 50,
					},
				},
			},

		})
	end,
}
