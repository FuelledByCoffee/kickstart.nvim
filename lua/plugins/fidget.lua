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
    local macro_key = 'macro_recording_status' -- Unique identifier key for the macro notification

    vim.api.nvim_create_autocmd('RecordingEnter', {
      group = macro_group,
      callback = function()
        local register = vim.fn.reg_recording()
        if register ~= '' then
          -- Send the notification anchored to our custom unique key
          fidget.notify('Recording', vim.log.levels.INFO, {
            key = macro_key,
            annote = string.format('@%s', register),
            ttl = math.huge, -- Ensure it doesn't close on its own
          })
        end
      end,
    })

    vim.api.nvim_create_autocmd('RecordingLeave', {
      group = macro_group,
      callback = function()
        -- We update the same key but set ttl to 0, which triggers Fidget's exit routine
        fidget.notify('Recording finished', vim.log.levels.INFO, {
          key = macro_key,
          annote = 'Macro',
          ttl = 0, -- Drops it immediately
        })
      end,
    })
  end,
}
