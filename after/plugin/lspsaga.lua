local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.setup({
    ui = {
        winblend = 10,
        border = 'rounded',
        colors = {
            normal_bg = '#002b36'
        }
    },
    lightbulb = {
        enable = false
    }
})

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<cr>', opts)
vim.keymap.set('n', 'gl', '<Cmd>Lspsaga show_line_diagnostics<cr>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<cr>', opts)
-- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
vim.keymap.set('i', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<cr>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<cr>', opts)

-- code action
vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<cr>")
