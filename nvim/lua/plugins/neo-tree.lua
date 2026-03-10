return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          hide_gitignored = false,
        },
      },
    })
  end,
}
