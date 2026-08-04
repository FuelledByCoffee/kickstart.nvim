return {
  {
    'stevearc/aerial.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'neovim/nvim-lspconfig',
    },
    opts = {
      -- 1. Restrict the list to ONLY show functions, methods, and classes
      filter_kind = {
        'Class',
        'Constructor',
        'Function',
        'Method',
      },

      -- 2. Sidebar visual settings
      layout = {
        default_direction = 'right', -- Opens as a persistent right-hand sidebar
        min_width = 30, -- Gives it a clean, uncrowded look
      },

      -- 3. Live UI Syncing
      attach_mode = 'window', -- Keeps the outline tied to the current window
      highlight_on_hover = true, -- Highlights the item in the sidebar under your cursor
      update_events = 'TextChanged,InsertLeave', -- Updates live as you write code
    },
    keys = {
      -- Toggle the outline on and off with <leader>o
      { '<leader>o', '<cmd>AerialToggle!<CR>', desc = 'Toggle Code Outline Sidebar' },
    },
  },
}
