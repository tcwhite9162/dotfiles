local function open_snippet_cheatsheet()
  local lines = {
    "Snippets:",
    "",
    "  beg      begin + end environment",
    "  itm      itemize environment",
    "  enum     enumerate environment",
    "",
    "  ptree    begin + end prooftree",
    "  axiom    \\AxiomC{}",
    "  rlabel   \\RightLabel{}",
    "  unary    \\UnaryInfC{}",
    "  binary   \\BinaryInfC{}",
    "",
    "  tikz     begin + end TikZ picture",
    "",
    "  bold     bold text",
    "  emph     emphasize text",
    "",
    "  sec      \\section*{}",
    "  ssec     \\subsection*{}",
    "  sssec    \\subsubsection*{}",
    "",
    "  vsp      \\vspace{}",
    "  hsp      \\hspace*{}",
  }

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  local width = 50
  local height = #lines + 2

  local opts = {
    relative = "editor",
    width = width,
    height = height,
    row = (vim.o.lines - height*2),
    col = (vim.o.columns - width*1.5),
    style = "minimal",
    border = "rounded",
  }

  local win = vim.api.nvim_open_win(buf, true, opts)

  -- Make it a scratch buffer
  vim.bo[buf].bufhidden = "wipe"
  vim.bo[buf].buftype = "nofile"
  vim.bo[buf].swapfile = false

  -- Close on <Esc>
  vim.keymap.set("n", "<Esc>", function()
    vim.api.nvim_win_close(win, true)
  end, { buffer = buf, silent = true })
end

return open_snippet_cheatsheet
