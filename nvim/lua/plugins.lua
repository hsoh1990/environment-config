vim.cmd [[packadd packer.nvim]]

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua PackerSync
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    tag = 'nightly'
  }
  use 'sainnhe/everforest'

  use 'rmagatti/alternate-toggler'
  use 'windwp/nvim-autopairs'
  use 'mg979/vim-visual-multi'
  use 'gcmt/wildfire.vim'
  use 'tpope/vim-surround'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = {
      { "nvim-telescope/telescope-live-grep-args.nvim" },
      { 'nvim-lua/plenary.nvim' }
    },
    config = function()
      require("telescope").load_extension("live_grep_args")
    end
  }
  use 'MattesGroeger/vim-bookmarks'
  use 'tom-anders/telescope-vim-bookmarks.nvim'

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'onsails/lspkind-nvim'

  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'jose-elias-alvarez/typescript.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'windwp/nvim-ts-autotag'
  use 'p00f/nvim-ts-rainbow'
  use 'axelvc/template-string.nvim'
  use 'xiyaowong/nvim-transparent'
  use 'folke/todo-comments.nvim'
  use 'numToStr/Comment.nvim'
  use({
    'akinsho/toggleterm.nvim',
    tag = '*'
  })
  use 'tpope/vim-obsession'
  use 'dhruvasagar/vim-prosession'
  use('f-person/git-blame.nvim')
  use('github/copilot.vim')
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
  })
  use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
  use { 'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile' }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

end)
