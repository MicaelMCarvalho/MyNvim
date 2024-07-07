return {
  {
    'mbbill/undotree',
    cmd = 'UndotreeToggle',
    keys = {
      {
        "<leader>u", vim.cmd.UndotreeToggle, mode = {"n"}, desc = "Toggle undotree"
      }
    }
  }
}
