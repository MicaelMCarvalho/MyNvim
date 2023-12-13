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
-- require('gitsigns').setup {
--   signs = {
--     add          = { text = '│' },
--     change       = { text = '│' },
--     delete       = { text = '_' },
--     topdelete    = { text = '‾' },
--     changedelete = { text = '~' },
--     untracked    = { text = '┆' },
--   },
--   signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
--   numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
--   linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
--   word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
--   watch_gitdir = {
--     follow_files = true
--   },
--   attach_to_untracked = true,
--   current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
--   current_line_blame_opts = {
--     virt_text = true,
--     virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
--     delay = 1000,
--     ignore_whitespace = false,
--     virt_text_priority = 100,
--   },
--   current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
--   sign_priority = 6,
--   update_debounce = 100,
--   status_formatter = nil, -- Use default
--   max_file_length = 40000, -- Disable if file is longer than this (in lines)
--   preview_config = {
--     -- Options passed to nvim_open_win
--     border = 'single',
--     style = 'minimal',
--     relative = 'cursor',
--     row = 0,
--     col = 1
--   },
--   yadm = {
--     enable = false
--   },
-- }
