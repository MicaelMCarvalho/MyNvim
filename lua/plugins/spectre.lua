return {
    'nvim-pack/nvim-spectre',
    config = function()
        require('spectre').setup({
            -- Add any additional configuration here
        })

        -- Key mappings
        vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
            desc = "Spectre - Toggle"
        })
        vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
            desc = "Spectre - Search current word"
        })
        vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
            desc = "Spectre - Search current word in visual mode"
        })
        vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
            desc = "Spectre - Search in current file"
        })
    end
}
