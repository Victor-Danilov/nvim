vim.opt.clipboard = "unnamedplus"
-- Abilita l'indentazione automatica
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.cindent = true

-- Usa l'indentazione basata sul tipo di file
vim.cmd("filetype indent on")

-- Configura tab e spazi (4 spazi per tab)
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.g.mapleader = " "
vim.cmd("set number")
--vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.api.nvim_set_option("clipboard","unnamed")
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

