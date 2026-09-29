-- Create a global variable to track the terminal buffer ID
local term_buf = nil

local function toggle_terminal()
  -- Check if the terminal window is currently open
  local term_win = nil
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if buf == term_buf then
      term_win = win
      break
    end
  end

  if term_win then
    -- If open, hide it (close the window, keep the buffer alive)
    vim.api.nvim_win_close(term_win, false)
  else
    -- If closed, open a bottom split
    vim.cmd 'botright split | resize 12'

    if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
      -- If the terminal buffer already exists, reveal it
      vim.api.nvim_win_set_buf(0, term_buf)
    else
      -- If it doesn't exist, create a new terminal and save its buffer ID
      vim.cmd 'terminal'
      term_buf = vim.api.nvim_get_current_buf()
    end
    -- Automatically enter insert mode inside the terminal
    vim.cmd 'startinsert'
  end
end

-- Map the toggle function to <leader>t in normal mode
vim.keymap.set('n', '<leader>tT', toggle_terminal, { silent = true, desc = 'Toggle Terminal' })
