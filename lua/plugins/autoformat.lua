vim.g.disable_autoformat = false

return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true }
        end,
        mode = { 'v', 'n' },
        desc = '[F]ormat buffer',
      },
      {
        '<leader>tf',
        function()
          vim.g.disable_autoformat = not vim.g.disable_autoformat
          if vim.g.disable_autoformat then
            vim.notify('Format-on-save: DISABLED', vim.log.levels.WARN)
          else
            vim.notify('Format-on-save: ENABLED', vim.log.levels.INFO)
          end
        end,
      },
    },
    opts = {
      notify_on_error = true,
      default_format_opts = { lsp_format = 'fallback', timeout_ms = 500 },
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat then
          return
        end

        local disable_filetypes = { c = true, cpp = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return
        end
        return {}
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        cmake = { 'gersemi' },
        rust = { 'rustfmt' },
        yaml = { 'prettier', 'yamlfmt' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use 'stop_after_first' to run the first available formatter from the list
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },
}
