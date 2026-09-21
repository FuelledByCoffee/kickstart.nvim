return {
  -- 1. Load the core Catppuccin theme
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        flavour = 'auto', -- latte, frappe, macchiato, mocha
        background = { -- :h background
          light = 'latte',
          dark = 'frappe',
        },
        float = {
          solid = true,
          transparent = false,
        },
        transparent_background = false, -- disables setting the background color.
        show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
        term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)

        custom_highlights = function(colors)
          return {
            -- 1. Customize the Mode blocks (Text color, Background color)
            MiniStatuslineModeNormal = {
              fg = colors.mantle,
              bg = '#129fff',
              style = { 'bold' },
            },
            MiniStatuslineModeInsert = {
              fg = '#000000',
              bg = '#75df25',
              style = { 'bold' },
            },
            MiniStatuslineModeVisual = {
              fg = '#000000',
              bg = '#fdad00',
              style = { 'bold' },
            },
            MiniStatuslineModeReplace = {
              fg = '#ffffff',
              bg = '#ff0000',
              style = { 'bold' },
            },
            MiniStatuslineModeCommand = {
              fg = colors.mantle,
              bg = '#dd00df',
              style = { 'bold' },
            },
            MiniStatuslineModeOther = { fg = colors.mantle, bg = colors.teal, style = { 'bold' } },

            -- 2. Customize Dev Info (Git branch, Diagnostics)
            MiniStatuslineDevinfo = { fg = colors.text, bg = colors.surface1 },

            -- 3. Customize File Name section
            MiniStatuslineFilename = { fg = colors.subtext1, bg = colors.surface0 },

            -- 4. Customize File Info section (Right side details like filetype)
            MiniStatuslineFileinfo = { fg = colors.text, bg = colors.surface1 },

            -- 5. Customize the inactive statusline state
            MiniStatuslineInactive = { fg = colors.overlay0, bg = colors.mantle },
          }
        end,
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
