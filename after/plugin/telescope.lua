local builtin = require('telescope.builtin')

local function send_selected_to_qflist_and_open(prompt_bufnr)
  local selection = require('telescope.actions.state').get_selected_entry(prompt_bufnr)
  require('telescope.actions').send_to_qflist(prompt_bufnr, selection.value)
  require('telescope.actions').open_qflist()
end

vim.keymap.set('n', '<leader>pr', builtin.resume, { desc = 'Telescope: Resume last list' })
-- vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pf', function()
  require('telescope.builtin').find_files({
    file_ignore_patterns = { "venv/" },
  })

end, {desc = 'Telecope: Find files'})
vim.keymap.set('n', '<leader>bf', builtin.buffers, { desc = 'Telescope: Buffers' })
vim.keymap.set('n', '<leader>tt', '<cmd>Telescope<CR>',  { desc = 'telescope: buffers' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope: Git files' })
vim.keymap.set('i', '<C-w>', send_selected_to_qflist_and_open, { desc = 'Telescope: Send selected to qflist and open' })
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, { desc = 'Telescope: Grep string' })
vim.keymap.set('n', '<leader>pu', function()
  local current_word = vim.fn.expand("<cword>")
  require('telescope.builtin').grep_string({
    search = current_word,
    file_ignore_patterns = { "venv/" }
  })
end, {desc = "Search for the word under cursor"})

vim.keymap.set('v', '<leader>pu', function()
  vim.cmd('normal! "vy')
  local selected_text = vim.fn.getreg('v')
  require('telescope.builtin').grep_string({
    search = selected_text,
    file_ignore_patterns = { "venv/" }
  })
  vim.cmd('normal! <esc>')
end, {desc = "Search for the selected text"})



vim.api.nvim_set_keymap('n', '<leader>tr', '<cmd>Telescope resume<CR>', { noremap = true, silent = true, desc = 'Resume last telescope list' })
vim.api.nvim_set_keymap('n', '<leader>tk', [[:Telescope keymaps<CR>]], { noremap = true, silent = true, desc = 'Show keymaps' })


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

vim.api.nvim_set_keymap('n', '<leader>tgl', [[:AdvancedGitSearch diff_commit_line<CR>]], { noremap = true, silent = true, desc = 'AdvancedGitSearch: Search for commit by line' })
vim.api.nvim_set_keymap('x', '<leader>tgl', [[:AdvancedGitSearch diff_commit_line<CR>]], { noremap = true, silent = true, desc = 'AdvancedGitSearch: Search for commit by line' })

vim.api.nvim_set_keymap('n', '<leader>tgf', [[:AdvancedGitSearch diff_commit_file<CR>]], { noremap = true, silent = true, desc = 'AdvancedGitSearch: Search for commit by file' })
vim.api.nvim_set_keymap('x', '<leader>tgf', [[:AdvancedGitSearch diff_commit_file<CR>]], { noremap = true, silent = true, desc = 'AdvancedGitSearch: Search for commit by file' })

require("telescope").load_extension("flutter")

local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    mappings = {
      i = {  -- 'i' for insert mode in the Telescope prompt
        ["<C-x>"] = actions.select_horizontal,  -- Open in horizontal split
        ["<C-v>"] = actions.select_vertical,    -- Open in vertical split
        ["<C-t>"] = actions.select_tab          -- Open in new tab
      },
      n = {  -- 'n' for normal mode in the Telescope prompt
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab
      }
    }
  }
}

vim.keymap.set('n', '<leader>te', function()
    require('telescope.builtin').diagnostics({
        severity = vim.diagnostic.severity.ERROR
    })
end, {desc = "Search for errors in the current buffers"})
vim.keymap.set('n', '<leader>ed', function()
    require('telescope.builtin').diagnostics({
    })
end, {desc = "Search for diagnostics in the current buffers"})

