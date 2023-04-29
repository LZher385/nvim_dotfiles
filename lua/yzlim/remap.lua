vim.keymap.set({ "i", "v" }, "jk", "<Esc>")

-- move visual block
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- append next line to end of current line without moving cursor
vim.keymap.set("n", "J", "mzJ`z")

-- scroll by half a page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- paste and replace highlighted section. highlighted section goes into
-- void register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- yank into system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- delete to void register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-q>", "<C-w>q")

vim.keymap.set("n", "<leader>]", "<C-i>")
vim.keymap.set("n", "<leader>[", "<C-o>")

vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")


vim.keymap.set("n", "<C-Right>", [[<cmd>vertical resize +5<cr>]])
vim.keymap.set("n", "<C-Left>", [[<cmd>vertical resize -5<cr>]])
vim.keymap.set("n", "<C-Down>", [[<cmd>horizontal resize +5<cr>]])
vim.keymap.set("n", "<C-Up>", [[<cmd>horizontal resize -5<cr>]])
