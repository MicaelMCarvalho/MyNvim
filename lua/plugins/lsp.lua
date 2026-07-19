return
{
  -- lsp-zero core (helpers for cmp/default keymaps)
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = false,
    config = false,
    init = function()
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },

  -- Mason (installer UI)
  {
    'williamboman/mason.nvim',
    lazy = true,
    config = true,
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    lazy = false,
    event = 'InsertEnter',
    dependencies = { 'L3MON4D3/LuaSnip' },
    config = function()
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_cmp()

      local cmp = require('cmp')
      local cmp_action = lsp_zero.cmp_action()

      cmp.setup({
        formatting = lsp_zero.cmp_format({ details = true }),
        mapping = cmp.mapping.preset.insert({
          ['<C-y>']      = cmp.mapping.confirm({ select = true }),
          ['<C-Space>']  = cmp.mapping.complete(),
          ['<leader>su'] = cmp.mapping.scroll_docs(-4),
          ['<leader>sd'] = cmp.mapping.scroll_docs(4),
          ['<C-f>']      = cmp_action.luasnip_jump_forward(),
          ['<C-b>']      = cmp_action.luasnip_jump_backward(),
        }),
        snippet = { expand = function(args) require('luasnip').lsp_expand(args.body) end },
      })
    end
  },

  -- LSP (Neovim 0.11+ core API style via vim.lsp.start with plain configs)
  {
    'neovim/nvim-lspconfig', -- we don't call server.setup(); just use our own autocmds
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      local lsp_zero = require('lsp-zero')
      local cmp_caps = require('cmp_nvim_lsp').default_capabilities()

      require('mason-lspconfig').setup({
        ensure_installed = {}, -- keep empty; install via :Mason UI
        automatic_installation = false,
      })

      -- Common on_attach: your keymaps live here (bufnr is valid)
      local function on_attach(_, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
        local opts = { buffer = bufnr, remap = true, desc = '' }

        vim.keymap.set("n", "gd", vim.lsp.buf.definition,
          vim.tbl_extend("force", opts, { desc = "LSP: Go to definition" }))
        vim.keymap.set("n", "K", vim.lsp.buf.hover,
          vim.tbl_extend("force", opts, { desc = "LSP: Hover" }))
        vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol,
          vim.tbl_extend('force', opts, { desc = "LSP: Workspace symbol" }))
        vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float,
          vim.tbl_extend('force', opts, { desc = "LSP: Open diagnostic float" }))
        vim.keymap.set("n", "<leader>ln", vim.diagnostic.goto_next,
          vim.tbl_extend('force', opts, { desc = "LSP: Next diagnostic" }))
        vim.keymap.set("n", "<leader>lp", vim.diagnostic.goto_prev,
          vim.tbl_extend('force', opts, { desc = "LSP: Prev diagnostic" }))
        vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action,
          vim.tbl_extend('force', opts, { desc = "LSP: Code action" }))
        vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references,
          vim.tbl_extend('force', opts, { desc = "LSP: References" }))
        vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename,
          vim.tbl_extend('force', opts, { desc = "LSP: Rename" }))
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help,
          vim.tbl_extend('force', opts, { desc = "LSP: Signature help" }))
        vim.keymap.set("n", "<leader>ll", function() vim.diagnostic.open_float(0, { scope = "line" }) end,
          vim.tbl_extend('force', opts, { desc = "LSP: Line diagnostics" }))
        vim.keymap.set("n", "<leader>vi", function() vim.lsp.buf.format({ async = false }) end,
          vim.tbl_extend('force', opts, { desc = "LSP: Format" }))
      end

      -- Helper to compose config (no vim.lsp.config call!)
      local function make(base)
        base.capabilities = vim.tbl_deep_extend('force', {}, cmp_caps, base.capabilities or {})
        base.on_attach    = base.on_attach or on_attach
        return base
      end

      --------------------------------------------------------------------
      -- Servers (started via autocmd + vim.lsp.start)
      --------------------------------------------------------------------

      -- Lua
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'lua',
        callback = function(args)
          local root = vim.fs.root(args.buf, { '.luarc.json', '.luarc.jsonc', '.git' }) or vim.loop.cwd()
          vim.lsp.start(make({
            name     = 'lua_ls',
            cmd      = { 'lua-language-server' },
            root_dir = root,
            settings = {
              Lua = {
                runtime = { version = 'LuaJIT' },
                diagnostics = { globals = { 'vim' } },
                workspace = {
                  library = vim.api.nvim_get_runtime_file('', true),
                  checkThirdParty = false,
                },
                telemetry = { enable = false },
              },
            },
          }))
        end,
      })

      -- TypeScript / JavaScript
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' },
        callback = function(args)
          local root = vim.fs.root(args.buf, { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' })
          if not root then return end
          vim.lsp.start(make({
            name                = 'ts_ls',
            cmd                 = { 'typescript-language-server', '--stdio' },
            root_dir            = root,
            single_file_support = true,
          }))
        end,
      })


      -- Vue (Volar)
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'vue',
        callback = function(args)
          local root = vim.fs.root(args.buf, { 'package.json', 'vite.config.ts', 'vite.config.js', '.git' })
          if not root then return end
          vim.lsp.start(make({
            name     = 'volar',
            cmd      = { 'vue-language-server', '--stdio' },
            root_dir = root,
          }))
        end,
      })

      -- Dart
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'dart' },
        callback = function(args)
          local root = vim.fs.root(args.buf, { 'pubspec.yaml', '.git' })
          vim.lsp.start(make({
            name     = 'dartls',
            cmd      = { 'dart', 'language-server', '--protocol=lsp' },
            root_dir = root,
          }))
        end,
      })


      -- Tailwind CSS (official LSP)
      vim.api.nvim_create_autocmd('FileType', {
        pattern = {
          'javascript',
          'javascriptreact',
          'typescript',
          'typescriptreact',
          'html',
          'css',
          'scss',
          'svelte',
          'vue',
        },
        callback = function(args)
          -- try to find the project root where Tailwind is configured
          local root = vim.fs.root(args.buf, {
            'tailwind.config.js',
            'tailwind.config.mjs',
            'tailwind.config.cjs',
            'tailwind.config.ts',
            'postcss.config.js',
            'postcss.config.cjs',
            'package.json',
            '.git',
          })
          if not root then return end

          -- don't start if the binary is missing
          if vim.fn.executable('tailwindcss-language-server') == 0 then
            return
          end

          vim.lsp.start(make({
            name                = 'tailwindcss',
            cmd                 = { 'tailwindcss-language-server', '--stdio' },
            root_dir            = root,
            -- Tailwind understands JSX/TSX and utilities in helpers like cn() / cva()
            settings            = {
              tailwindCSS = {
                experimental = {
                  classRegex = {
                    -- for class-variance-authority
                    'cva\\(([^)]*)\\)',
                    -- for clsx/cn helpers
                    'cn\\(([^)]*)\\)',
                  },
                },
              },
            },
            single_file_support = true,
          }))
        end,
      })

      -- ESLint – start only if local eslint exists
      -- vim.api.nvim_create_autocmd('FileType', {
      --   pattern = {
      --     'javascript',
      --     'typescript',
      --     'javascriptreact',
      --     'typescriptreact',
      --     'vue',
      --     'svelte',
      --   },
      --   callback = function(args)
      --     -- encontra a root do projeto
      --     local root = vim.fs.root(args.buf, {
      --       'eslint.config.js',
      --       'eslint.config.mjs',
      --       'eslint.config.cjs',
      --       '.eslintrc',
      --       '.eslintrc.js',
      --       '.eslintrc.cjs',
      --       '.eslintrc.json',
      --       'package.json',
      --       '.git',
      --     })
      --     if not root then return end
      --
      --     -- só arranca se houver eslint local
      --     local has_eslint = vim.loop.fs_stat(root .. '/node_modules/eslint/package.json') ~= nil
      --     if not has_eslint then return end
      --
      --     -- só arranca se o servidor existir
      --     if vim.fn.executable('vscode-eslint-language-server') == 0 then
      --       return
      --     end
      --
      --     vim.lsp.start(make({
      --       name     = 'eslint',
      --       cmd      = { 'vscode-eslint-language-server', '--stdio' },
      --       root_dir = root,
      --       settings = {
      --         -- isto é basicamente o equivalente às settings do plugin de VSCode
      --         validate            = 'on',
      --         useESLintClass      = true,
      --
      --         -- estás em ESLint 9 + flat config, por isso:
      --         useFlatConfig       = true,
      --         experimental        = { useFlatConfig = false },
      --
      --         run                 = 'onType',
      --         problems            = { shortenToSingleLine = false },
      --         codeAction          = {
      --           disableRuleComment = {
      --             enable   = true,
      --             location = 'separateLine',
      --           },
      --           showDocumentation = {
      --             enable = true,
      --           },
      --         },
      --         codeActionOnSave    = { enable = false, mode = 'all' },
      --         format              = false,
      --         quiet               = false,
      --         onIgnoredFiles      = 'off',
      --         rulesCustomizations = {},
      --         nodePath            = nil, -- deixa o servidor resolver o node_modules
      --
      --         -- crítico para não rebentar com paths marados
      --         workingDirectory    = { mode = 'location' },
      --       },
      --     }))
      --   end,
      -- })



      -- Custom Elements (workaround: disable workspaceFolders to avoid ERR_INVALID_FILE_URL_HOST)
      -- vim.api.nvim_create_autocmd('FileType', {
      --   pattern = {
      --     'javascript',
      --     'typescript',
      --     'javascriptreact',
      --     'typescriptreact',
      --     'html',
      --     'svelte',
      --     'vue',
      --   },
      --   callback = function(args)
      --     -- só arranca se existir custom-elements.json na árvore
      --     local root = vim.fs.root(args.buf, { 'custom-elements.json' })
      --     if not root then
      --       return
      --     end
      --
      --     -- só arranca se o binário existir
      --     if vim.fn.executable('custom-elements-languageserver') == 0 then
      --       return
      --     end
      --
      --     local caps = { workspace = { workspaceFolders = false } }
      --
      --     vim.lsp.start({
      --       name = 'custom_elements_ls',
      --       cmd = { 'custom-elements-languageserver', '--stdio' },
      --       root_dir = root,
      --       single_file_support = true,
      --       capabilities = vim.tbl_deep_extend('force', {}, caps),
      --     })
      --   end,
      -- })

      -- ENV NOTE: Copilot & many JS LSPs prefer Node 22+
      -- Ensure Neovim runs with Node 22 on PATH (e.g. via nvm).
    end
  },

  {
    'esmuellert/nvim-eslint',
    ft = {
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
      'vue',
      'svelte',
    },
    config = function()
      require('nvim-eslint').setup({
        -- as defaults já estão preparadas para ESLint 9 + flat config
        -- e para casos com eslint.config.js na raiz do projeto
      })
    end,
  },
}
