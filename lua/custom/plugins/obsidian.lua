return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    -- refer to `:h file-pattern` for more examples
    'BufReadPre /home/fishy/Documents/Obsidian/Vault/*.md',
    'BufNewFile /home/fishy/Documents/Obsidian/Vault/*.md',
  },
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
    'nvim-telescope/telescope.nvim',
    'nvim-treesitter',
  },
  opts = {
    workspaces = {
      {
        name = 'Vault',
        path = '~/Documents/Obsidian/Vault',
      },
    },

    config = function()
      require('obsidian').setup {

        completion = {
          nvim_cmp = true,
        },

        mappings = {
          -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
          ['of'] = {
            action = function()
              return require('obsidian').util.gf_passthrough()
            end,
            opts = { noremap = false, expr = true, buffer = true },
          },
          -- Toggle check-boxes.
          ['<leader>oc'] = {
            action = function()
              return require('obsidian').util.toggle_checkbox()
            end,
            opts = { buffer = true },
          },
          -- Smart action depending on context, either follow link or toggle checkbox.
          ['<oa>'] = {
            action = function()
              return require('obsidian').util.smart_action()
            end,
            opts = { buffer = true, expr = true },
          },
        },
      }
    end,
  },
}
