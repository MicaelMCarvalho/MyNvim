local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end, { desc = "harpoon: Add current file" })
vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "harpoon: Toggle quick menu" })

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end, { desc = "harpoon: Select 1" })
vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end, { desc = "harpoon: Select 2" })
vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end, { desc = "harpoon: Select 3" })
vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end, { desc = "harpoon: Select 4" })
