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
vim.opt.hidden = false

require("core.options")
require("core.keymaps")
require("lazy").setup("plugins")

require("mini.icons").setup()
require("mini.icons").mock_nvim_web_devicons()

require("config.abbreviations")()

vim.api.nvim_create_user_command("ZathuraFavorites", function()
    require("zathura_favorites").zathura_favorites()
end, {})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            },

            workspace = {
                checkThirdParty = false,
            },
        }
    }
})
