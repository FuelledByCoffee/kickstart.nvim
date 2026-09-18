return {
  { -- Autocompletion
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    dependencies = {
      'folke/lazydev.nvim',
      'rafamadriz/friendly-snippets',
      'L3MON4D3/LuaSnip',
      'archie-judd/blink-cmp-words',
      'disrupted/blink-cmp-conventional-commits',
      'mgalliou/blink-cmp-tmux',
      'Kaiser-Yang/blink-cmp-git',
      'barrettruth/blink-cmp-ghostty',
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
        -- default = { 'lsp', 'path', 'snippets', 'lazydev', 'buffer', 'dictionary', 'thesaurus' },
        default = function()
          local node = vim.treesitter.get_node()
          if
            node and vim.tbl_contains({ 'comment', 'line_comment', 'block_comment' }, node:type())
          then
            return { 'buffer', 'dictionary', 'thesaurus' }
          else
            return { 'lsp', 'path', 'snippets', 'buffer', 'dictionary', 'thesaurus' }
          end
        end,
        providers = {
          lsp = { score_offset = 300 },
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
          -- Use the thesaurus source
          tmux = { module = 'blink-cmp-tmux', name = 'tmux' },
          git = { module = 'blink-cmp-git', name = 'Git' },
          ghostty = { module = 'blink-cmp-ghostty', name = 'ghostty' },
          thesaurus = {
            name = 'thesaurus',
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
            name = 'dictionary',
            module = 'blink-cmp-words.dictionary',
            -- All available options
            opts = {
              -- The number of characters required to trigger completion.
              -- Set this higher if completion is slow, 3 is default.
              dictionary_search_threshold = 4,

              -- See above
              score_offset = 20,

              -- See above
              definition_pointers = { '!', '&', '^' },
            },
          },
          conventional_commits = {
            name = 'conventional commits',
            module = 'blink-cmp-conventional-commits',
            score_offset = 100,
            opts = {},
          },
        },

        -- Setup completion by filetype
        per_filetype = {
          gitcommit = { 'conventional_commits', 'git', inherit_defaults = true },
          lua = { 'lazydev', inherit_defaults = true },
        },
      },
      snippets = { preset = 'default' },

      -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
      -- which automatically downloads a prebuilt binary when enabled.
      --
      -- By default, we use the Lua implementation instead, but you may enable
      -- the rust implementation via `'prefer_rust_with_warning'`
      --
      -- See :h blink-cmp-config-fuzzy for more information
      fuzzy = { implementation = 'rust' },

      -- Shows a signature help window while you type arguments for a function
      -- signature = { enabled = true },
    },
    opts_extend = { 'sources.default' },
  },
}
