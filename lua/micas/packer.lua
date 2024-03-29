vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use ('wbthomason/packer.nvim')

  -- Theme and colors
  use { "catppuccin/nvim", as = "catppuccin" }
  use ('tjdevries/colorbuddy.nvim')
  -- use ({
  --   'rose-pine/neovim',
  --   as = 'rose-pine',
  --   config = function()
  --     vim.cmd('colorscheme rose-pine')
  --   end
  -- })

  -- buffers management
  use{
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    requires = {{'nvim-lua/plenary.nvim'}}
  }
  use {
    'j-morano/buffer_manager.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use ('rmagatti/auto-session') -- Session Manager

  -- helpers
  use ('m4xshen/autoclose.nvim') -- autoclose ( { [
  use ('numToStr/Comment.nvim') -- comment line hotkeys
  use ('Yggdroot/indentLine')
  use ('mbbill/undotree')

  -- TELESCOPE
  use {
    -- 'nvim-telescope/telescope.nvim', tag = '0.1.1',
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Syntax Highlight
  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use ('nvim-treesitter/playground')
  use ('tpope/vim-fugitive')

  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  }

  -- DAP
  use {
    "jay-babu/mason-nvim-dap.nvim",
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-telescope/telescope-dap.nvim",
    --  Adaparter configuration for specific languages
    "leoluz/nvim-dap-go",
    "mfussenegger/nvim-dap-python",
    "jbyuki/one-small-step-for-vimkind",
  }

  use {
    'akinsho/flutter-tools.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
  }

  -- use {
  --   "microsoft/vscode-js-debug",
  --   opt = true,
  --   run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out" 
  -- }

  -- DAP END


  -- git related 
  use ('lewis6991/gitsigns.nvim')
  -- use ('airblade/vim-gitgutter')
  use ({
    "aaronhallaert/advanced-git-search.nvim",
    requires = {
      "nvim-telescope/telescope.nvim",
      "tpope/vim-fugitive",
      "tpope/vim-rhubarb",
    },
  })

  -- JS html autotag (if I do <div> it adds the close </div>)
  use {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end
  }

  -- Notes
  use ('vimwiki/vimwiki')
  -- use ({
  --   "epwalsh/obsidian.nvim",
  --   requires = {
  --     -- Required.
  --     "nvim-lua/plenary.nvim",
  --     -- see below for full list of optional dependencies 👇
  --   },
  -- })


  use ('jupyter-vim/jupyter-vim')

  -- Maybe will use in the future
  use ('github/copilot.vim')
  -- use ('zbirenbaum/copilot.lua')

  -- Obsidian
  --

end)
