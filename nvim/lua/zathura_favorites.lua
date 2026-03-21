local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local favorites_file = vim.fn.expand("~/.config/nvim/zathura-favorites")

local function zathura_favorites()
  local lines = {}
  for line in io.lines(favorites_file) do
    if line ~= "" then
      table.insert(lines, line)
    end
  end

  pickers.new({}, {
    prompt_title = "Zathura Favorites",
    finder = finders.new_table(lines),
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      -- Override default <CR> behavior
      actions.select_default:replace(function()
        local entry = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        vim.fn.jobstart({ "zathura", entry.value }, { detach = true })
      end)
      return true
    end,
  }):find()
end

return {
  zathura_favorites = zathura_favorites,
}
