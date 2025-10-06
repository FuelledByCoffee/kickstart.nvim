--  [[ options ]] {{{

-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

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

local border = 'single'

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

vim.keymap.set('x', '<tab>',   '>gv', { desc = 'Indent selected text'})
vim.keymap.set('x', '<s-tab>', '<gv', { desc = 'Unindent selected text'})

vim.keymap.set('n', 'ø', 'zA', { desc = '[T]oggle [F]old' })

vim.keymap.set('n', '<leader>tw', '<cmd>set wrap!<cr>', { desc = '[T]oggle [W]rap' })

-- Buffer mappings
vim.keymap.set('n', 'gb', '<cmd>bnext<CR>', { desc = 'next [B]uffer' })
vim.keymap.set('n', 'gB', '<cmd>bNext<CR>', { desc = 'previous [B]uffer' })

-- Quickfix
vim.keymap.set('n', '<c-n>', '<cmd>cn<cr>', { desc = 'Ctrl [N]ext quickfix item' })
vim.keymap.set('n', '<c-p>', '<cmd>cp<cr>', { desc = 'Ctrl [P]revious quickfix item' })
vim.keymap.set('n', 'qd', vim.diagnostic.setqflist, { desc = '[Q]uickfix [D]iagnostics' })
-- if lsp is active 'qr' shows references

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<bs>b', '<cmd>bd<CR>', { desc = 'Delete current [B]uffer' })
vim.keymap.set('n', '<bs>ab', '<cmd>%bd<bar>e#<bar>bd#<bar>\'"<CR>', { desc = 'Delete [A]ll other [B]uffers' })

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
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window'  })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- stylua: ignore start
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
    border = 'none'
    -- Your custom highlight commands go here
    -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none', italic = false })
    -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none', italic = false })
    vim.api.nvim_set_hl(0, 'VertSplit', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'Folded', { link = 'PmenuSel' })
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
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=main', lazyrepo, lazypath }
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
    config = function ()
      vim.keymap.set('n', '<leader>gc', '<cmd>Git commit <bar> wincmd L<cr>')
      vim.keymap.set('n', '<leader>gP', '<cmd>silent Git push &<cr>')
    end
  },
  {
    'brenoprata10/nvim-highlight-colors',
    opts = {

    },
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
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 100,
    config = function()
      require('catppuccin').setup {
        flavour                = 'auto', -- latte, frappe, macchiato, mocha
        background             = {       -- :h background
          light = 'latte',
          dark = 'mocha',
        },
        float                  = {
          solid = true,
          transparent = false,
        },
        transparent_background = false, -- disables setting the background color.
        show_end_of_buffer     = false, -- shows the '~' characters after the end of buffers
        term_colors            = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
      }
      -- vim.cmd.colorscheme 'catppuccin'
    end,
  },
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
      }
    },
    opts = {
      cmake_notifications = {
        runner = { enabled = true },
        executor = { enabled = true },
        spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }, -- icons used for progress display
        refresh_rate_ms = 100, -- how often to iterate icons
      },
      cmake_virtual_text_support = true, -- Show the target related to current file using virtual text (at right corner)
    }
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

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      -- delay between pressing a key and opening which-key (milliseconds)
      -- this setting is independent of vim.opt.timeoutlen
      delay = 0,
      win = {
        -- border = border,
        wo = {
          winblend = 20,
        },
      },
      icons = {
        -- set icon mappings to true if you have a Nerd Font
        mappings = vim.g.have_nerd_font,
        -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },

      -- Document existing key chains
      spec = {
        { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
        { '<leader>d', group = '[D]ocument', icon = { icon = '󰈙', color = 'white' } },
        { '<leader>m', group = '[M]ake', icon = { icon = ' ', color = 'orange' } },
        { '<leader>s', group = '[S]earch', icon = { icon = '🔎' } },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>t', group = '[T]oggle', icon = { icon = '󰨚 ', color = 'yellow' } },
        { '<leader>g', group = '[G]it', mode = { 'n', 'v' }, icon = { icon = '', color = 'red' } },
        { 'q', group = '[Q]uickfix' },
        { '-', group = 'LSP' },
      },
    },
  },

  -- NOTE: Plugins can specify dependencies.
  --
  -- The dependencies are proper plugin specifications as well - anything
  -- you do for a plugin at the top level, you can do for a dependency.
  --
  -- Use the `dependencies` key to specify the dependencies of a particular plugin

  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use Telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of `help_tags` options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in Telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- Telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        defaults = {
          border = true,
          borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
          mappings = {
            i = { ['<c-enter>'] = 'to_fuzzy_refine' },
            n = { ['q'] = require('telescope.actions').close }
            -- n = { ['q'] = 'quit' }
          },
        },
        -- pickers = {}
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      local map = function(keys, func, desc, mode)
        mode = mode or 'n'
        vim.keymap.set(mode, keys, func, { desc = '[S]earch ' .. desc })
      end

      -- stylua: ignore start
      map('<leader>sh',       builtin.help_tags,    '[H]elp')
      map('<leader>sk',       builtin.keymaps,      '[K]eymaps')
      map('<leader>s:',       builtin.commands,     '[:] Commands')
      map('<leader>sf',       builtin.find_files,   '[F]iles')
      map('<leader>ss',       builtin.builtin,      '[S]elect Telescope')
      map('<leader>sw',       builtin.grep_string,  'current [W]ord')
      map('<leader>sg',       builtin.live_grep,    'by [G]rep')
      map('<leader>sd',       builtin.diagnostics,  '[D]iagnostics')
      map('<leader>sr',       builtin.resume,       '[R]esume')
      map('<leader>s.',       builtin.oldfiles,     'Recent Files ("." for repeat)')
      map('<leader>sc',       builtin.git_commits,  '[C]ommits')
      map('<leader>sbc',      builtin.git_bcommits, '[B]uffer [C]ommits')
      map('<leader><leader>', builtin.buffers,      '[ ] Find existing buffers')
      -- stylua: ignore stop

      vim.keymap.set('n', '<leader>stc', function()
        builtin.colorscheme { enable_preview = true }
      end, { desc = '[S]earch colorscheme' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 0,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },

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
  {
    -- Main LSP Configuration
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      -- Mason must be loaded before its dependents so we need to set it up here.
      -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
      { 'williamboman/mason.nvim', opts = {} },
      'mason-org/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP. NOTE: `opts = {}` is the same as
      -- calling `require('fidget').setup({})`
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

      -- Allows extra capabilities provided by blink.cmp
      'saghen/blink.cmp',
    },
    config = function()
      -- If you're wondering about lsp vs treesitter, you can check out the wonderfully
      -- and elegantly composed help section, `:help lsp-vs-treesitter`

      --  This function gets run when an LSP attaches to a particular buffer.
      --    That is to say, every time a new file is opened that is associated with
      --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
      --    function will be executed to configure the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          -- NOTE: Remember that Lua is a real programming language, and as such it is possible
          -- to define small helper and utility functions so you don't have to repeat yourself.
          --
          -- In this case, we create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          map('gtd', vim.lsp.buf.type_definition, '[G]oto [T]ype [D]efinition')
          map('qr', vim.lsp.buf.references, '[Q]uickfix [R]eferences')

          -- Rename the variable under your cursor.
          --  Most Language Servers support renaming across files, etc.
          map('<F2>', vim.lsp.buf.rename, 'Rename')
          map('-rn', vim.lsp.buf.rename, '[R]e[n]ame')

          -- Jump to the implementation of the word under your cursor.
          --  Useful when your language has ways of declaring types without an actual implementation.
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

          -- Fuzzy find all the symbols in your current document.
          --  Symbols are things like variables, functions, types, etc.
          map('-ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

          -- Fuzzy find all the symbols in your current workspace.
          --  Similar to document symbols, except searches over your entire project.
          map('-ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          map('<F1>', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
          map('-ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })

          map('K', function()
            vim.lsp.buf.hover { border = border }
          end, 'Hover documentation')

          map('<leader>H', vim.diagnostic.open_float, 'Open floating window showing diagnostic')


          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            -- vim.api.nvim_create_autocmd({ 'CursorHold' }, {
            --   pattern = '*',
            --   callback = function()
            --     vim.diagnostic.open_float {
            --       scope = 'cursor',
            --       focusable = false,
            --       close_events = {
            --         'CursorMoved',
            --         'CursorMovedI',
            --         'BufHidden',
            --         'InsertCharPre',
            --         'WinLeave',
            --       },
            --     }
            --   end,
            -- })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          -- The following code creates a keymap to toggle inlay hints in your
          -- code, if the language server you are using supports them
          --
          -- This may be unwanted, since they displace some of your code
          if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      -- Diagnostic Config
      -- See :help vim.diagnostic.Opts
      vim.diagnostic.config {
        severity_sort = true,
        float = { border = border, source = false },
        -- virtual_lines = { current_line = true },
        underline = { severity = vim.diagnostic.severity.ERROR },
        update_in_insert = false,
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        } or {},
        virtual_text = true,
        -- virtual_text = {
        --   source = 'if_many',
        --   spacing = 2,
        --   format = function(diagnostic)
        --     local diagnostic_message = {
        --       [vim.diagnostic.severity.ERROR] = diagnostic.message,
        --       [vim.diagnostic.severity.WARN] = diagnostic.message,
        --       [vim.diagnostic.severity.INFO] = diagnostic.message,
        --       [vim.diagnostic.severity.HINT] = diagnostic.message,
        --     }
        --     return diagnostic_message[diagnostic.severity]
        --   end,
        -- },
      }


      -- LSP servers and clients are able to communicate to each other what features they support.
      --  By default, Neovim doesn't support everything that is in the LSP specification.
      --  When you add blink.cmp, luasnip, etc. Neovim now has *more* capabilities.
      --  So, we create new capabilities with blink.cmp, and then broadcast that to the servers.
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- Enable the following language servers
      --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
      --
      --  Add any additional override configuration in the following tables. Available keys are:
      --  - cmd (table): Override the default command used to start the server
      --  - filetypes (table): Override the default list of associated filetypes for the server
      --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
      --  - settings (table): Override the default settings passed when initializing the server.
      --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
      local servers = {
        rust_analyzer = {},
        jsonls = {},
        cmake = {},
        -- gopls = {},
        pyright = {},
        -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
        --
        -- Some languages (like typescript) have entire language plugins that can be useful:
        --    https://github.com/pmizio/typescript-tools.nvim
        --
        -- But for many setups, the LSP (`ts_ls`) will work just fine
        -- ts_ls = {},
        --

        lua_ls = {
          -- cmd = { ... },
          -- filetypes = { ... },
          -- capabilities = {},
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
      }

      -- Ensure the servers and tools above are installed
      --
      -- To check the current status of installed tools and/or manually install
      -- other tools, you can run
      --    :Mason
      --
      --  You can press `g?` for help in this menu.
      require('mason').setup {
        ui = {
          border = border,
          icons = {
            package_installed = '',
            package_pending = '',
            package_uninstalled = '',
          },
        },
      }

      -- You can add other tools here that you want Mason to install
      -- for you, so that they are available from within Neovim.
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format Lua code
        'gersemi', -- Used to format cmake code
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
        automatic_installation = false,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for ts_ls)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            vim.lsp.enable(server_name)
          end,
        },
      }

      -- Servers we don't want mason to dowload, but we still want to configure.
      local other_servers = {
        clangd = {
          cmd = {
            'clangd',
            '--compile-commands-dir=build',
            '--background-index',
            '--clang-tidy',
            '--header-insertion=iwyu',
            '--header-insertion-decorators',
          },
          settings = {
            c = {
              vim.keymap.set('n', '<leader>sh', '<cmd>LspClangdSwitchSourceHeader<cr>',
                { desc = 'Switch between [S]ource and [H]eader' }),
            },
          },
        },
      }
      for name, server in pairs(other_servers) do
        server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
        vim.lsp.enable(name)
      end
    end,
  },

  -- Rust lsp
  -- {
  --   'mrcjkb/rustaceanvim',
  --   version = '^5', -- Recommended
  --   lazy = false, -- This plugin is already lazy
  --   config = function()
  --     local bufnr = vim.api.nvim_get_current_buf()
  --     vim.keymap.set('n', '-ca', function()
  --       vim.cmd.RustLsp 'codeAction' -- supports rust-analyzer's grouping
  --       -- or vim.lsp.buf.codeAction() if you don't want grouping.
  --     end, { silent = true, buffer = bufnr })
  --     vim.keymap.set(
  --       'n',
  --       'K', -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
  --       function()
  --         vim.cmd.RustLsp { 'hover', 'actions' }
  --       end,
  --       { silent = true, buffer = bufnr }
  --     )
  --   end,
  -- },

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
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true, json = true }
        local lsp_format_opt
        if disable_filetypes[vim.bo[bufnr].filetype] then
          lsp_format_opt = 'never'
        else
          lsp_format_opt = 'fallback'
        end
        return {
          timeout_ms = 500,
          lsp_format = lsp_format_opt,
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        cmake = { 'gersemi' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use 'stop_after_first' to run the first available formatter from the list
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },

  { -- Autocompletion
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
        opts = {},
      },
      'folke/lazydev.nvim',
    },
    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
      keymap = {
        preset = 'default',
        -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
        --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps

        ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },

        ['<c-j>'] = { 'snippet_forward', 'fallback' },
        ['<c-k>'] = { 'snippet_backward', 'fallback' },

        ['<c-s>'] = { 'show_signature', 'hide_signature', 'fallback' },

        ['<CR>'] = { 'accept', 'fallback' }
      },
      appearance = {
        nerd_font_variant = 'mono'
      },
      completion = {
        ghost_text = {
          enabled           = true,
          show_with_menu    = true,
          show_without_menu = true
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          update_delay_ms = 100
        }
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'lazydev', 'buffer' },
        providers = {
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        }
      },
      snippets = { preset = 'luasnip' },

      -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
      -- which automatically downloads a prebuilt binary when enabled.
      --
      -- By default, we use the Lua implementation instead, but you may enable
      -- the rust implementation via `'prefer_rust_with_warning'`
      --
      -- See :h blink-cmp-config-fuzzy for more information
      fuzzy = { implementation = 'lua' },

      -- Shows a signature help window while you type arguments for a function
      signature = { enabled = true },
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

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- Examples:
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Align/justify text
      --
      -- Examples:
      -- - gaip, - align inner paragraph around ','
      -- - gA}␣  - align with preview around space until next empty line
      require('mini.align').setup()

      -- Move lines of text with Alt+motion
      require('mini.move').setup()

      -- require('mini.animate').setup()
      require('mini.tabline').setup()
      -- require('mini.git').setup {
      --   job = {
      --     timeout = 30000,
      --   },
      --   command = {
      --     split = 'vertical',
      --   },
      --   vim.keymap.set('n', '<leader>gc', '<cmd>Git commit<cr>'),
      --   vim.keymap.set('n', '<leader>gP', '<cmd>Git push<cr>'),
      --   -- local rhs = '<Cmd>lua MiniGit.show_at_cursor()<CR>'
      --   vim.keymap.set({ 'n', 'x' }, '<Leader>gs', function()
      --     MiniGit.show_at_cursor()
      --   end, { desc = 'Show at cursor' })
      -- }

      -- Autmatically add closing paren
      require('mini.pairs').setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    -- Remember you can use :Inspect to see a highlight group

    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'vim', 'vimdoc' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        disable = { 'tmux' },
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby', 'make' },
      },
      indent = { enable = true, disable = { 'ruby', 'json' } },
    },
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
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
  { import = 'custom.plugins' },
  --
  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
  -- Or use telescope!
  -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
  -- you can continue same window with `<space>sr` which resumes last telescope search
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    border = border,
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
