return {
  {
    "github/copilot.vim",
    lazy = false,
    keys = {
      { "<C-a>", "copilot#Accept('<CR>')", mode = {"i"}, desc = "Accept the current suggestion" },
      { "<C-,>", "<Plug>(copilot-dismiss)", mode = {"i"}, desc = "Dismiss the current suggestion" },
      { "<C-m>", "<Plug>(copilot-next)", mode = {"i"}, desc = "Cycle to the next suggestion" },
      { "<C-l>", "<Plug>(copilot-previous)", mode = {"i"}, desc = "Cycle to the previous suggestion" },
      { "<C-j>", "<Plug>(copilot-accept-word)", mode = {"i"}, desc = "Accept the next word of the current suggestion" },
      { "<C-k>", "<Plug>(copilot-accept-line)", mode = {"i"}, desc = "Accept the next line of the current suggestion" },
    }
  }
}
