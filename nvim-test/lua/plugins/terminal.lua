return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<C-/>]],
      direction = "float",
      float_opts = { border = "rounded" },

      -- ⭐ Keep terminal state
      persist_size = true,
      persist_mode = true,
      persist_dir = true,

      -- Optional: don't auto-change directory to Neovim's cwd
      autochdir = false,
    })

    -- ⭐ Always use the same terminal (ID = 1)
    local Terminal = require("toggleterm.terminal").Terminal
    local main_term = Terminal:new({ id = 1 })

    vim.keymap.set("n", "<C-/>", function()
      main_term:toggle()
    end)
  end,
}
