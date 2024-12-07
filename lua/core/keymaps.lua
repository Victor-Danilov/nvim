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

-- folding
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 99
vim.o.foldcolumn = "1" -- Aggiunge una colonna a sinistra per indicare i fold
vim.o.foldenable = true -- Abilita i fold automaticamente


-- folding keymaps
vim.keymap.set('n', '<Leader>zM', 'zM') -- Chiude tutti i fold
vim.keymap.set('n', '<Leader>zR', 'zR') -- Apre tutti i fold
vim.keymap.set('n', '<Leader>zc', 'zc') -- Chiude il fold sotto il cursore
vim.keymap.set('n', '<Leader>zo', 'zo') -- Apre il fold sotto il cursore

