return {
  -- 2. Sync Neovim cleanly using Ghostty's OSC 11 responses
  {
    'afonsofrancof/OSC11.nvim',
    opts = {
      -- Triggers dynamically whenever Ghostty's theme updates
      set_dark_mode = function()
        vim.o.background = 'dark'
        vim.cmd('colorscheme ' .. vim.g.colors_name)
      end,
      set_light_mode = function()
        vim.o.background = 'light'
        vim.cmd 'colorscheme catppuccin'
      end,
    },
  },
}
