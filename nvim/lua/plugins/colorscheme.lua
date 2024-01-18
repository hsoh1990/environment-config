return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
        vim.g.everforest_diagnostic_line_highlight = 1
        vim.cmd [[colorscheme catppuccin"]]
  end,
}
