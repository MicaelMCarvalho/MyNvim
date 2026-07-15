return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = false,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "markdown",
      callback = function()
        vim.opt_local.conceallevel = 1
      end,
    })
  end,

  keys = {
    -- { "gf", function() return require("obsidian").follow_link() end, mode = "n", desc = "Obsidian: Follow link under cursor" },
    { "gf",         "<cmd>ObsidianFollowLink<cmd>",        mode = "n", desc = "Obsidian: Follow link under cursor" },
    { "<leader>0n", "<cmd>obsidiannew<cmd>",               mode = "n", desc = "obsidian: create new note" },
    -- { "<leader>0n", function() return require("obsidian").new_note() end, mode = "n", desc = "obsidian: create new note" },
    { "<leader>0l", "<cmd>ObsidianLink<cmd>",              mode = "n", desc = "obsidian: create new link" },
    { "<leader>0k", "<cmd>Obsidianworkspace work<cr>",     mode = "n", desc = "obsidian: switch to work workspace" },
    { "<leader>0f", "<cmd>ObsidianSearch<cr>",             mode = "n", desc = "Obsidian: Search in notes" },
    { "<leader>0q", "<cmd>ObsidianQuickSwitch<cr>",        mode = "n", desc = "Obsidian: Quick Switch" },
    -- { "<leader>0g", function() return require("obsidian").open_graph() end, mode = "n", desc = "Obsidian: Open graph view" },
    { "<leader>0w", "<cmd>ObsidianWorkspace<cr>",          mode = "n", desc = "Obsidian: List and switch workspaces" },
    { "<leader>0p", "<cmd>ObsidianWorkspace personal<cr>", mode = "n", desc = "Obsidian: Switch to personal workspace" },
    { "<leader>0k", "<cmd>obsidianworkspace work<cr>",     mode = "n", desc = "obsidian: switch to work workspace" },

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
        -- overrides = {
        --   completion = {
        --     nvim_cmp = true,
        --     min_chars = 3,
        --   },
        -- },
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
