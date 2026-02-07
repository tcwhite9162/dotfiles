
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ["*"] = {
        capabilities = {
          textDocument = {
            completion = {
              completionItem = {
                snippetSupport = false, -- disable parameter snippets
              },
            },
          },
        },
      },
    },
  },
}
