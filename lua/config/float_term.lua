-- Table to persist terminal window and buffer state
local state = {
  floating = {
    buf = -1,
    win = -1,
  },
}

local function create_floating_window(opts)
  opts = opts or {}

  -- Get current screen dimensions
  local stats = vim.api.nvim_list_uis()[1]
  local width = opts.width or math.floor(stats.width * 0.8)
  local height = opts.height or math.floor(stats.height * 0.8)

  -- Calculate center position
  local col = math.floor((stats.width - width) / 2)
  local row = math.floor((stats.height - height) / 2)

  -- Create or reuse buffer
  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
  end

  -- Window configuration options
  local win_config = {
    relative = 'editor',
    width = width,
    height = height,
    col = col,
    row = row,
    style = 'minimal',
    border = 'rounded',
  }

  -- Open the floating window
  local win = vim.api.nvim_open_win(buf, true, win_config)

  return { buf = buf, win = win }
end

local toggle_terminal = function()
  -- If window is open and valid, close it
  if vim.api.nvim_win_is_valid(state.floating.win) then
    vim.api.nvim_win_close(state.floating.win, true)
  else
    -- Open floating window using persistent buffer state
    state.floating = create_floating_window { buf = state.floating.buf }

    -- Initialize terminal if it's a fresh buffer
    if vim.bo[state.floating.buf].buftype ~= 'terminal' then
      vim.cmd.terminal()
    end

    -- Auto-enter insert mode inside the terminal
    vim.cmd 'startinsert'
  end
end

-- Create a user command :FloatTerm
vim.api.nvim_create_user_command('FloatTerm', toggle_terminal, {})

-- Bind Ctrl + t to toggle terminal in both Normal and Terminal modes
vim.keymap.set({ 'n', 't' }, '<C-t>', toggle_terminal, { desc = 'Toggle floating terminal' })
