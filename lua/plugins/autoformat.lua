return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = { 'v', 'n' },
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = true,
      format_on_save = function(bufnr)
        local disable_filetypes = { c = false, cpp = true }
        return disable_filetypes[vim.bo[bufnr].filetype] and nil or {
          timeout_ms = 500,
          lsp_format = 'fallback',
        }
      end,
      default_format_opts = {
        lsp_format = 'fallback',
      },
      timeout_ms = 500,
      lsp_format = 'fallback',
      formatters_by_ft = {
        lua = { 'stylua' },
        cmake = { 'gersemi', lsp_format = 'fallback' },
        rust = { 'rustfmt', lsp_format = 'fallback' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use 'stop_after_first' to run the first available formatter from the list
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },
}
