return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<C-/>]],
      direction = "float",
      float_opts = { border = "rounded" },

      on_open = function(term)
        -- Get the buffer you were in BEFORE opening the terminal
        local prev_buf = vim.fn.bufnr("#")
        local dir = vim.fn.expand("#" .. prev_buf .. ":p:h")

        if dir ~= "" then
          vim.api.nvim_chan_send(term.job_id, "cd " .. dir .. "\n")
          vim.api.nvim_chan_send(term.job_id, "clear\n")
        end
      end,
    })
  end,
}
