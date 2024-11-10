vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    print("Errore nel caricare nvim-tree")
    return
end

-- Funzione per configurare le mappature quando `nvim-tree` è attivo
--local function on_attach(bufnr)
--    local api = require('nvim-tree.api')
--    api.tree.toggle()
--
--    local function opts(desc)
--        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
--    end
--end

-- Configura nvim-tree
nvim_tree.setup({
    sort_by = "case_sensitive",
    view = {
        width = 35,
        side = "left",
    },
    renderer = {
        highlight_opened_files = "all",
        group_empty = true,
        icons = {
            glyphs = {
                default = "📄",
                symlink = "🔗",
                folder = {
                    arrow_open = "▼",
                    arrow_closed = "▶",
                    default = "📁",
                    open = "📂",
                },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                },
            },
        },
    },
    diagnostics = {
        enable = true,
        icons = {
            hint = "💡",
            info = "ℹ️",
            warning = "⚠️",
            error = "❌",
        },
    },
    git = {
        enable = true,
        ignore = false,
    },
})
vim.keymap.set('n', '<C-n>', ':NvimTreeFindFileToggle<CR>', { noremap = true, silent = true })

