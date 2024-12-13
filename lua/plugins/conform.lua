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
      javascript = { "prettierd", "prettier" },
      typescript = { "prettierd", "prettier" },
      dockerfile = { "beautysh" },
      ["docker-compose"] = { "yamlfix" },
      ["docker-compose.yaml"] = { "yamlfix" },
      yaml = { "yamlfix" },
      sh = { "shfmt", "shellcheck" },
      bash = { "shfmt", "shellcheck" },
    },
    formatters = {
      black = {
        command = os.getenv("HOME") .. "/.venv/nvim-format/bin/black",
      },
      isort = {
        command = os.getenv("HOME") .. "/.venv/nvim-format/bin/isort",
      },
      yamlfix = {
        command = os.getenv("HOME") .. "/.venv/nvim-format/bin/yamlfix",
      },
      beautysh = {
        command = os.getenv("HOME") .. "/.venv/nvim-format/bin/beautysh",
      },
      shfmt = {
        prepend_args = { "-i", "2" },
      },
      shellcheck = {
        args = { "--severity", "warning" },
      },
    },
    format_on_save = false,
    default_format_opts = {
      lsp_format = "fallback",
    },
  },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
