return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      list = {
        selection = { auto_insert = false },
      },
    },

    -- minimal snippet integration (needed for LSP snippets)
    snippets = {
      preset = "luasnip",
      expand = function(snippet)
        require("luasnip").lsp_expand(snippet)
      end,
    },

    -- keep blink.cmp's default super-tab behavior
    keymap = {
      preset = "super-tab",
    },
  },
}
