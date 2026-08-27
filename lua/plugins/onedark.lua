return {
  {
    'navarasu/onedark.nvim',
    lazy = true,
    config = function()
      require('onedark').setup {
        style = 'dark',
      }
      require('onedark').load()
    end,
  },
}
