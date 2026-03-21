return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers", -- show buffers, not tabs
        diagnostics = "nvim_lsp",
        separator_style = "thick", -- LazyVim default
        show_buffer_close_icons = false,
        show_close_icon = false,
        always_show_bufferline = true,
      },
    })
  end,
}
