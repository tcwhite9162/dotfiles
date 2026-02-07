return {
	"folke/which-key.nvim",
	event = "VeryLazy",
    opts = {
        win = {
            border = 'rounded',
            padding = {1,2,2,2},
        },

        layout = {
            spacing = 5
        },

        spec = {
            {"<leader>b", group="+buffer"},
            {"<leader>s", group="+search"},
            {"<leader>w", group="+windows"},
            {"<leader>l", group="+lsp"},
            {"<leader>c", group="+code"},
            {"<leader>d", group="+diagnostics"},
            {"g", group="+goto"},
        },

        preset = 'helix'
    },
	config = function(_, opts)
		require("which-key").setup(opts)
	end,
}
