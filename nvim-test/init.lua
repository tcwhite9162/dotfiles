vim.opt.shortmess:append("I")
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 0

vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.wildoptions = "pum"

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- Load plugins
require("core.keymaps")
require("core.options")
require("lazy").setup("plugins")

require("mini.icons").setup()
require("mini.icons").mock_nvim_web_devicons()
