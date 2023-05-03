local chadtree_settings = {
    ["theme.text_colour_set"] = "nord",
    ["theme.icon_glyph_set"] = "ascii"
}

vim.api.nvim_set_var("chadtree_settings", chadtree_settings)
vim.keymap.set("n", "<leader>wt", [[<cmd>CHADopen<cr>]])
vim.keymap.set("n", "<leader>w/", [[<cmd>CHADhelp keybind<cr>]])
