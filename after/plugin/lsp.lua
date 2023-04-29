local lsp = require('lsp-zero')
lsp.preset('recommended')

require('lsp-zero').extend_lspconfig()

-- Call the language servers you have installed
require('lspconfig').tsserver.setup({})
require('lspconfig').eslint.setup({})
require('lspconfig').rust_analyzer.setup({})

require('mason').setup()
require('mason-lspconfig').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        -- Replace these with the servers you want to install
        'rust_analyzer',
        'tsserver',
        'eslint',
    }
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

-- preselect first item
cmp.setup({
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    mapping = cmp_mappings
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

-- lsp.setup_nvim_cmp({
--     mapping = cmp_mappings
-- })
--
lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

-- local function allow_format(servers)
--     return function(client) return vim.tbl_contains(servers, client.name) end
-- end
--
lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

    -- vim.keymap.set({ 'n', 'x' }, '<leader>f', function()
    --     vim.lsp.buf.format({
    --         async = false,
    --         timeout_ms = 10000,
    --         filter = allow_format({ 'lua_ls', 'rust_analyzer', 'eslint' })
    --     })
    -- end, opts)
    if client.name == "tsserver" then
        client.server_capabilities.document_formatting = false
    end
end)

lsp.format_mapping('<leader>f', {
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ['null-ls'] = { 'javascript', 'javascriptreact' },
        ['lua_ls'] = { 'lua' },
        ['rust_analyzer'] = { 'rust' },
    }
})

lsp.format_on_save({
    servers = {
        ['lua_ls'] = { 'lua' },
        ['rust_analyzer'] = { 'rust' },
        ['null-ls'] = { 'javascriptreact' },
    }
})


lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
