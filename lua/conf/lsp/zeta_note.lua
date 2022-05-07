-- https://github.com/artempyanykh/zeta-note

local requires = require("conf.lsp.requires")

return {
    cmd = {requires.zeta_path},
    root_dir = function()
        return vim.fn.getcwd()
    end
}
