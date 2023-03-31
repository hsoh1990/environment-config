vim.g.mapleader = ' '
local keymap = vim.keymap

keymap.set('n', '<C-q>', '<cmd>q<cr>')
keymap.set('n', '<C-s>', '<cmd>w<cr>')
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true })
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })
keymap.set('n', '<S-tab>', '<C-w>w')

-- Mode window
keymap.set('n', '<C-h>', '<C-w>h')
keymap.set('n', '<C-k>', '<C-w>k')
keymap.set('n', '<C-j>', '<C-w>j')
keymap.set('n', '<C-l>', '<C-w>l')

-- Insert mode cursor move
keymap.set('i', '<C-h>', '<Left>')
keymap.set('i', '<C-k>', '<Up>')
keymap.set('i', '<C-j>', '<Down>')
keymap.set('i', '<C-l>', '<Right>')

-- Move cursor
keymap.set('n', 'H', '^')
keymap.set('n', 'L', '$')

-- ESC
keymap.set("i", "jk", "<Esc>")

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')
