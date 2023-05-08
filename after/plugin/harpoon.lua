local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
require("harpoon").setup({
    global_settings = { mark_branch = true },
    menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
    }
})

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)
