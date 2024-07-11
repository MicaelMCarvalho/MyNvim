-- Set the leader key to space
vim.g.mapleader = " "

-- Map <leader>pv to execute a vim command
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Execute a Vim command" })

-- In visual mode, move selected lines down with J
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down with J" })
-- In visual mode, move selected lines up with K
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up with K" })

vim.api.nvim_set_keymap('n', '<leader>s2', [[:set softtabstop=2 shiftwidth=2 tabstop=2<CR>]], {noremap = true, silent = true, desc = 'Set softtabstop, shiftwidth, and tabstop to 2' })
vim.api.nvim_set_keymap('n', '<leader>s4', [[:set softtabstop=4 shiftwidth=4 tabstop=4<CR>]], {noremap = true, silent = true, desc = 'Set softtabstop, shiftwidth, and tabstop to 4' })
vim.api.nvim_set_keymap('n', '<leader>sc', [[:set conceallevel=0<CR>]], {noremap = true, silent = true, desc = 'Set conceallevel to 0' })
vim.api.nvim_set_keymap('n', '<leader>sw', [[:set wrap linebreak<CR>]], {noremap = true, silent = true, desc = 'Enable line wrapping and line breaking' })

vim.api.nvim_set_keymap('n', '<leader>js', [[:%!python -m json.tool<CR>]], {noremap = true, silent = true, desc = 'Format the entire buffer as JSON' })

-- In normal mode, join lines with J and return to initial position
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines with J and return to initial position" })

-- In normal mode, scroll down half a page and center cursor line
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half a page and center cursor line" })

-- In normal mode, scroll up half a page and center cursor line
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half a page and center cursor line" })

-- In normal mode, find next match and center cursor line
vim.keymap.set("n", "n", "nzzzv", { desc = "Find next match and center cursor line" })

-- In normal mode, find previous match and center cursor line
vim.keymap.set("n", "N", "Nzzzv", { desc = "Find previous match and center cursor line" })

-- Start VimWithMe session
vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end, { desc = "Start VimWithMe session" })

-- Stop VimWithMe session
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end, { desc = "Stop VimWithMe session" })

-- In visual mode, paste before selection and keep selection
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste before selection and keep selection" })

-- Yank to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })

-- Yank to end of line to system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank to end of line to system clipboard" })

-- Delete without yanking
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]], { desc = "Delete without yanking" })

-- In insert mode, map Ctrl-c to Escape
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Map Ctrl-c to Escape" })

-- Disable Q command in normal mode
vim.keymap.set("n", "Q", "<nop>", { desc = "Disable Q command in normal mode" })

-- Open a new tmux window with tmux-sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Open a new tmux window with tmux-sessionizer" })
--
-- Format buffer


vim.keymap.set("n", "<leader>f", function()
  if vim.lsp.buf.server_capabilities.documentFormattingProvider then
    vim.lsp.buf.format()
  else
    print("LSP does not support formatting for this file.")
  end
end, { desc = "Format buffer" })


-- Go to next error and center cursor line
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Go to next error and center cursor line" })

-- Go to previous error and center cursor line
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Go to previous error and center cursor line" })

-- Go to next location and center cursor line
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Go to next location and center cursor line" })

-- Go to previous location and center cursor line
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Go to previous location and center cursor line" })

-- Search and replace current word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Search and replace current word under cursor" })

-- Make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }, { desc = "Make current file executable" })

-- Open packer.lua configuration file
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>", { desc = "Open packer.lua configuration file" })

-- Run CellularAutomaton make_it_rain command
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>", { desc = "Run CellularAutomaton make_it_rain command" })

-- Source current file
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end, { desc = "Source current file" })

-- Format buffer as JSON
vim.keymap.set("n", "<leader>jt", ":bufdo %!python -m json.tool<CR>", { silent = true }, { desc = "Format buffer as JSON" })

-- Delete without yanking
vim.keymap.set("n", "d", '"_d')
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "D", '"_D')

-- Delete and yank to unnamed register
vim.keymap.set("n", "<leader>d", '""d')
vim.keymap.set("n", "<leader>x", '""x')
vim.keymap.set("n", "<leader>D", '""D')

-- In visual mode, delete without yanking
vim.keymap.set("v", "d", '"_d')
vim.keymap.set("v", "x", '"_x')
vim.keymap.set("v", "D", '"_D')

-- In visual mode, delete and yank to unnamed register
vim.keymap.set("v", "<leader>d", '""d')
vim.keymap.set("v", "<leader>x", '""x')
vim.keymap.set("v", "<leader>D", '""D')

-- In visual mode, run normal mode command on selection
vim.keymap.set("v", "<leader>n", ":norm", { desc = "Run normal mode command on selection" })

vim.keymap.set("n", "<leader>z", ":noh<CR>", { desc = "Clear search highlights" })

vim.keymap.set("n", "zz", "zz", { noremap= true, silent = true, desc = "Clear search highlights" })

vim.keymap.set("n", "<leader>yf", ":let @+ = expand('%:p')<CR>", { desc = "Put the full path of the current file in the system clipboard" })

vim.keymap.set("n", "<leader>l", function() vim.diagnostic.open_float(0, {scope="line"}) end, {buffer = bufnr, remap = true, desc = "LSP: Open line diagnostic float"})

