return {
  'nvim-mini/mini.indentscope',
  version = '*',
  event = 'VimEnter',
  config = function()
    require('mini.indentscope').setup {
      draw = {
        delay = 10,
        animation = function(_, _)
          return 0.5
        end,
      },
      opts = {
        border = 'both',
        indent_at_cursor = true,
        n_lines = 10000,
        try_as_border = true,
      },
      symbol = vim.g.have_nerd_font and '│' or '|',
    }
  end,
}
