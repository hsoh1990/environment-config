local status, nvimtree = pcall(require, "nvim-tree")
if (not status) then
  print("nvim tree is not installed")
  return
end

require("nvim-tree").setup()
vim.keymap.set('n', '<F1>', ':NvimTreeToggle<CR>', {
  noremap = true
})
