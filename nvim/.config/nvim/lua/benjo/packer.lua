vim.cmd [[packadd packer.nvim]]

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use "nvim-lua/plenary.nvim"
    -- lsp

    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'L3MON4D3/LuaSnip'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }


    -- theme
    use({ 'rose-pine/neovim', as = 'rose-pine' })
    use({ 'bluz71/vim-moonfly-colors', as = 'moonfly' })

    -- telescope

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } }
    }

    use { 'echasnovski/mini.nvim', branch = 'stable' }

    use('github/copilot.vim')

    use('windwp/nvim-ts-autotag')

    use {
        "ThePrimeagen/99",
        config = function()
            local _99 = require("99")
            local cwd = vim.uv.cwd()
            local basename = vim.fs.basename(cwd)
            require('99').setup({
                logger = {
                    level = _99.DEBUG,
                    path = "/tmp/" .. basename .. "101.log",
                    print_on_error = true,
                },
                model = "github-copilot/gemini-3-pro-preview"
,
            })

            vim.keymap.set("n", "<leader>9f", function()
                _99.fill_in_function_prompt()
            end)

            vim.keymap.set("v", "<leader>9v", function()
                _99.visual_prompt()
            end)

            vim.keymap.set("n", "<leader>9d", function()
                _99.stop_all_requests()
            end)
        end,
    }
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function()
            vim.g.mkdp_filetypes = {
                "markdown" }
        end,
        ft = { "markdown" },
    })

    if packer_bootstrap then
        require('packer').sync()
    end
end)
