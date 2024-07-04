local mappings = {
  { 'n', '<leader>bb', ':lua require("buffer_manager.ui").toggle_quick_menu()<CR>', { noremap = true, silent = true, desc = 'Toggle buffer manager' } },
  { 'n', '<leader>bd', ':lua require("buffer_manager.ui").delete_buffer()<CR>', { noremap = true, silent = true, desc = 'Delete buffer' } },
  { 'n', '<leader>ba', ':lua require("buffer_manager.ui").delete_all_buffers()<CR>', { noremap = true, silent = true, desc = 'Delete all buffers' } },
  { 'n', '<leader>bs', ':lua require("buffer_manager.ui").search_buffer()<CR>', { noremap = true, silent = true, desc = 'Search buffer' } },
  { 'n', '<leader>bl', ':lua require("buffer_manager.ui").list_buffers()<CR>', { noremap = true, silent = true, desc = 'List buffers' } },
  { 'n', '<leader>bn', ':lua require("buffer_manager.ui").nav_next()<CR>', { noremap = true, silent = true, desc = 'Navigate to next buffer' } },
  { 'n', '<leader>bp', ':lua require("buffer_manager.ui").nav_prev()<CR>', { noremap = true, silent = true, desc = 'Navigate to previous buffer' } },
  { 'n', '<leader>ba', ':lua require("buffer_manager.ui").delete_all_buffers()<CR>', { noremap = true, silent = true, desc = 'Delete all buffers' } },
  { 'n', '<leader>bl', ':lua require("buffer_manager.ui").list_buffers()<CR>', { noremap = true, silent = true, desc = 'List buffers' } },
}

for _, mapping in ipairs(mappings) do
  vim.api.nvim_set_keymap(mapping[1], mapping[2], mapping[3], mapping[4] or {})
end
