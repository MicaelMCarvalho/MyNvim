return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local actions = require('telescope.actions')

      -- Default mappings
      require('telescope').setup({})

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
      vim.keymap.set('n', '<leader>tt', '<cmd>Telescope<CR>',  { desc = 'telescope: Menu' })
      vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope: Git files' })
      vim.keymap.set('i', '<C-w>', send_selected_to_qflist_and_open, { desc = 'Telescope: Send selected to qflist and open' })
      vim.keymap.set('n', '<leader>ps', function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") });
      end, { desc = 'Telescope: Grep string' })
      vim.keymap.set('n', '<leader>lg', function()
        require('telescope.builtin').live_grep({
          file_ignore_patterns = { "venv/" },
        })
      end, {desc = 'Telecope: Live grep'})
      vim.keymap.set('n', '<leader>bf', builtin.buffers, { desc = 'Telescope: Buffers' })
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
      vim.api.nvim_set_keymap('v', '<leader>tk', [[:Telescope keymaps<CR>]], { noremap = true, silent = true, desc = 'Show keymaps' })

      vim.keymap.set('n', '<leader>te', function()
          require('telescope.builtin').diagnostics({
              severity = vim.diagnostic.severity.ERROR
          })
      end, {desc = "Search for errors in the current buffers"})
      vim.keymap.set('n', '<leader>ed', function()
          require('telescope.builtin').diagnostics({
          })
      end, {desc = "Search for diagnostics in the current buffers"})

      vim.keymap.set('n', '<leader>pe', function()
        require('telescope.builtin').diagnostics({
          severity = vim.diagnostic.severity.ERROR,
          root_dir = vim.loop.cwd()  -- Search in the entire project directory
        })
      end, {desc = "Search for errors in the entire project"})


      -- defaults = {
        --   mappings = {
          --     i = {
            --       ["<C-x>"] = actions.select_horizontal,
            --       ["<C-v>"] = actions.select_vertical,
            --       ["<C-t>"] = actions.select_tab
            --     },
            --     n = {
              --       ["<C-x>"] = actions.select_horizontal,
              --       ["<C-v>"] = actions.select_vertical,
              --       ["<C-t>"] = actions.select_tab
              --     }
              --   }
              -- },
              -- extensions = {
                --   advanced_git_search = {
                  --     diff_plugin = "fugitive",
                  --     git_flags = {},
                  --     git_diff_flags = {},
                  --     show_builtin_git_pickers = true,
                  --     entry_default_author_or_date = "author",
                  --     telescope_theme = {
                    --       function_name_1 = {},
                    --       function_name_2 = "dropdown",
                    --       show_custom_functions = {
                      --         layout_config = { width = 0.4, height = 0.4 },
                      --       },
                      --     }
                      --   }
                      -- }
                      -- require("telescope").load_extension("advanced_git_search")
                      -- require("telescope").load_extension("flutter")
    end,
    -- keys = {
      --   { "i<C-w>", send_selected_to_qflist_and_open, desc = "Telescope: Send selected to qflist and open", mode = 'i' },
          --   { "<leader>tgl", '<cmd>AdvancedGitSearch diff_commit_line<CR>', desc = "AdvancedGitSearch: Search for commit by line", mode = {'n', 'x'} },
          --   { "<leader>tgf", '<cmd>AdvancedGitSearch diff_commit_file<CR>', desc = "AdvancedGitSearch: Search for commit by file", mode = {'n', 'x'} },
          --   { "<leader>te", function() require('telescope.builtin').diagnostics({ severity = vim.diagnostic.severity.ERROR }) end, desc = "Telescope: Search for errors in the current buffers" },
          --   { "<leader>ed", function() require('telescope.builtin').diagnostics() end, desc = "Telescope: Search for diagnostics in the current buffers" },
  }
}
