return
{
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = false,
    config = false,
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0

      vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, {buffer = bufnr, remap = true, desc = "LSP: Workspace symbol"})
      vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, {buffer = bufnr, remap = true, desc = "LSP: Open diagnostic float"})
      vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, {buffer = bufnr, remap = true, desc = "LSP: Go to next diagnostic"})
      vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, {buffer = bufnr, remap = true, desc = "LSP: Go to previous diagnostic"})
      vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, {buffer = bufnr, remap = true, desc = "LSP: Code action"})
      vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, {buffer = bufnr, remap = true, desc = "LSP: References"})
      vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, {buffer = bufnr, remap = true, desc = "LSP: Rename"})
      vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, {buffer = bufnr, remap = true, desc = "LSP: Signature help"})
      vim.keymap.set("n", "<leader>l", function() vim.diagnostic.open_float(0, {scope="line"}) end, {buffer = bufnr, remap = true, desc = "LSP: Open line diagnostic float"})
      vim.keymap.set("n", "<leader>vi", "<cmd>lua vim.lsp.buf.formatting()<CR>", {buffer = bufnr, remap = true, desc = "LSP: Format"})
    end,
  },
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
    dependencies = {
      {'L3MON4D3/LuaSnip'},
    },
    config = function()
      -- Here is where you configure the autocompletion settings.
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_cmp()

      -- And you can configure cmp even more, if you want to.
      local cmp = require('cmp')
      local cmp_action = lsp_zero.cmp_action()

      cmp.setup({
        formatting = lsp_zero.cmp_format({details = true}),
        mapping = cmp.mapping.preset.insert({
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<leader>su'] = cmp.mapping.scroll_docs(-4),
          ['<leader>sd'] = cmp.mapping.scroll_docs(4),
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        }),
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
      })
    end
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = {'LspInfo', 'LspInstall', 'LspStart'},
    event = {'BufReadPre', 'BufNewFile'},
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'williamboman/mason-lspconfig.nvim'},
    },
    config = function()
      -- This is where all the LSP shenanigans will live
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()

      --- if you want to know more about lsp-zero and mason.nvim
      --- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({buffer = bufnr})
      end)

      require('mason-lspconfig').setup({
        ensure_installed = {},
        handlers = {
          -- this first function is the "default handler"
          -- it applies to every language server without a "custom handler"
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end,
        }
      })
      require("lspconfig").dartls.setup({
        cmd = { "dart", "language-server", "--protocol=lsp" },
      })
      require('lspconfig').lua_ls.setup {
      settings = {
        Lua = {
          runtime = {
            -- Use LuaJIT for Neovim
            version = 'LuaJIT',
          },
          diagnostics = {
            -- Recognize the `vim` global to avoid the undefined global warning
            globals = { 'vim' },
          },
          workspace = {
            -- Make the language server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,  -- Disable third-party library checks
          },
          telemetry = {
            -- Disable telemetry for privacy
            enable = false,
          },
        },
      },
    }

    end
  }
}
