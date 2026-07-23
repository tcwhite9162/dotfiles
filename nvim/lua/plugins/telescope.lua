return {
	"nvim-telescope/telescope.nvim",
	-- branch = "0.2.x",
    version = "0.2.1",
	dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup({

            pickers = {
                colorscheme = {
                    enable_preview = true
                }
            },

            defaults = {
                preview = {
                    treesitter=false
                },

                sorting_strategy = "ascending",
                layout_strategy = 'horizontal',

                layout_config = {
                    prompt_position = "top",
                }
            },
        })
    end,
}
