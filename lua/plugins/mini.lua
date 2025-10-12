return {
  { -- Collection of various small independent plugins/modules
    'nvim-mini/mini.nvim',
    branch = 'main',
    version = '*',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- Examples:
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Align/justify text
      --
      -- Examples:
      -- - gaip, - align inner paragraph around ','
      -- - gA}␣  - align with preview around space until next empty line
      require('mini.align').setup()

      -- Move lines of text with Alt+motion
      -- require('mini.move').setup {
      -- Module mappings. Use `''` (empty string) to disable one.
      -- mappings = {
      -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
      -- left = '˛',
      -- right = 'ﬁ',
      -- down = '√',
      -- up = 'ª',

      -- Move current line in Normal mode
      -- line_left = 'ﬁ',
      -- line_right = '˛',
      -- line_down = '√',
      -- line_up = 'ª',
      -- },

      -- Options which control moving behavior
      --   options = {
      --     -- Automatically reindent selection during linewise vertical move
      --     reindent_linewise = true,
      --   },
      -- }

      -- require('mini.animate').setup()
      require('mini.tabline').setup()
      -- require('mini.git').setup {
      --   job = {
      --     timeout = 30000,
      --   },
      --   command = {
      --     split = 'vertical',
      --   },
      --   vim.keymap.set('n', '<leader>gc', '<cmd>Git commit<cr>'),
      --   vim.keymap.set('n', '<leader>gP', '<cmd>Git push<cr>'),
      --   -- local rhs = '<Cmd>lua MiniGit.show_at_cursor()<CR>'
      --   vim.keymap.set({ 'n', 'x' }, '<Leader>gs', function()
      --     MiniGit.show_at_cursor()
      --   end, { desc = 'Show at cursor' })
      -- }

      -- Autmatically add closing paren
      require('mini.pairs').setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
}
