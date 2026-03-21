vim.opt.number = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.diagnostic.config({
  virtual_text = {
    prefix = "■",  -- "■", "▎", "●", "".
    spacing = 2,
    severity = nil,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
})

vim.lsp.inlay_hint.enable(true)
vim.g.lspconfig = { deprecated = false }
vim.g.miniindentscope_disable = true
vim.opt.scrolloff = 5 -- Keeps at least 5 lines above/below cursor

