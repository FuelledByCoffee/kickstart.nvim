return {
  { -- Collection of various small independent plugins/modules
    'nvim-mini/mini.nvim',
    version = '*',
    config = function()
      if vim.g.have_nerd_font then
        require('mini.icons').setup()
        MiniIcons.mock_nvim_web_devicons()
      end

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
      vim.keymap.del({ 'n', 'x' }, 's')

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

      -- Add start page
      require('mini.starter').setup()

      local statusline = require 'mini.statusline'

      statusline.setup {
        use_icons = vim.g.have_nerd_font,
        content = {
          active = function()
            local mode, mode_hl = statusline.section_mode { trunc_width = 75 }
            local git = statusline.section_git { trunc_width = 150 }
            local diff = statusline.section_diff { trunc_width = 75 }
            local diagnostics = statusline.section_diagnostics { trunc_width = 75 }
            local filename = statusline.section_filename { trunc_width = 140 }
            local fileinfo = statusline.section_fileinfo { trunc_width = 160 }
            local location = statusline.section_location()

            -- 1. Initialize the layout with your left-hand elements
            local groups = {
              { hl = mode_hl, strings = { mode } },
              { hl = 'MiniStatuslineDevinfo', strings = { git, diff, diagnostics } },
              '%<',
              { hl = 'MiniStatuslineFilename', strings = { filename } },
              '%=',
            }

            -- 2. Safely check for CMake and add the module ONLY if it contains active data
            local has_cmake, cmake = pcall(require, 'cmake-tools')
            if has_cmake and cmake.is_cmake_project() then
              local build_type = cmake.get_build_type() or 'Debug'
              local launch_target = cmake.get_launch_target() or 'None'
              local icon = 'CMake: '
              -- local icon = vim.g.have_nerd_font and '' or 'CMake: '
              local cmake_info = string.format('%s%s [%s]', icon, build_type, launch_target)

              -- Append the component directly to the layout table
              table.insert(groups, { hl = 'MiniStatuslineDevinfo', strings = { cmake_info } })
            end

            -- 3. Append the remaining right-hand layout items
            table.insert(groups, { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } })
            table.insert(groups, { hl = mode_hl, strings = { location } })

            return statusline.combine_groups(groups)
          end,
        },
      }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v %p%%'
      end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
}
