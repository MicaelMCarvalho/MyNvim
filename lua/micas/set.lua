vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "80" --vertical

vim.g.mapleader = " "

vim.o.title = true
-- vim.o.titlestring = "%f"
vim.o.titlestring = "%{expand(\"%:p:h\")}"

vim.opt.ignorecase = true
vim.opt.smartcase = true

--local parent_dir = vim.fn.fnamemodify(vim.fn.expand('%'), ':h')
--vim.o.titlestring = parent_dir

vim.api.nvim_exec([[
  augroup FileSettings
    autocmd!
    autocmd FileType vue,js setlocal tabstop=2 softtabstop=2 shiftwidth=2
  augroup END
]], false)

vim.g.markdown_syntax_conceal = 0
vim.g.vim_json_conceal = 0

vim.g.python3_host_prog = '/usr/bin/python3'

vim.api.nvim_set_keymap('n', '<leader>s2', [[:set softtabstop=2 shiftwidth=2 tabstop=2<CR>]], {noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>s4', [[:set softtabstop=4 shiftwidth=4 tabstop=4<CR>]], {noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sc', [[:set conceallevel=0<CR>]], {noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sw', [[:set wrap linebreak<CR>]], {noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>js', [[:%!python -m json.tool<CR>]], {noremap = true, silent = true })


vim.api.nvim_create_user_command(
  'ToggleWhitespace',
  'set list!',
  {desc = 'Toggle display of whitespace characters'}
)

-- Remove trailing whitespace
vim.api.nvim_create_user_command(
  'RemoveTrailingSpaces',
  '%s/\\s\\+$//e',
  {desc = 'Remove trailing whitespace from the document'}
)

-- Set specific list characters
vim.api.nvim_create_user_command(
  'SetListChars',
  'set list listchars=tab:>-,trail:·,eol:↲',
  {desc = 'Set specific characters for tabs, trailing spaces, and EOL'}
)

-- Reset list characters
vim.api.nvim_create_user_command(
  'ResetListChars',
  'set list listchars=',
  {desc = 'Reset list characters to default'}
)

vim.api.nvim_set_keymap('n', '<leader>tw', ':ToggleWhitespace<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rs', ':RemoveTrailingSpaces<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sel', ':SetListChars<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>snel', ':ResetListChars<CR>', { noremap = true, silent = true })


-- TRYING TO SET different tab steps depending on the path -- NOT WORKING
--local function set_tab_size()
--    local bufname = vim.fn.expand('%:p:h')
--    if string.find(bufname, 'MyISA') then
--        vim.opt.tabstop = 2
--        vim.opt.softtabstop = 2
--        vim.opt.shiftwidth = 2
--    else
--        vim.opt.tabstop = 4
--        vim.opt.softtabstop = 4
--        vim.opt.shiftwidth = 4
--    end
--end

--vim.cmd('autocmd BufEnter * lua set_tab_size()')
--vim.cmd('autocmd BufRead * lua set_tab_size()')


