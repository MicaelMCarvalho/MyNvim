require("sg").setup {
  -- Define your custom key mappings here
  on_attach = function(client)
    local opts = { noremap = true, silent = true }

    -- Set key mapping for "goto definition"
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)

    -- Set key mapping for "goto references"
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(0, 'n', '<Space>ss', '<Cmd>lua require("sg.extensions.telescope").fuzzy_search_results()<CR>', opts)
  end,
}