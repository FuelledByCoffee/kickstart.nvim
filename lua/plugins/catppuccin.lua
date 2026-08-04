return {
  -- 1. Load the core Catppuccin theme
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    config = function()
      require('catppuccin').setup {
        flavour = 'auto', -- latte, frappe, macchiato, mocha
        background = { -- :h background
          light = 'latte',
          dark = 'mocha',
        },
        float = {
          solid = true,
          transparent = false,
        },
        transparent_background = false, -- disables setting the background color.
        show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
        term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
      }
      -- vim.cmd.colorscheme 'catppuccin'
    end,
  },

  -- 2. Sync Neovim cleanly using Ghostty's OSC 11 responses
  {
    'afonsofrancof/OSC11.nvim',
    opts = {
      -- Triggers dynamically whenever Ghostty's theme updates
      set_dark_mode = function()
        vim.o.background = 'dark'
        vim.cmd 'colorscheme catppuccin'
      end,
      set_light_mode = function()
        vim.o.background = 'light'
        vim.cmd 'colorscheme catppuccin'
      end,
    },
  },
}
