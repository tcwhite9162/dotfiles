return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup({

            defaults = {

                sorting_strategy = "ascending",
                layout_strategy = 'horizontal',

                layout_config = {
                    prompt_position = "top",
                    preview_width = 0.5,
                }
            },
        })
    end,
}
