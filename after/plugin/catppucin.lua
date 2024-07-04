require("catppuccin").setup({
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  background = { -- :h background
    light = "latte",
    dark = "mocha",
  },
  transparent_background = true, -- disables setting the background color.
  show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
  term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
  dim_inactive = {
    enabled = false, -- dims the background color of inactive window
    shade = "colors", -- the color of the shade (default is `black`)
    percentage = 0.40, -- percentage of the shade to apply to the inactive window
  },
  no_italic = false, -- Force no italic
  no_bold = false, -- Force no bold
  no_underline = false, -- Force no underline
  styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
    comments = { "italic" }, -- Change the style of comments
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  color_overrides = {},
  custom_highlights = {},
  -- custom_highlights = function(colors)
  --     return {
  --       WinSeparator = { fg = colors.flamingo, bg = colors.none },
  --       VertSplit = { fg = colors.flamingo, bg = colors.none },
  --       StatusLine = { bg = colors.none }, -- Ensure the status line is transparent
  --       StatusLineNC = { bg = colors.none }, -- Ensure the non-current status line is transparent
  --     }
  -- end,
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = {
      transparent_panel = true,
    },
    treesitter = true,
    notify = false,
    mini = {
      enabled = true,
      indentscope_color = "",
    },
    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },
  cursorline = true, -- Enable the cursorline
})

vim.cmd.colorscheme "catppuccin"

-- vim.cmd.cursorline = true

vim.cmd([[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NonText guibg=NONE ctermbg=NONE
  highlight LineNr guibg=NONE ctermbg=NONE
  highlight Folded guibg=NONE ctermbg=NONE
  highlight EndOfBuffer guibg=NONE ctermbg=NONE
  highlight SignColumn guibg=NONE ctermbg=NONE
  highlight VertSplit guibg=NONE ctermbg=NONE
]])

-- Apply these settings every time a new buffer is created or entered
vim.api.nvim_exec([[
  augroup TransparentBackground
    autocmd!
    autocmd ColorScheme * highlight Normal guibg=NONE ctermbg=NONE
    autocmd ColorScheme * highlight NonText guibg=NONE ctermbg=NONE
    autocmd ColorScheme * highlight LineNr guibg=NONE ctermbg=NONE
    autocmd ColorScheme * highlight Folded guibg=NONE ctermbg=NONE
    autocmd ColorScheme * highlight EndOfBuffer guibg=NONE ctermbg=NONE
    autocmd ColorScheme * highlight SignColumn guibg=NONE ctermbg=NONE
    autocmd ColorScheme * highlight VertSplit guibg=NONE ctermbg=NONE
  augroup END
]], false)


vim.cmd([[
  set cursorline
]])

vim.cmd [[
  highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=#2f4f4f guifg=NONE
]]

vim.cmd [[
  augroup CursorLine
    autocmd!
    autocmd WinEnter,BufEnter * setlocal cursorline
    autocmd WinLeave,BufLeave * setlocal nocursorline
  augroup END
]]


