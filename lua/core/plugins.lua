local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- THEMES
    use 'rose-pine/neovim'
    use 'ellisonleao/gruvbox.nvim'
---------------------------------------------------
    -- Nvim-Tree
    use {
        "nvim-tree/nvim-tree.lua",
        requires = {"nvim-tree/nvim-web-devicons",
        },
    }

    -- Lualine
    use 'nvim-lualine/lualine.nvim'

    -- Telescope
    use {
        "nvim-telescope/telescope.nvim", tag = '0.1.6',
        -- or                            , branch = '0.1.x',
        requires = { {"nvim-lua/plenary.nvim"} }
    }

    -- Digraphs 
    use {
        'protex/better-digraphs.nvim',
        requires = { 'nvim-telescope/telescope.nvim' }
    }

    -- Treesitter
    use ('nvim-treesitter/nvim-treesitter', {run = ":TSUpdate"})

    -- Playground
    use 'nvim-treesitter/playground'

    -- LSP mason
    use {
        "williamboman/mason.nvim", run = ":MasonUpdate",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig"
    }

    -- Completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'rafamadriz/friendly-snippets'

    -- Pandoc for making pdf
    use 'vim-pandoc/vim-pandoc'
    use 'vim-pandoc/vim-pandoc-syntax'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
