vim.api.nvim_set_keymap('n', '<S-CR>', ':JupyterCellExecute<CR>', { silent = true })
vim.api.nvim_set_keymap('i', '<S-CR>', '<Esc>:JupyterCellExecute<CR>O', { silent = true })

-- Open Jupyter Notebook in Neovim for .ipynb files
local function open_jupyter_notebook(filename)
    if filename:match('%.ipynb$') then
        vim.cmd('e ' .. filename)
    else
        print('Only .ipynb files are supported.')
    end
end

