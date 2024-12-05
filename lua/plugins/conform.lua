return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = { "n", "v" }, 
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier" },
      bash = { "shfmt", "shellcheck" },
      sh = { "shfmt", "shellcheck" },
      dockerfile = { "dockerfilelint" },
      ["docker-compose"] = { "docker-compose-format" },
      ["docker-compose.yaml"] = { "docker-compose-format" },
      yaml = { "prettier", "yamlfix" }
    },
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2" },
      },
      shellcheck = {
        args = { "--severity", "warning" },
      },
    },
  },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
