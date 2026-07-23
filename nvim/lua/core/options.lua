vim.opt.nu = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.lsp.inlay_hint.enable(false)
vim.g.lspconfig = { deprecated = false }
vim.g.miniindentscope_disable = true

vim.opt.scrolloff = 8
vim.opt.termguicolors = true

vim.opt.shortmess:append("I")
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 0

vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo"

vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.wildoptions = "pum"

vim.o.ignorecase = true
vim.o.smartcase = true

vim.diagnostic.config({
    virtual_text = {
        prefix = "■",
        spacing = 2,
        severity = nil,
    },
    signs = true,
    underline = true,
    update_in_insert = false,
})
