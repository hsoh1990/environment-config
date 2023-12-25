return {
  'mg979/vim-visual-multi',
  'f-person/git-blame.nvim',
  'github/copilot.vim',
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },
  -- {
  --   'sainnhe/everforest',
  --   priority = 1000,
  --   config = function()
  --     vim.g.everforest_diagnostic_line_highlight = 1
  --     vim.cmd [[colorscheme everforest]]
  --   end,
  -- },
  {
    'craftzdog/solarized-osaka.nvim',
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
      }
    end,
  },
}
