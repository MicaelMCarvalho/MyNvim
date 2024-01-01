local signs = require("gitsigns")

signs.setup {
  signs = {
    add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr" },
    change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr" },
    delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr" },
    topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr" },
    changedelete = { hl = "GitSignsDelete", text = "~", numhl = "GitSignsChangeNr" },
  },

  -- Highlights just the number part of the number column
  numhl = true,

  -- Highlights the _whole_ line.
  --    Instead, use gitsigns.toggle_linehl()
  linehl = false,

  -- Highlights just the part of the line that has changed
  --    Instead, use gitsigns.toggle_word_diff()
  word_diff = false,

  -- TODO: Figure out what the new thing is for keymaps and git signs
  -- keymaps = {
  --   -- Default keymap options
  --   noremap = true,
  --   buffer = true,
  --
  --   ["n <space>hd"] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'" },
  --   ["n <space>hu"] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'" },
  --
  --   -- ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
  --   -- ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
  --   -- ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
  --   -- ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
  --   -- ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',
  -- },

  signcolumn = true,  -- enable sign column for vertical alignment
  signs = {
    GitSignsAdd = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr" },
    GitSignsChange = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr" },
    GitSignsDelete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr" },
  },
  sign_priority = 6,

  current_line_blame_opts = {
    delay = 2000,
    virt_text_pos = "eol",
  },
}

vim.cmd([[highlight GitSignsAdd guibg=NONE]])
vim.cmd([[highlight GitSignsChange guibg=NONE]])
vim.cmd([[highlight GitSignsDelete guibg=NONE]])
