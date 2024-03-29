local builtin = require('telescope.builtin')

local function send_selected_to_qflist_and_open(prompt_bufnr)
  local selection = require('telescope.actions.state').get_selected_entry(prompt_bufnr)
  require('telescope.actions').send_to_qflist(prompt_bufnr, selection.value)
  require('telescope.actions').open_qflist()
end

vim.keymap.set('n', '<leader>pr', builtin.resume, {})
-- vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pf', function()
  require('telescope.builtin').find_files({
    file_ignore_patterns = { "venv/" },
  })
end, {})
vim.keymap.set('n', '<leader>bf', builtin.buffers, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('i', '<C-w>', send_selected_to_qflist_and_open, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.api.nvim_set_keymap('n', '<leader>tr', '<cmd>Telescope resume<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tk', [[:Telescope keymaps<CR>]], { noremap = true, silent = true })


-- Advanced GIT SEARCH KEYS
require("telescope").setup{
  extensions = {
    advanced_git_search = {
      diff_plugin = "fugitive",
      git_flags = {},
      git_diff_flags = {},
      show_builtin_git_pickers = true,
      entry_default_author_or_date = "author", -- one of "author" or "date"
      -- Telescope layout setup
      telescope_theme = {
        function_name_1 = {
          -- Theme options
        },
        function_name_2 = "dropdown",
        -- e.g. realistic example
        show_custom_functions = {
          layout_config = { width = 0.4, height = 0.4 },
        },

      }
    }
  }
}
require("telescope").load_extension("advanced_git_search")

vim.api.nvim_set_keymap('n', '<leader>tgl', [[:AdvancedGitSearch diff_commit_line<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<leader>tgl', [[:AdvancedGitSearch diff_commit_line<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>tgf', [[:AdvancedGitSearch diff_commit_file<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<leader>tgf', [[:AdvancedGitSearch diff_commit_file<CR>]], { noremap = true, silent = true })
