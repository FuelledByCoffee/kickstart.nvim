vim.api.nvim_create_autocmd('ColorScheme', {
  group = vim.api.nvim_create_augroup('retrobox-overrides', { clear = false }),
  pattern = 'retrobox', -- colorscheme or list of schemes
  callback = function()
    -- Your custom highlight commands go here
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none', italic = false })
    -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none', italic = false })
    vim.api.nvim_set_hl(0, 'VertSplit', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'QuickFixLine', { bg = 'none' })
    -- vim.api.nvim_set_hl(0, 'Folded', { bg = vim.api.nvim_get_hl(0, { name = 'Special' }).fg, fg = 'black' })
    vim.api.nvim_set_hl(0, 'Path', { link = 'Identifier' })
    vim.api.nvim_set_hl(0, 'signcolumn', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'CursorLineNr', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'LspReferenceText', { underline = true })
    vim.api.nvim_set_hl(0, '@lsp.typemod.function.defaultLibrary.lua', { link = 'Special' })
  end,
})

vim.cmd.colorscheme 'catppuccin'
