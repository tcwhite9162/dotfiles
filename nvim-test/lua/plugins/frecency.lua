return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-frecency.nvim",
  },
  config = function()
    require("telescope").load_extension("frecency")
  end,
}
