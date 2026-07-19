return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",

    config = function()
      local languages = {
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
        "python",
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "rust",
        "dockerfile",
        "c_sharp",
        "vue",
        "markdown",
        "yaml",
        "go",
        "dart",
        "latex",
      }

      require("nvim-treesitter").install(languages)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = languages,
        callback = function()
          pcall(vim.treesitter.start)

          vim.bo.indentexpr =
            "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
-- return {
--   {
--     "nvim-treesitter/nvim-treesitter",
--     opts = {
--       ensure_installed = {
--         "javascript",
--         "typescript",
--         "tsx",
--         "html",
--         "css",
--
--         "python",
--         "c",
--         "lua",
--         "vim",
--         "vimdoc",
--         "query",
--         "rust",
--         "dockerfile",
--         "c_sharp",
--         "vue",
--         "markdown",
--         "yaml",
--         "go",
--         "dart",
--       },
--       sync_install = false,
--       auto_install = true,
--       highlight = {
--         enable = true,
--         additional_vim_regex_highlighting = false,
--       },
--       autotag = {
--         enable = true,
--       },
--       indent = {
--         enable = true,
--       },
--     },
--   },
-- }
