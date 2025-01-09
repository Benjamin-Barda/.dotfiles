require("benjo")
require('leap').add_default_mappings()

-- require("cmz").setup()

vim.filetype.add({
    extension = {
        templ = "templ"
    },
})

vim.cmd('colorscheme moonfly')
