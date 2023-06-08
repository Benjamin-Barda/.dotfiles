vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- lsp
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
            'williamboman/mason.nvim',
            run = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
        }
    }
    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter', 
        run = function() 
            local ts_update = require('nvim-treesitter.install').update({with_sync = true})
            ts_update()
        end,
    }

    -- theme
    use({ 'rose-pine/neovim', as = 'rose-pine' })

    -- telescope

    use {
        'nvim-telescope/telescope.nvim', tag='0.1.0', 
        requires = {{'nvim-lua/plenary.nvim'}}
    }
    use("theprimeagen/harpoon")

    use('ggandor/leap.nvim')

end)
