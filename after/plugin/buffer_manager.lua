local mappings = {
  { 'n', '<leader>bb', ':lua require("buffer_manager.ui").toggle_quick_menu()<CR>', { noremap = true, silent = true } },
  { 'n', '<leader>bn', ':lua require("buffer_manager.ui").nav_next()<CR>', { noremap = true, silent = true } },
  { 'n', '<leader>bp', ':lua require("buffer_manager.ui").nav_prev()<CR>', { noremap = true, silent = true } },
}

for _, mapping in ipairs(mappings) do
  vim.api.nvim_set_keymap(mapping[1], mapping[2], mapping[3], mapping[4] or {})
end
