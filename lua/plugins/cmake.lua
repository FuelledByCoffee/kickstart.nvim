return {
  {
    'Civitasv/cmake-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      cmake_build_directory = 'build',
      cmake_regenerate_on_save = true,
      ctest_show_labels = true, -- also show labels in the test picker
      cmake_compile_commands_options = {
        action = 'none',
      },
      cmake_variants_message = {
        short = { show = true }, -- whether to show short message
        long = { show = true, max_length = 40 }, -- whether to show long message
      },
      cmake_notifications = {
        runner = { enabled = true },
        executor = { enabled = true },
        spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' }, -- icons used for progress display
        refresh_rate_ms = 100, -- how often to iterate icons
      },
      cmake_virtual_text_support = true, -- Show the target related to current file using virtual text (at right corner)
      cmake_use_scratch_buffer = false, -- A buffer that shows what cmake-tools has done
    },
    config = function(_, opts)
      -- 1. Initialize the plugin with your opts
      require('cmake-tools').setup(opts)

      -- 2. Define the buffer-local keymaps autocmd
      local cmake_group = vim.api.nvim_create_augroup('CMakeKeymaps', { clear = true })
      vim.api.nvim_create_autocmd('FileType', {
        group = cmake_group,
        pattern = { 'c', 'cpp', 'cmake' },
        callback = function()
          local root = vim.fs.root(0, { 'CMakeLists.txt' })
          if root then
            local opts_km = { buffer = true, silent = true }

            opts_km.desc = 'CMake [G]enerate'
            vim.keymap.set('n', '<leader>mg', '<cmd>CMakeGenerate<CR>', opts_km)

            opts_km.desc = 'CMake [B]uild'
            vim.keymap.set('n', '<leader>mm', '<cmd>CMakeBuild<CR>', opts_km)

            opts_km.desc = 'CMake [C]lean'
            vim.keymap.set('n', '<leader>mc', '<cmd>CMakeClean<CR>', opts_km)

            opts_km.desc = 'CMake Run Target'
            vim.keymap.set('n', '<leader>mr', '<cmd>CMakeRun<CR>', opts_km)
          end
        end,
      })
    end,
  },
}
