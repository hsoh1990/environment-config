local builtin = require('telescope.builtin')
local extensions = require("telescope").extensions

vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>t', extensions.live_grep_args.live_grep_args, { noremap = true })

local actions = require('telescope.actions')
require('nvim-web-devicons').setup({
  override = {},
  default = true
})
require('telescope').setup {
  defaults = {
    path_display = { 'smart' },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
      }
    }
  },
  layout_config = {
    horizontal = {
      preview_cutoff = 100,
      preview_width = 0.6
    }
  }
}