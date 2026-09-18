return {
  'j-hui/fidget.nvim',
  lazy = false,
  opts = {
    notification = {
      override_vim_notify = true,
      window = {
        winblend = 0,
        border = 'none',
      },
    },
  },
  config = function(_, opts)
    local fidget = require 'fidget'
    fidget.setup(opts)

    -- Handle macro notifications via fidget
    local macro_group = vim.api.nvim_create_augroup('FidgetMacroFix', { clear = true })
    local macro_notification = nil

    vim.api.nvim_create_autocmd('RecordingEnter', {
      group = macro_group,
      callback = function()
        local register = vim.fn.reg_recording()
        if register ~= '' then
          -- Open a notification that remains until dismissed manually
          macro_notification =
            fidget.notify(string.format('Recording @%s...', register), vim.log.levels.INFO, {
              annote = 'Macro',
              ttl = math.huge, -- Do not let it auto-expire while typing
            })
        end
      end,
    })

    vim.api.nvim_create_autocmd('RecordingLeave', {
      group = macro_group,
      callback = function()
        -- Instantly clear the notification when recording stops
        if macro_notification then
          macro_notification.message = 'Finished recording'
          macro_notification:kill()
          macro_notification = nil
        end
      end,
    })
  end,
}
