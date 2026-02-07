-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<C-d>", "15jzz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "15kzz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-f>", "50jzz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-b>", "50kzz", { noremap = true, silent = true })

-- File tree
map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle file tree" })

-- indenting
map("v", "<", "<gv", { desc = "Indent selection left" })
map("v", ">", ">gv", { desc = "Indent selection right" })

-- file navigation
vim.keymap.set("n", "<leader>r", "<cmd>Telescope oldfiles<cr>", { desc = "Recent files" })

map("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>sf", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>sg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
map("n", "<leader>sb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
map("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })

-- Window navigation
map("n", "<leader>wh", "<C-w>h", { desc = "Go to left window" })
map("n", "<leader>wj", "<C-w>j", { desc = "Go to lower window" })
map("n", "<leader>wk", "<C-w>k", { desc = "Go to upper window" })
map("n", "<leader>wl", "<C-w>l", { desc = "Go to right window" })

map("n", "<leader>wd", "<cmd>close<cr>", { desc = "Close window" })
map("n", "<leader>wv", "<cmd>vsplit<cr>", { desc = "Split window vertically" })
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
map("n", "L", "<cmd>bn<cr>")
map("n", "H", "<cmd>bp<cr>")

map("n", "<leader>bs", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer right" })
map("n", "<leader>ba", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer left" })

map("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Close current buffer" })
map("n", "<leader>bh", "<cmd>bp<cr>", { desc = "Previous buffer" })
map("n", "<leader>bl", "<cmd>bn<cr>", { desc = "Next buffer" })
map("n", "<leader>bf", "<cmd>bf<cr>", { desc = "First buffer" })
map("n", "<leader>bg", "<cmd>bl<cr>", { desc = "Last buffer" })

map("n", "<leader>b1", "<cmd>buffer 1<cr>", { desc = "1st buffer" })
map("n", "<leader>b2", "<cmd>buffer 2<cr>", { desc = "2nd buffer" })
map("n", "<leader>b3", "<cmd>buffer 3<cr>", { desc = "3rd buffer" })
map("n", "<leader>b4", "<cmd>blffer 4<cr>", { desc = "4th buffer" })
map("n", "<leader>b5", "<cmd>blffer 5<cr>", { desc = "5th buffer" })

-- LSP

-- Show code actions
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })

map("n", "<leader>cF", function()
	vim.lsp.buf.code_action({ apply = true })
end, { desc = "Apply first fix" })

map("n", "<leader>cf", function()
	local ft = vim.bo.filetype

	if ft == "c" or ft == "cpp" then
		vim.lsp.buf.format({
			async = true,
			filter = function(client)
				return client.name == "null-ls" or client.name == "clangd"
			end,
		})
	elseif ft == "python" then
		vim.lsp.buf.format({
			async = true,
			filter = function(client)
				return client.name == "null-ls" -- ruff
			end,
		})
	elseif ft == "rust" then
		vim.lsp.buf.format({
			async = true,
			filter = function(client)
				return client.name == "rust_analyzer"
			end,
		})
	else
		vim.lsp.buf.format({ async = true })
	end
end, { desc = "Format buffer" })

-- lsp nav
map("n", "<leader>ld", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename symbol" })
map("n", "<leader>lh", vim.lsp.buf.hover, { desc = "Hover" })
map("n", "<leader>lg", vim.lsp.buf.references, { desc = "References" })

-- diagnostics
map("n", "<leader>dd", function()
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.5)

  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local _, win = vim.diagnostic.open_float(nil, {
    scope = "buffer",
    border = "rounded",
    width = width,
    height = height,
    row = row,
    col = col,
    focusable = true,
  })

  if win and vim.api.nvim_win_is_valid(win) then
    vim.api.nvim_set_current_win(win)  -- ⭐ explicitly move cursor into the window
  end
end, { desc = "Buffer diagnostics (centered)" })

map("n", "<leader>db", function()
	vim.diagnostic.setloclist({ open = true })
end, { desc = "Diagnoatics (buffer)" })

map("n", "<leader>dw", function()
	vim.diagnostic.setqflist({ open = true, workspace = true })
end, { desc = "Diagnoatics (workspace)" })

map("n", "<leader>di", function()
	vim.diagnostic.enable(false)
end, { desc = "Disable diagnostics" })

map("n", "<leader>da", function()
	vim.diagnostic.enable(true)
end, { desc = "Disable diagnostics" })

-- map("n", "<leader>lD", function()
-- 	vim.diagnostic.setloclist({ open = true })
-- end, { desc = "Diagnostics (buffer)" })
--
-- map("n", "<leader>ld", function()
-- 	vim.diagnostic.setqflist({ open = true, workspace = true })
-- end, { desc = "Ling diagnostics" })
