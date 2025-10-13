--  [[ options ]] {{{

-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

vim.g.border = 'none'

vim.o.termguicolors = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

vim.o.wrap = false

-- Make line numbers default
vim.o.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
-- vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.o.breakindent = true

-- Increment and decrement Ctrl-a Ctrl-x ignore leading -
vim.o.nrformats = 'bin,octal,hex,unsigned'

-- Save undo history
vim.o.undofile = true

vim.o.foldlevel = 99

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.wildignorecase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide` `:help 'listchars'`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

vim.o.tabstop = 4
vim.o.shiftwidth = 0
vim.o.expandtab = false
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

vim.filetype.add {
  extension = {
    json = 'json5',
  },
}

-- }}}

-- [[ Basic Keymaps ]] See `:help vim.keymap.set()` {{{
-- stylua: ignore start
vim.keymap.set('i', 'jj',        '<esc>',                 { desc = 'Exit insert mode'  })
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>',            { desc = '[W]rite'           })
vim.keymap.set('n', '<leader>q', '<cmd>q<cr>',            { desc = '[Q]uit'            })
vim.keymap.set('n', '<leader>Q', '<cmd>qa!<cr>',          { desc = '[Q]uit everything' })
vim.keymap.set('n', '<leader>T', '<cmd>split +term<cr>i', { desc = 'Open terminal'     })

-- Make
vim.keymap.set('n', '<F7>',       '<cmd>make<cr><cmd>cw<cr>', { desc = 'make'           })
vim.keymap.set('n', '<leader>mm', '<cmd>make<cr>',            { desc = '[M]ake'         })
vim.keymap.set('n', '<leader>mr', '<cmd>make! run<cr>',       { desc = '[M]ake [R]un'   })
vim.keymap.set('n', '<leader>mt', '<cmd>make! test<cr>',      { desc = '[M]ake [T]est'  })
vim.keymap.set('n', '<leader>mc', '<cmd>make clean<cr>',      { desc = '[M]ake [C]lean' })
vim.keymap.set('n', '<leader>cc', '<cmd>cclose<cr>',          { desc = '[C] [C]lose'    })

vim.keymap.set('x', '<tab>',   '>gv', { desc = 'Indent   selected text' })
vim.keymap.set('x', '<s-tab>', '<gv', { desc = 'Unindent selected text' })

vim.keymap.set('n', 'ø', 'zA', { desc = '[T]oggle [F]old' })

vim.keymap.set('n', '<leader>tw', '<cmd>set wrap!<cr>', { desc = '[T]oggle [W]rap' })

-- Buffer mappings
vim.keymap.set('n', 'gb', '<cmd>bnext<CR>', { desc = 'next [B]uffer' })
vim.keymap.set('n', 'gB', '<cmd>bNext<CR>', { desc = 'previous [B]uffer' })

-- Quickfix
vim.keymap.set('n', '<c-n>', '<cmd>cn<cr>',            { desc = 'Ctrl       [N]ext         quickfix item' })
vim.keymap.set('n', '<c-p>', '<cmd>cp<cr>',            { desc = 'Ctrl       [P]revious     quickfix item' })
vim.keymap.set('n', 'qd',    vim.diagnostic.setqflist, { desc = '[Q]uickfix [D]iagnostics' })
-- if lsp is active 'qr' shows references

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<bs>b',  '<cmd>bd<CR>',                         { desc = 'Delete current [B]uffer' })
vim.keymap.set('n', '<bs>ab', '<cmd>%bd<bar>e#<bar>bd#<bar>\'"<CR>', { desc = 'Delete [A]ll   other     [B]uffers' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left  window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '√', ':m .+1<CR>==',     { noremap = true, silent = true })
vim.keymap.set('n', 'ª', ':m .-2<CR>==',     { noremap = true, silent = true })
vim.keymap.set('x', '√', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set('x', 'ª', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

vim.keymap.set('n', '<A-j>', ':m .+1<CR>==',     { noremap = true, silent = true })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==',     { noremap = true, silent = true })
vim.keymap.set('x', '<A-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set('x', '<A-k>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- stylua: ignore end
-- }}}

-- [[ Basic Autocommands ]] {{{
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank { timeout = 400 }
  end,
})

-- Set makeprg to Ninja if ninja build files exist in subdirectories
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = { '*.c*', '*.h*', 'CMake*' },
  desc = 'Override makeprg if ninja build files can be found',
  callback = function()
    local ninjafiles = vim.fs.find({ 'build.ninja' }, { type = 'file' })
    local builddir = vim.fs.dirname(ninjafiles[1])

    if builddir ~= nil then
      vim.opt.makeprg = 'ninja -C ' .. builddir
      vim.api.nvim_create_user_command('Configure', '!cmake ' .. builddir, {})
      vim.api.nvim_create_user_command('Reconfigure', '!cmake -B ' .. builddir .. ' --fresh', {})
      vim.api.nvim_create_user_command('CTest', '!ctest --test-dir ' .. builddir .. ' -j', {})
      vim.keymap.set('n', '<leader>mt', '<cmd>CTest<cr>')
    end
  end,
})

-- Jump to last position when opening a file
vim.api.nvim_create_autocmd('BufRead', {
  callback = function(opts)
    vim.api.nvim_create_autocmd('FileType', {
      once = true,
      buffer = opts.buf,
      callback = function()
        local ft = vim.bo[opts.buf].ft
        local last_pos = vim.api.nvim_buf_get_mark(opts.buf, '"')
        if not (ft:match 'commit' or ft:match 'rebase') and last_pos[1] > 1 and last_pos[1] <= vim.api.nvim_buf_line_count(opts.buf) then
          vim.api.nvim_feedkeys('g`"', 'x', false)
        end
      end,
    })
  end,
})

-- }}}

-- [[ ColorScheme ]] {{{
vim.api.nvim_create_autocmd('ColorScheme', {
  group = vim.api.nvim_create_augroup('retrobox-overrides', { clear = false }),
  pattern = 'retrobox', -- colorscheme or list of schemes
  callback = function()
    -- Your custom highlight commands go here
    -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none', italic = false })
    -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none', italic = false })
    vim.api.nvim_set_hl(0, 'VertSplit', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'Folded', { link = 'PmenuSel' })
    vim.api.nvim_set_hl(0, 'Path', { link = 'Identifier' })
    vim.api.nvim_set_hl(0, 'signcolumn', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'CursorLineNr', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'LspReferenceText', { underline = true })
  end,
})

vim.cmd.colorscheme 'retrobox'
-- }}}

-- [[ Install `lazy.nvim` plugin manager ]] {{{
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- }}}

-- [[ Configure and install plugins ]] {{{
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  -- 'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gc', '<cmd>Git commit <bar> wincmd L<cr>')
      vim.keymap.set('n', '<leader>gP', '<cmd>Git push<cr>')
    end,
  },
  {
    'brenoprata10/nvim-highlight-colors',
    opts = {},
  },
  {
    'm4xshen/autoclose.nvim',
    opts = {
      options = {
        disabled_filetypes = {},
      },
    },
  },
  {
    'FuelledByCoffee/toggle-bool.nvim',
    opts = {
      mapping = '<leader>to',
      map_description = '[T]oggle [O]ption',
      additional_toggles = {
        ON = 'OFF',
        TRUE = 'FALSE',
        Enable = 'Disable',
        start = 'stop',
      },
    },
  },

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to automatically pass options to a plugin's `setup()` function, forcing the plugin to be loaded.
  --

  -- Alternatively, use `config = function() ... end` for full control over the configuration.
  -- If you prefer to call `setup` explicitly, use:
  --    {
  --        'lewis6991/gitsigns.nvim',
  --        config = function()
  --            require('gitsigns').setup({
  --                -- Your gitsigns configuration here
  --            })
  --        end,
  --    }
  --
  -- Here is a more advanced example where we pass configuration
  -- options to `gitsigns.nvim`.
  --
  -- See `:help gitsigns` to understand what the configuration keys do
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      diff_opts = {
        vertical = true,
      },
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  {
    'sindrets/diffview.nvim',
    opts = {
      hooks = {
        diff_buf_read = function(_)
          -- Change local options in diff buffers
          vim.opt_local.wrap = false
          vim.opt_local.list = false
          vim.opt_local.colorcolumn = { 80 }
        end,
        view_opened = function(view)
          print(('A new %s was opened on tab page %d!'):format(view.class:name(), view.tabpage))
        end,
      },
    },
  },
  -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `opts` key (recommended), the configuration runs
  -- after the plugin has been loaded as `require(MODULE).setup(opts)`.

  -- NOTE: Plugins can specify dependencies.
  --
  -- The dependencies are proper plugin specifications as well - anything
  -- you do for a plugin at the top level, you can do for a dependency.
  --
  -- Use the `dependencies` key to specify the dependencies of a particular plugin

  -- LSP Plugins
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      signs = true,
      highlight = {
        before = '',
      },
      -- colors = {
      --   error = { '#DC2424' },
      --   warning = { '#FFDD00' },
      --   info = { '#2563EB' },
      -- },
    },
  },

  -- The following comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- place them in the correct locations.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
  --
  --  Here are some example plugins that I've included in the Kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',
  require 'kickstart.plugins.autopairs',
  require 'kickstart.plugins.neo-tree',
  require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  { import = 'plugins' },
  --
  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
  -- Or use telescope!
  -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
  -- you can continue same window with `<space>sr` which resumes last telescope search
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    border = 'none',
    backdrop = 10,

    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- }}}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 expandtab foldmethod=marker foldlevel=0
