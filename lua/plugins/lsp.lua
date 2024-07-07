return {
  {
    "nvim-lua/plenary.nvim",
    lazy = false,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local actions = require('telescope.actions')

      local builtin = require('telescope.builtin')

      local function send_selected_to_qflist_and_open(prompt_bufnr)
        local selection = require('telescope.actions.state').get_selected_entry(prompt_bufnr)
        require('telescope.actions').send_to_qflist(prompt_bufnr, selection.value)
        require('telescope.actions').open_qflist()
      end

      vim.keymap.set('n', '<leader>pr', builtin.resume, { desc = 'Telescope: Resume last list' })
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

      vim.keymap.set('n', '<leader>te', function()
        require('telescope.builtin').diagnostics({
            severity = vim.diagnostic.severity.ERROR
        })
      end, {desc = "Search for errors in the current buffers"})
      vim.keymap.set('n', '<leader>ed', function()
        require('telescope.builtin').diagnostics({
        })
      end, {desc = "Search for diagnostics in the current buffers"})
    end,
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    -- branch = "v1.x",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip"
    },
    config = function()
      local lsp = require("lsp-zero")
      lsp.preset("recommended")
      lsp.ensure_installed({
        'tsserver',
        'rust_analyzer',
      })

      -- Fix Undefined global 'vim'
      lsp.nvim_workspace()

      local cmp = require('cmp')
      local cmp_select = {behavior = cmp.SelectBehavior.Select}
      local cmp_mappings = lsp.defaults.cmp_mappings({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      })

      cmp_mappings['<Tab>'] = nil
      cmp_mappings['<S-Tab>'] = nil

      lsp.setup_nvim_cmp({
        mapping = cmp_mappings
      })

      lsp.set_preferences({
        suggest_lsp_servers = false,
        sign_icons = {
          error = 'e',
          warn = 'w',
          hint = 'h',
          info = 'i'
        }
      })

      lsp.on_attach(function(client, bufnr)
        local opts = {buffer = bufnr, remap = false}
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, {buffer = bufnr, remap = true, desc = "LSP: Go to definition"})
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, {buffer = bufnr, remap = true, desc = "LSP: Hover"})
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, {buffer = bufnr, remap = true, desc = "LSP: Workspace symbol"})
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, {buffer = bufnr, remap = true, desc = "LSP: Open diagnostic float"})
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, {buffer = bufnr, remap = true, desc = "LSP: Go to next diagnostic"})
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, {buffer = bufnr, remap = true, desc = "LSP: Go to previous diagnostic"})
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, {buffer = bufnr, remap = true, desc = "LSP: Code action"})
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, {buffer = bufnr, remap = true, desc = "LSP: References"})
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, {buffer = bufnr, remap = true, desc = "LSP: Rename"})
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, {buffer = bufnr, remap = true, desc = "LSP: Signature help"})
        vim.keymap.set("n", "<leader>l", function() vim.diagnostic.open_float(0, {scope="line"}) end, {buffer = bufnr, remap = true, desc = "LSP: Open line diagnostic float"})
      end)

      lsp.setup()

      _G.lsp_warnings_hidden = false

      -- Function to toggle the visibility of LSP warnings
      function Toggle_lsp_warnings()
        if _G.lsp_warnings_hidden then
          vim.diagnostic.config({
            virtual_text = false,
            virtual_lines = false,
          })
        else
          vim.diagnostic.config({
            virtual_text = true,
            virtual_lines = true,
          })
        end
      end

      -- Map a key to toggle the visibility of LSP warnings
      vim.api.nvim_set_keymap('n', '<leader>lw', '<cmd>lua Toggle_lsp_warnings()<CR>', { noremap = true, silent = true })

      vim.diagnostic.config({
        virtual_text = true
      })

      require('lspconfig').volar.setup{
        filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
        init_options = {
          typescript = {
            tsdk = '/path/to/.npm/lib/node_modules/typescript/lib'
            -- Alternative location if installed as root:
            -- tsdk = '/usr/local/lib/node_modules/typescript/lib'
          }
        }
      }
      require('lspconfig').vuels.setup{}
      require('lspconfig').tsserver.setup{}

      require('lspconfig').csharp_ls.setup{
        root_dir = function()
          return lsp.dir.find_first({'.gitignore'})
        end,
        AutomaticWorkspaceInit = true,
      }

      require('lspconfig').fsautocomplete.setup{
        AutomaticWorkspaceInit = true,
      }

      require('lspconfig').gopls.setup{
        cmd = {"gopls", "serve"},
        on_attach = function(client)
          print('Language server attached!')
        end,
      }
    end,
  },
}
