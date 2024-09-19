return {
  {
    "preservim/vim-markdown",  -- The markdown plugin
    ft = "markdown",  -- Only load for markdown files
    -- config = function()
    --   -- Enable folding based on markdown headers
    --   vim.g.vim_markdown_folding_disabled = 0
    --
    --   -- Set the fold method to syntax so it works with markdown
    --   vim.opt.foldmethod = "syntax"
    --
    --   -- Optionally customize fold text appearance
    --   vim.opt.foldtext = "getline(v:foldstart).'...'"
    --
    --   -- Correctly set the fillchars for folds
    --   vim.opt.fillchars = { fold = " " }  -- Use a space character for fold indicator
    --
    --   vim.opt.foldlevel = 99
    --
    --
    --   -- Automatically open all folds when opening a markdown file
    --   vim.cmd([[
    --     autocmd FileType markdown setlocal foldlevel=99
    --   ]])
    --
    --   vim.api.nvim_set_keymap("n", "za", "za", { noremap = true, silent = true, desc = "Markdown Toggle fold under cursor" })
    --   vim.api.nvim_set_keymap("n", "zM", "zM", { noremap = true, silent = true, desc = "Markdown Close all folds" })
    --   vim.api.nvim_set_keymap("n", "zR", "zR", { noremap = true, silent = true, desc = "Markdown Open all folds" })
    --   vim.api.nvim_set_keymap("n", "zc", "zc", { noremap = true, silent = true, desc = "Markdown Close fold under cursor" })
    --   vim.api.nvim_set_keymap("n", "zo", "zo", { noremap = true, silent = true, desc = "Markdown Open fold under cursor" })
    --
    -- end
  }
}
