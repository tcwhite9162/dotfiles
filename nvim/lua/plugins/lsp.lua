return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Replace 'lua_ls' with your server
        lua_ls = {
          mason = false, -- Prevent mason from managing this server
        },
      },
    },
  },
}
