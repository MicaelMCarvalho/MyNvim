-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'jay-babu/mason-nvim-dap.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('ThePrimeagen/harpoon')
  use('mbbill/undotree')
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

  --use ('airblade/vim-gitgutter')
  use ('Yggdroot/indentLine')
  use ('numToStr/Comment.nvim')

  use ('vimwiki/vimwiki')

  -- use ('mfussenegger/nvim-dap')
  -- use { 'rcarriga/nvim-dap-ui', requires = {'mfussenegger/nvim-dap'} }
  -- use 'Pocco81/DAPInstall.nvim'
  -- use 'leoluz/nvim-dap-go'
  -- use ('puremourning/vimspector')

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

  
end)
