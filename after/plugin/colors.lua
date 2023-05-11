function SetColourScheme(colour)
    colour = colour or "tokyonight-moon"
    vim.cmd.colorscheme(colour)

    --    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    --    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    --    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    --    vim.api.nvim_set_hl(0, "CursorColumn", { bg = "none" })
    --    vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
    --    vim.api.nvim_set_hl(0, "Cursor", { bg = "none" })
    --    vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
    --
    require("tokyonight").setup({
        styles = { sidebars = "transparent" }
    })
    require("transparent").setup({
        groups = { -- table: default groups
            'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
            'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
            'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
            'SignColumn', 'CursorLineNr', 'EndOfBuffer',
        },
        extra_groups = { "NormalFloat", "NvimTreeNormal", "Cursor", "NvimTreeStatuslineNc" }, -- table: additional groups that should be cleared
        exclude_groups = {},                                                                  -- table: groups you don't want to clear
    })
end

SetColourScheme()
