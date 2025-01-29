return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = false,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "gf", function() return require("obsidian").follow_link() end, mode = "n", desc = "Obsidian: Follow link under cursor" },
    { "<leader>0n", function() return require("obsidian").new_note() end, mode = "n", desc = "Obsidian: Create new note" },
    { "<leader>0f", "<cmd>ObsidianSearch<cr>", mode = "n", desc = "Obsidian: Search in notes" },
    { "<leader>0q", "<cmd>ObsidianQuickSwitch<cr>", mode = "n", desc = "Obsidian: Quick Switch" },
    { "<leader>0g", function() return require("obsidian").open_graph() end, mode = "n", desc = "Obsidian: Open graph view" },
    { "<leader>0w", function() return require("obsidian").workspace.list() end, mode = "n", desc = "Obsidian: List and switch workspaces" },
    { "<leader>0p", function() return require("obsidian").workspace.switch("personal") end, mode = "n", desc = "Obsidian: Switch to personal workspace" },
    { "<leader>0k", function() return require("obsidian").workspace.switch("work") end, mode = "n", desc = "Obsidian: Switch to work workspace" },
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "/Users/micael/Library/CloudStorage/GoogleDrive-micael.l.m.c@gmail.com/My Drive/Obsidian/Diary",
      },
      {
        name = "work",
        path = "/Users/micael/Library/CloudStorage/GoogleDrive-micael.l.m.c@gmail.com/My Drive/Obsidian/MintT",
        overrides = {
          completion = {
            nvim_cmp = true,
            min_chars = 3,
          },
        },
      },
    },

    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },

    note_id_func = function(title)
      local suffix = ""
      if title ~= nil then
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(os.time()) .. "-" .. suffix
    end,

    open_notes_in_current_window = false,
    prefer_link_text_as_title = true,
  },
}
