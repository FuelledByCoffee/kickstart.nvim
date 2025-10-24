return {
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
      'archie-judd/blink-cmp-words',
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

        ['<c-l>'] = { 'snippet_forward', 'fallback' },
        ['<c-h>'] = { 'snippet_backward', 'fallback' },

        ['<c-s>'] = { 'show_signature', 'hide_signature', 'fallback' },

        ['<CR>'] = { 'accept', 'fallback' },
      },
      appearance = {
        nerd_font_variant = 'mono',
      },
      completion = {
        ghost_text = {
          enabled = true,
          show_with_menu = true,
          show_without_menu = true,
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          update_delay_ms = 100,
        },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'lazydev', 'buffer' },
        providers = {
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
          -- Use the thesaurus source
          thesaurus = {
            name = 'blink-cmp-words',
            module = 'blink-cmp-words.thesaurus',
            -- All available options
            opts = {
              -- A score offset applied to returned items.
              -- By default the highest score is 0 (item 1 has a score of -1, item 2 of -2 etc..).
              score_offset = 0,

              -- Default pointers define the lexical relations listed under each definition,
              -- see Pointer Symbols below.
              -- Default is as below ("antonyms", "similar to" and "also see").
              definition_pointers = { '!', '&', '^' },

              -- The pointers that are considered similar words when using the thesaurus,
              -- see Pointer Symbols below.
              -- Default is as below ("similar to", "also see" }
              similarity_pointers = { '&', '^' },

              -- The depth of similar words to recurse when collecting synonyms. 1 is similar words,
              -- 2 is similar words of similar words, etc. Increasing this may slow results.
              similarity_depth = 2,
            },
          },
          -- Use the dictionary source
          dictionary = {
            name = 'blink-cmp-words',
            module = 'blink-cmp-words.dictionary',
            -- All available options
            opts = {
              -- The number of characters required to trigger completion.
              -- Set this higher if completion is slow, 3 is default.
              dictionary_search_threshold = 3,

              -- See above
              score_offset = 0,

              -- See above
              definition_pointers = { '!', '&', '^' },
            },
          },
        },

        -- Setup completion by filetype
        per_filetype = {
          text = { 'dictionary' },
          markdown = { 'thesaurus' },
          gitcommit = { 'dictionary' },
        },
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
}
