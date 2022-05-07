local options = require("basic.options")

vim.g.vsnip_filetypes = {
    javascript = {"typescript"},
    typescript = {"javascript"},
    vue = {"javascript", "typescript"},
}

vim.g.vsnip_snippet_dir = options.code_snippet_directory
vim.g.dbs = options.database_config

require("basic.after.load_mapping")
require("basic.after.load_snippet")
require("basic.after.input_toggle")
