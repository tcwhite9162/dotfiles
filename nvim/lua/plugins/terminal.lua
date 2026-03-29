return {
  "numToStr/FTerm.nvim",
  config = function()
    require("FTerm").setup({
      border = "rounded",
      dimensions = {
        height = 0.9,
        width = 0.9,
      },
      blend = 0,
    })

    -- Toggle with <C-/>
    local fterm = require("FTerm")
    vim.keymap.set({ "n", "t" }, "<C-_>", function()
      fterm.toggle()
    end, { desc = "Toggle FTerm" })
  end,
}
