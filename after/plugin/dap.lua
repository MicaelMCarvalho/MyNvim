local dap, dapui = require('dap'), require('dapui')


vim.keymap.set('n', '<F5>', '<Cmd>lua require"dap".continue()<CR>', { silent = true })
vim.keymap.set('n', '<F10>', '<Cmd>lua require"dap".step_over()<CR>', { silent = true })
vim.keymap.set('n', '<F11>', '<Cmd>lua require"dap".step_into()<CR>', { silent = true })
vim.keymap.set('n', '<F12>', '<Cmd>lua require"dap".step_out()<CR>', { silent = true })
vim.keymap.set('n', '<Leader>b', '<Cmd>lua require"dap".toggle_breakpoint()<CR>', { silent = true })
vim.keymap.set('n', '<Leader>B', '<Cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', { silent = true })
vim.keymap.set('n', '<Leader>lp', '<Cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', { silent = true })
vim.keymap.set('n', '<Leader>dr', '<Cmd>lua require"dap".repl.open()<CR>', { silent = true })
vim.keymap.set('n', '<Leader>dl', '<Cmd>lua require"dap".run_last()<CR>', { silent = true })


dapui.setup({
  icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Use this to override mappings for specific elements
  element_mappings = {
    -- Example:
    -- stacks = {
    --   open = "<CR>",
    --   expand = "o",
    -- }
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.7") == 1,
  -- Layouts define sections of the screen to place windows.
  -- The position can be "left", "right", "top" or "bottom".
  -- The size specifies the height/width depending on position. It can be an Int
  -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
  -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
  -- Elements are the elements shown in the layout (in order).
  -- Layouts are opened in order so that earlier layouts take priority in window sizing.
  layouts = {
    {
      elements = {
      -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
  controls = {
    -- Requires Neovim nightly (or 0.8 when released)
    enabled = true,
    -- Display controls in this element
    element = "repl",
    icons = {
      pause = "",
      play = "",
      step_into = "",
      step_over = "",
      step_out = "",
      step_back = "",
      run_last = "↻",
      terminate = "□",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
    max_value_lines = 100, -- Can be integer or nil.
  }
})

require("mason-nvim-dap").setup({
    ensure_installed = { "python", "javascript" }
})


local dap = require('dap')

dap.adapters.python = function(cb, config)
  if config.request == 'attach' then
    local port = (config.connect or config).port
    local host = (config.connect or config).host or '127.0.0.1'
    cb({
      type = 'server',
      port = assert(port, '`connect.port` is required for a python `attach` configuration'),
      host = host,
      options = {
        source_filetype = 'python',
      },
    })
  else
    local python_executable = vim.fn.globpath(vim.fn.getcwd(), 'venv/bin/python', true, true)
    if type(python_executable) == 'table' and #python_executable > 0 then
      python_executable = python_executable[1]
    else
      print('Error: Python executable not found in the project or virtual environment.')
      return
    end
    cb({
      type = 'executable',
      command = python_executable,
      args = { '-m', 'debugpy.adapter' },
      options = {
        source_filetype = 'python',
      },
    })
  end
end

dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = "Launch file",
    program = "${file}",
    console = "internalConsole",  -- Set console to "internal"
    pythonPath = function()
      local cwd = vim.fn.getcwd()
      local python_executable = vim.fn.globpath(cwd, 'venv/bin/python', true, true)

      if type(python_executable) == 'table' and #python_executable > 0 then
        return python_executable[1]
      else
        print('Error: Python executable not found in the project or virtual environment.')
        return '/usr/bin/python'  -- Replace with the default system Python path
      end
    end,
  },
}

dap.adapters.coreclr = {
  type = 'executable',
  command = '/path/to/dotnet/netcoredbg/netcoredbg',
  args = {'--interpreter=vscode'}
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end,
  },
}

-- Set the Python debugger to 'debugpy'
vim.g.dap_python_debugger = 'debugpy'


dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

