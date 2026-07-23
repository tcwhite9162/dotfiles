local function load_abbrevs()
    local abbrevs = {}
    abbrevs["#i"] = "#include <><Left>"
    abbrevs["#I"] = '#include ""<Left>'
    abbrevs["#p"] = "#pragma once"
    abbrevs["fori"] = "for (int i = 0; i < n; i++) {<CR>"
    abbrevs["forij"] = "for (int i = 0; i < n; i++) {<CR> for (int j = 0; j < m; j++) {<CR>"
    abbrevs["nd"] = "[[nodiscard]]"
    abbrevs["cout"] = "cout << << std::endl;<Esc>F<hhi"
    abbrevs["cstr"] = "const std::string&"
    abbrevs["vec"] = "std::vector<><Left>"

    for typo, correct in pairs(abbrevs) do
        vim.cmd("iabbrev " .. typo .. " " .. correct)
    end
end

return load_abbrevs
