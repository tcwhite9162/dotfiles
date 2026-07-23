-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set
local lsp = vim.lsp
local vim_api = vim.api
local vim_cmd = vim.cmd
local cols = vim.o.columns
local lines = vim.o.lines
local vim_diagnostic = vim.diagnostic

map("n", "<C-l>", "<cmd>nohlsearch<cr>", { desc = "clear search" })
map("t", "<Esc>", [[<C-\><C-n>]])

-- make motions act the same around wrapped lines
map("n", "j", "gj")
map("n", "k", "gk")
map("n", "0", "g0")
map("n", "A", "g$a")
map("n", "I", "g0i")

map("n", "q:", "<nop>", { silent = true })
map("n", "Q", "<nop>", { silent = true })

map("n", "<C-d>", "15jzz", { noremap = true, silent = true })
map("n", "<M-d>", "50jzz", { noremap = true, silent = true })
map("n", "<M-u>", "50kzz", { noremap = true, silent = true })
map("n", "<C-u>", "15kzz", { noremap = true, silent = true })

map("n", "<C-k>", "<cmd>cnext<CR>zz")
map("n", "<C-j>", "<cmd>cprev<CR>zz")

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '>-2<CR>gv=gv")

map("x", "<leader>p", "\"_dP")

-- File trees
map("n", "<leader>e", "<CMD>lua MiniFiles.open()<CR>", { desc = "File explorer (MiniFiles)" })
map("n", "<leader>o", function()
    require("oil").open_float()
end, { desc = "File explorer (Oil)" })

-- indenting
map("v", "<", "<gv", { desc = "Indent selection left" })
map("v", ">", ">gv", { desc = "Indent selection right" })

-- file navigation
map("n", "<leader><leader>", "<cmd>Telescope find_files hidden=false<cr>", { desc = "Find files" })
map("n", "<leader><S-<leader>>", "<cmd>Telescope find_files hidden=true<cr>", { desc = "Find files + hidden" })

map("n", "<leader>r", "<cmd>Telescope oldfiles<cr>", { desc = "Recent files" })

map("n", "<leader>sf", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>sb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
map("n", "<leader>sg", "<cmd>Telescope live_grep<cr>", { desc = "grep project root" })

map("n", "<leader>sm1", "<cmd>Telescope man_pages sections={'1'}<cr>", { desc = "search man pages (1)" })
map("n", "<leader>sm2", "<cmd>Telescope man_pages sections={'2'}<cr>", { desc = "search man pages (2)" })
map("n", "<leader>sm3", "<cmd>Telescope man_pages sections={'3'}<cr>", { desc = "search man pages (3)" })

map("n", "<leader>sG", function()
    require("telescope.builtin").live_grep({
        cwd = "/",
    })
end, { desc = "grep filesystem root" })

map("n", "<leader>sh", function()
    require("telescope.builtin").live_grep({
        cwd = vim.fn.expand("~"),
    })
end, { desc = "grep home directory" })


-- Window navigation
map("n", "<leader>wh", "<C-w>h", { desc = "Go to left window" })
map("n", "<leader>wj", "<C-w>j", { desc = "Go to lower window" })
map("n", "<leader>wk", "<C-w>k", { desc = "Go to upper window" })
map("n", "<leader>wl", "<C-w>l", { desc = "Go to right window" })

map("n", "<leader>wd", "<cmd>close<cr>", { desc = "Close window" })
map("n", "<leader>wv", "<cmd>vsplit<cr>", { desc = "Split window vertically" })
map("n", "<leader>ww", "<cmd>vsplit<cr>", { desc = "Split window vertically" })
map("n", "<leader>ws", "<cmd>split<cr>", { desc = "Split window horizontally" })

map("n", "<leader>wH", "<C-w>H", { desc = "Move window to Left" })
map("n", "<leader>wJ", "<C-w>J", { desc = "Move window to bottom" })
map("n", "<leader>wK", "<C-w>K", { desc = "Move window to top" })
map("n", "<leader>wL", "<C-w>L", { desc = "Move window to right" })

map("n", "<leader>w=", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
map("n", "<leader>w-", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<leader>w[", "<C-w>-", { desc = "Decrease window height" })
map("n", "<leader>w]", "<C-w>+", { desc = "Increase window height" })

-- buffer navigation
local function move_to_start()
    local bufnr = vim_api.nvim_get_current_buf()
    local elements = require("bufferline").get_elements().elements

    local idx = nil
    for i, b in ipairs(elements) do
        if b.id == bufnr then
            idx = i
            break
        end
    end

    if idx and idx > 1 then
        for _ = 1, idx - 1 do
            vim_cmd("BufferLineMovePrev")
        end
    end
end

local function move_to_end()
    local bufnr = vim_api.nvim_get_current_buf()
    local elements = require("bufferline").get_elements().elements

    local idx = nil
    for i, b in ipairs(elements) do
        if b.id == bufnr then
            idx = i
            break
        end
    end

    if idx and idx < #elements then
        for _ = 1, (#elements - idx) do
            vim_cmd("BufferLineMoveNext")
        end
    end
end

map("n", "L", "<cmd>BufferLineCycleNext<cr>")
map("n", "H", "<cmd>BufferLineCyclePrev<cr>")

map("n", "<leader>bl", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer right" })
map("n", "<leader>bL", move_to_end, { desc = "Move buffer last" })

map("n", "<leader>bh", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer left" })
map("n", "<leader>bH", move_to_start, { desc = "Move buffer first" })

map("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Close current buffer" })
map("n", "<leader>ba", "<cmd>%bd<cr>", { desc = "Close all buffers" })
map("n", "<leader>bs", "<cmd>BufferLineCloseOthers<cr>", { desc = "Close all other buffers" })

map("n", "<leader>br", "<cmd>BufferLineCloseRight<cr>", { desc = "Close buffers to the right" })
map("n", "<leader>be", "<cmd>BufferLineCloseLeft<cr>", { desc = "Close buffers to the left" })

map("n", "<leader>b1", "<cmd>BufferLineGoToBuffer 1<cr>", { desc = "buffer 1" })
map("n", "<leader>b2", "<cmd>BufferLineGoToBuffer 2<cr>", { desc = "buffer 2" })
map("n", "<leader>b3", "<cmd>BufferLineGoToBuffer 3<cr>", { desc = "buffer 3" })
map("n", "<leader>b4", "<cmd>BufferLineGoToBuffer 4<cr>", { desc = "buffer 4" })
map("n", "<leader>b5", "<cmd>BufferLineGoToBuffer 5<cr>", { desc = "buffer 5" })

-- LSP

-- Show code actions
map("n", "<leader>ca", lsp.buf.code_action, { desc = "Code actions" })

map("n", "<leader>cF", function()
    lsp.buf.code_action({ apply = true })
end, { desc = "Apply first fix" })

local format_clients = {
    c        = "clangd",
    cpp      = "clangd",
    lua      = "lua_ls",
    python   = "null-ls",
    rust     = "rust_analyzer",
    tex      = "texlab",
    latex    = "texlab",
    haskell  = "ormolu",
    hs       = "ormolu",
    markdown = "null-ls",
    md       = "null-ls",
}

map("n", "<leader>f", function()
    local ft = vim.bo.filetype
    local preferred = format_clients[ft]

    if preferred then
        vim.lsp.buf.format({
            async = true,
            filter = function(client)
                return client.name == preferred
            end,
        })
    else
        vim.lsp.buf.format({ async = true })
    end
end, { desc = "Format buffer" })

map("n", "<leader>ld", lsp.buf.definition, { desc = "Go to definition" })
map("n", "<leader>lr", lsp.buf.rename, { desc = "Rename symbol" })
map("n", "<leader>lh", lsp.buf.hover, { desc = "Hover" })
map("n", "<leader>lg", lsp.buf.references, { desc = "References" })

-- diagnostics
map("n", "<leader>dd", function()
    local width = math.floor(cols * 0.8)
    local height = math.floor(lines * 0.5)

    local row = math.floor((lines - height) / 2)
    local col = math.floor((cols - width) / 2)

    local _, win = vim_diagnostic.open_float(nil, {
        scope = "buffer",
        border = "rounded",
        width = width,
        height = height,
        row = row,
        col = col,
        focusable = true,
    })

    if win and vim_api.nvim_win_is_valid(win) then
        vim_api.nvim_set_current_win(win) -- ⭐ explicitly move cursor into the window
    end
end, { desc = "Buffer diagnostics (centered)" })

map("n", "<leader>db", function()
    vim_diagnostic.setloclist({ open = true })
end, { desc = "Diagnostics (buffer)" })

map("n", "<leader>dw", function()
    vim_diagnostic.setqflist({ open = true, workspace = true })
end, { desc = "Diagnostics (workspace)" })

map("n", "<leader>di", function()
    vim_diagnostic.enable(false)
end, { desc = "Disable diagnostics" })

map("n", "<leader>da", function()
    vim_diagnostic.enable(true)
end, { desc = "Enable diagnostics" })

-- session
map("n", "<leader>qq", function()
    require("persistence").load()
end, { desc = "Restore session for current directory" })

map("n", "<leader>qs", function()
    require("persistence").select()
end, { desc = "Select session" })

map("n", "<leader>ql", function()
    require("persistence").load({ last = true })
end, { desc = "Restore last session" })

map("n", "<leader>qd", function()
    require("persistence").stop()
end, { desc = "Dont save current session" })

-- LaTeX / VimTeX
map("n", "<leader>tc", "<cmd>VimtexCompile<cr>", { desc = "Compile LaTeX document" })
map("n", "<leader>tt", "<cmd>VimtexCompile<cr>", { desc = "Compile LaTeX document" })
map("n", "<leader>tv", "<cmd>VimtexView<cr>", { desc = "View PDF (forward search)" })
map("n", "<leader>te", "<cmd>VimtexErrors<cr>", { desc = "Show LaTeX errors" })
map("n", "<leader>tO", "<cmd>VimtexTocToggle<cr>", { desc = "Toggle TOC" })
map("n", "<leader>tl", "<cmd>VimtexLog<cr>", { desc = "Open LaTeX log" })
map("n", "<leader>ts", "<cmd>VimtexStop<cr>", { desc = "Stop compilation" })
map("n", "<leader>tS", "<cmd>VimtexStopAll<cr>", { desc = "Stop all compilers" })
map("n", "<leader>ti", "<cmd>VimtexInfo<cr>", { desc = "VimTeX info" })
map("n", "<leader>tr", "<cmd>VimtexReload<cr>", { desc = "Reload VimTeX" })
map("n", "<leader>tb", "<cmd>VimtexClean<cr>", { desc = "Clean aux files" })
map("n", "<leader>tB", "<cmd>VimtexClean!<cr>", { desc = "Clean *all* build files" })

-- Visual
map("n", "<leader>vm", "<cmd>Markview<cr>", { desc = "Toggle MarkView" })
map("n", "<leader>vc", "<cmd>Telescope colorscheme<cr>", { desc = "Change colorscheme" })

-- zathura favorites selection menu
map("n", "<leader>zz", function()
    require("zathura_favorites").zathura_favorites()
end, { desc = "Open Zathura Favorites" })

-- LuaSnip: expand or jump forward
map({ "i", "s" }, "<C-j>", function()
    local ls = require("luasnip")
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })

-- LuaSnip: jump backward
map({ "i", "s" }, "<C-k>", function()
    local ls = require("luasnip")
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })

-- snippets window
map("n", "<leader>kt", function()
    require("config.snippets_window")()
end, { desc = "Latex Snippet cheat‑sheet" })
