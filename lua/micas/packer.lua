-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'jay-babu/mason-nvim-dap.nvim'

  use {
	  -- 'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  'nvim-telescope/telescope.nvim',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- use {
  --     'sourcegraph/sg.nvim', run = 'nvim -l build/init.lua'
  -- }

  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('mbbill/undotree')
  use{
      'ThePrimeagen/harpoon',
      branch = 'harpoon2',
      requires = {{'nvim-lua/plenary.nvim'}}
  }
  use('tpope/vim-fugitive')

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

  use('m4xshen/autoclose.nvim')
  --use('github/copilot.vim')

  -- use ('airblade/vim-gitgutter')
  use ('lewis6991/gitsigns.nvim')
  use ('tjdevries/colorbuddy.nvim')
  use ('Yggdroot/indentLine')
  use ('numToStr/Comment.nvim')

  use ('vimwiki/vimwiki')


  -- DAP
  use {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-telescope/telescope-dap.nvim",

      --  Adaparter configuration for specific languages
      { "leoluz/nvim-dap-go" },
      { "mfussenegger/nvim-dap-python" },
      "jbyuki/one-small-step-for-vimkind",

  }

  use {
	  'j-morano/buffer_manager.nvim',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use ('rmagatti/auto-session')
  -- use 'andweeb/presence.nvim'

  use 'jupyter-vim/jupyter-vim'

  use({
      "epwalsh/obsidian.nvim",
      requires = {
          -- Required.
          "nvim-lua/plenary.nvim",
          -- see below for full list of optional dependencies 👇
      },
  })
  use { "catppuccin/nvim", as = "catppuccin" }

  use({
    "aaronhallaert/advanced-git-search.nvim",
    requires = {
      "nvim-telescope/telescope.nvim",
      "tpope/vim-fugitive",
      "tpope/vim-rhubarb",
    },
  })
end)
