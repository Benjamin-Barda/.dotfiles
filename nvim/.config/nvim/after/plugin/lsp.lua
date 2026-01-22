-- note: diagnostics are not exclusive to lsp servers
-- so these can be global keybindings
vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }

        -- these will be buffer-local keybindings
        -- because they only work if you have an active language server

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
        vim.keymap.set('n', '<leader>q', '<cmd>cclose<cr>', opts)
    end,
})

vim.diagnostic.config({
    virtual_text = {
        spacing = 4,
        sources = "always",
        prefix = '●',
    },
    signs = {
        active = true,
    },
    underline = true,
    severity_sort = true,

})


local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local default_setup = function(server)
    require('lspconfig')[server].setup({
        capabilities = lsp_capabilities,
    })
end

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        default_setup,
        yamlls = function()
            require('lspconfig').yamlls.setup({
                capabilities = lsp_capabilities,
                on_attach = function(client, bufnr)
                    -- Disable diagnostics for helm files
                    if vim.bo[bufnr].filetype == 'helm' then
                        vim.diagnostic.disable(bufnr)
                    end
                end,
                settings = {
                    yaml = {
                        -- Additional yamlls settings can go here
                        validate = true,
                        -- Disable validation for helm files at the language server level
                        schemas = {
                            -- You can add specific schemas here if needed
                        },
                    },
                },
            })
        end,
    },
})

local cmp = require('cmp')

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
    },
    mapping = cmp.mapping.preset.insert({
        -- Enter key confirms completion item
        ['<CR>'] = cmp.mapping.confirm({ select = false }),


        ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),

        -- Ctrl + space triggers completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        ['<Tab>'] = nil,
        ['<S-Tab>'] = nil,
    }),
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})

vim.filetype.add({
  extension = {
    gotmpl = 'gotmpl',
  },
  pattern = {
    [".*/templates/.*%.tpl"] = "helm",
    [".*/templates/.*%.ya?ml"] = "helm",
    ["helmfile.*%.ya?ml"] = "helm",
  },
})

