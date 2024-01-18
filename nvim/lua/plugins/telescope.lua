return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.4',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
    'nvim-telescope/telescope-file-browser.nvim',
  },
  config = function()
    local builtin = require 'telescope.builtin'
    local keymap = vim.keymap
    local actions = require 'telescope.actions'

    keymap.set('n', '<leader>f', builtin.find_files, {})
    keymap.set('n', '<leader>g', builtin.live_grep, {})
    keymap.set('n', 'sf', function()
      local telescope = require 'telescope'

      local function telescope_buffer_dir()
        return vim.fn.expand '%:p:h'
      end

      telescope.extensions.file_browser.file_browser {
        path = '%:p:h',
        cwd = telescope_buffer_dir(),
        respect_gitignore = false,
        hidden = true,
        grouped = true,
        previewer = false,
        initial_mode = 'normal',
        layout_config = { height = 40 },
      }
    end)

    require('telescope').setup {
      defaults = {
        layout_strategy = 'vertical',
        mappings = {
          i = {
            ['<Tab>'] = actions.move_selection_next,
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
            ['<esc>'] = actions.close,
          },
        },
        file_ignore_patterns = {
          'codegen.ts',
          '.git',
          'lazy-lock.json',
          '*-lock.yaml',
          'node_modules',
          '%.lock',
        },
        dynamic_preview_title = true,
        path_display = { 'smart' },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
      layout_config = {
        prompt_position = 'top', -- 검색어 창을 위로 올림
        horizontal = {
          preview_cutoff = 100,
          preview_width = 0.5,
        },
      },
    }
  end,
}
