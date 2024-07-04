local lsp = require("lsp-zero")
lsp.preset("recommended")
lsp.ensure_installed({
  'tsserver',
  'rust_analyzer',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

-- cmp.config.window.completion = cmp.config.window.bordered()
-- cmp.config.window.documentation = cmp.config.window.bordered()

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'e',
        warn = 'w',
        hint = 'h',
        info = 'i'
    }
})


lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, {buffer = bufnr, remap = true, desc = "LSP: Go to definition"})
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, {buffer = bufnr, remap = true, desc = "LSP: Hover"})
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, {buffer = bufnr, remap = true, desc = "LSP: Workspace symbol"})
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, {buffer = bufnr, remap = true, desc = "LSP: Open diagnostic float"})
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, {buffer = bufnr, remap = true, desc = "LSP: Go to next diagnostic"})
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, {buffer = bufnr, remap = true, desc = "LSP: Go to previous diagnostic"})
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, {buffer = bufnr, remap = true, desc = "LSP: Code action"})
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, {buffer = bufnr, remap = true, desc = "LSP: References"})
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, {buffer = bufnr, remap = true, desc = "LSP: Rename"})
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, {buffer = bufnr, remap = true, desc = "LSP: Signature help"})
  vim.keymap.set("n", "<leader>l", function() vim.diagnostic.open_float(0, {scope="line"}) end, {buffer = bufnr, remap = true, desc = "LSP: Open line diagnostic float"})
end)
lsp.setup()



_G.lsp_warnings_hidden = false

-- Function to toggle the visibility of LSP warnings
function Toggle_lsp_warnings()
    if _G.lsp_warnings_hidden then
        vim.diagnostic.config({
            virtual_text = false,
            virtual_lines = false,
        })
    else
        vim.diagnostic.config({
            virtual_text = true,
            virtual_lines = true,
        })
    end
end

-- Map a key to toggle the visibility of LSP warnings
vim.api.nvim_set_keymap('n', '<leader>lw', '<cmd>lua Toggle_lsp_warnings()<CR>', { noremap = true, silent = true })





vim.diagnostic.config({
    virtual_text = true
})

require('lspconfig').volar.setup{
    filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
    init_options = {
        typescript = {
            tsdk = '/path/to/.npm/lib/node_modules/typescript/lib'
            -- Alternative location if installed as root:
            -- tsdk = '/usr/local/lib/node_modules/typescript/lib'
        }
    }
}
require('lspconfig').vuels.setup{}
require('lspconfig').tsserver.setup{}


require('lspconfig').csharp_ls.setup{
    root_dir = function()
        return lsp.dir.find_first({'.gitignore'})
    end,
    AutomaticWorkspaceInit = true,
}

require('lspconfig').fsautocomplete.setup{
    AutomaticWorkspaceInit = true,
}

require('lspconfig').gopls.setup{
    cmd = {"gopls", "serve"},
    on_attach = function(client)
        print('Language server attached!')
    end,
} --go install golang.org/x/tools/gopls@latest

-- require'lspconfig'.omnisharp.setup {
  --     cmd = { "dotnet", "/path/to/omnisharp/OmniSharp.dll" },
  --     enable_editorconfig_support = true,
  --     enable_ms_build_load_projects_on_demand = false,
  --     enable_roslyn_analyzers = false,
  --     organize_imports_on_format = false,
  --     enable_import_completion = false,
  --     sdk_include_prereleases = true,
  --     analyze_open_documents_only = false,
  -- }
  --

-- require'lspconfig'.dartls.setup{}
