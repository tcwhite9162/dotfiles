-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- uncomment these two lines for relative line numbers
--vim.wo.number = true
--vim.wo.relativenumber = true

local abbrevs = {}
-- Persistent abbreviations
abbrevs["#i"] = "#include <><Left>"
abbrevs["#I"] = "#include \"\"<Left>"
abbrevs["#p"] = "#pragma once"
abbrevs["fori"] = "for (int i = 0; i < n; i++) {<CR>"
abbrevs["forij"] = "for (int i = 0; i < n; i++) {<CR> for (int j = 0; j < m; j++) {<CR>"
abbrevs["nd"] = "[[nodiscard]]"
abbrevs["cout"] = "cout << << std::endl;<Esc>F<hhi"
abbrevs["cstr"] = "const std::string&"
abbrevs["vec"] = "std::vector<><Left>"

-- function to eat the triggering space after abbreviations

-- Loop through the table and set the abbreviations
for typo, correct in pairs(abbrevs) do
    vim.cmd("iabbr " .. typo .. " " .. correct)
end


vim.opt.tabstop = 4 -- Display a tab character as 4 spaces wide
vim.opt.shiftwidth = 4 -- Use 4 spaces for auto-indentation
vim.opt.softtabstop = 4 -- Add/remove 4 spaces when pressing Tab/Backspace
vim.opt.expandtab = true -- Insert spaces when Tab is pressed
