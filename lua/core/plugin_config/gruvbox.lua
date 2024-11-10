-- Controlla che il plugin sia caricato correttamente
local status_ok, rose_pine = pcall(require, "gruvbox")
if not status_ok then
    print("Errore nel caricare rose-pine")
    return
end

-- Applica la colorscheme
vim.cmd('colorscheme gruvbox')

