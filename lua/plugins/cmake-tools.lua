return {
  {
    'Civitasv/cmake-tools.nvim',
    lazy = false,
    dependencies = {
      {
        'j-hui/fidget.nvim',
        opts = {
          notification = {
            window = {
              winblend = 0,
            },
          },
        },
      },
    },
    opts = {
      cmake_notifications = {
        runner = { enabled = true },
        executor = { enabled = true },
        spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' }, -- icons used for progress display
        refresh_rate_ms = 100, -- how often to iterate icons
      },
      cmake_virtual_text_support = true, -- Show the target related to current file using virtual text (at right corner)
    },
  },
}
