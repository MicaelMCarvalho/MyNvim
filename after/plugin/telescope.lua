local builtin = require('telescope.builtin')
local function send_selected_to_qflist_and_open(prompt_bufnr)
  local selection = require('telescope.actions.state').get_selected_entry(prompt_bufnr)
  require('telescope.actions').send_to_qflist(prompt_bufnr, selection.value)
  require('telescope.actions').open_qflist()
end
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>bf', builtin.buffers, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('i', '<C-w>', send_selected_to_qflist_and_open, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.api.nvim_set_keymap('n', '<leader>tr', '<cmd>Telescope resume<CR>', { noremap = true, silent = true })
