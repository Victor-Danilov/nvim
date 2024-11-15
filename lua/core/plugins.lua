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
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
    })
    use 'ellisonleao/gruvbox.nvim'
---------------------------------------------------
    use {
        "nvim-tree/nvim-tree.lua",
        requires = {"nvim-tree/nvim-web-devicons",
        },
    }
    use 'nvim-lualine/lualine.nvim'

    use {
        "nvim-telescope/telescope.nvim", tag = '0.1.6',
        -- or                            , branch = '0.1.x',
        requires = { {"nvim-lua/plenary.nvim"} }
    }
    use ('nvim-treesitter/nvim-treesitter', {run = ":TSUpdate"})
    use 'nvim-treesitter/playground'
    use 'nvim-lua/plenary.nvim'
    use {
        "williamboman/mason.nvim", run = ":MasonUpdate",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig"
    }
    -- completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'rafamadriz/friendly-snippets'


    use 'vim-pandoc/vim-pandoc'
    use 'vim-pandoc/vim-pandoc-syntax'
    --use 'neoclide/coc.nvim'
    -- My plugins here
    -- use 'foo1/bar1.nvim'
    -- use 'foo2/bar2.nvim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
