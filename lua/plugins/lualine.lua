return {
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    config = function()
      -- Set blend for the status line
      vim.cmd([[
        highlight StatusLine guibg=#1E1E2E guifg=#ffffff blend=30
        highlight StatusLineNC guibg=#1E1E2E guifg=#aaaaaa blend=30
      ]])

      -- Optional: Set blend for lualine sections if needed
      vim.api.nvim_exec([[
        augroup LualineBlend
          autocmd!
          autocmd ColorScheme * highlight StatusLine guibg=#1E1E2E guifg=#ffffff blend=30
          autocmd ColorScheme * highlight StatusLineNC guibg=#1E1E2E guifg=#aaaaaa blend=30
        augroup END
      ]], false)

      -- Load lualine with the options
      require('lualine').setup({
        options = {
          icons_enabled = true,
          theme = 'everforest',
          color = nil,
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {
            'NvimTree',
            'vista',
            'dbui',
          },
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          }
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {
            {
              'filename',
              file_status = true, -- displays file status (readonly status, modified status)
              path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
            },
          },
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {
            {
              'mode',
            },
          },
          lualine_b = {},
          lualine_c = {
            {
              'filename',
              file_status = true, -- displays file status (readonly status, modified status)
              path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
            },
          },
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        tabline = {
          lualine_a = {'buffers'},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {}
        },
        winbar = {},
        extensions = {},
      })
    end,
  }
}
