vim.api.nvim_set_keymap('i', '<Tab>', 'copilot#Accept("<CR>")', {silent = true, expr = true})
-- vim.api.nvim_set_keymap('i', '<leader>cn', 'copilot#NextSuggestion()', {silent = true})
-- vim.api.nvim_set_keymap('i', '<leader>cp', 'copilot#PreviousSuggestion()', {silent = true})
-- vim.api.nvim_set_keymap('i', '<leader>ce', 'copil#Enable()', {silent = true})


-- local buf = vim.api.nvim_get_current_buf()
-- viim.api.nvim_buf_set_var(buf, "workspace_folder", "~/Projects/myproject")

--
-- require'copilot'.setup{
--     on_done = function()
--         vim.g.copilot_workspace_folders = { vim.fn.getcwd() }
--     end,
--     keymap = {
--         insert_mode = {
--             ["<C-L>"] = "<Plug>(copilot-accept-word)"
--         }
--     },
--     filetypes = {
--         markdown = true
--     },
--     cmd = "Copilot",
-- }
--
---- Dismiss the current suggestion
vim.api.nvim_set_keymap('i', '<C-,>', '<Plug>(copilot-dismiss)', {silent = true})

-- Cycle to the next suggestion
vim.api.nvim_set_keymap('i', '<C-m>', '<Plug>(copilot-next)', {silent = true})

-- Cycle to the previous suggestion
vim.api.nvim_set_keymap('i', '<C-l>', '<Plug>(copilot-previous)', {silent = true})

-- Explicitly request a suggestion
-- vim.api.nvim_set_keymap('i', '<M-\\>', '<Plug>(copilot-suggest)', {silent = true})

-- Accept the next word of the current suggestion
vim.api.nvim_set_keymap('i', '<C-j>', '<Plug>(copilot-accept-word)', {silent = true})
-- Accept the next line of the current suggestion
vim.api.nvim_set_keymap('i', '<C-k>', '<Plug>(copilot-accept-line)', {silent = true})


