return {
  -- No plugin needed for built-in spellcheck
  {
    "nvim-lua/plenary.nvim", -- or any other plugin you're using
    lazy = false,
    config = function()
      -- Enable spellcheck for markdown files
      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = { "*.md", "*.markdown" },
        callback = function()
          vim.opt_local.spell = true
          vim.opt_local.spelllang = "en_us" -- Change to your preferred language
        end,
      })

      -- Spell-check related keymaps
      vim.keymap.set("n", "<leader>sp", function() vim.opt.spell = not vim.opt.spell:get() end,
        { desc = "Spellcheck - Toggle spellcheck" })
      vim.keymap.set("n", "[s", "[s", { desc = "Spellcheck - Previous misspelled word" })
      vim.keymap.set("n", "]s", "]s", { desc = "Spellcheck - Next misspelled word" })
      vim.keymap.set("n", "z=", "z=", { desc = "Spellcheck - Show spelling suggestions" })
      vim.keymap.set("n", "zg", "zg", { desc = "Spellcheck - Add word to spell list" })
      vim.keymap.set("n", "zw", "zw", { desc = "Spellcheck - Mark word as incorrect" })
      vim.keymap.set("n", "<leader>sen", function() vim.opt.spelllang = "en_us" end,
        { desc = "Spellcheck - Set spell language to English" })
      vim.keymap.set("n", "<leader>spt", function() vim.opt.spelllang = "pt_pt" end,
        { desc = "Spellcheck - Set spell language to Portuguese" })
    end,
  }
}
