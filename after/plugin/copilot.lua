vim.g.copilot_no_tab_map = true

vim.api.nvim_set_keymap('i', '<C-i>', 'copilot#Accept("<CR>")', {silent = true, expr = true, desc = 'copilot: Accept the current suggestion'})

---- Dismiss the current suggestion
vim.api.nvim_set_keymap('i', '<C-,>', '<Plug>(copilot-dismiss)', {silent = true, desc = 'copilot: Dismiss the current suggestion'})

-- Cycle to the next suggestion
vim.api.nvim_set_keymap('i', '<C-m>', '<Plug>(copilot-next)', {silent = true, desc = 'copilot: Cycle to the next suggestion'})

-- Cycle to the previous suggestion
vim.api.nvim_set_keymap('i', '<C-l>', '<Plug>(copilot-previous)', {silent = true, desc = 'copilot: Cycle to the previous suggestion'})

-- Explicitly request a suggestion
-- vim.api.nvim_set_keymap('i', '<M-\\>', '<Plug>(copilot-suggest)', {silent = true})

-- Accept the next word of the current suggestion
vim.api.nvim_set_keymap('i', '<C-j>', '<Plug>(copilot-accept-word)', {silent = true, desc = 'copilot: Accept the next word of the current suggestion'})
-- Accept the next line of the current suggestion
vim.api.nvim_set_keymap('i', '<C-k>', '<Plug>(copilot-accept-line)', {silent = true, desc = 'copilot: Accept the next line of the current suggestion'})


