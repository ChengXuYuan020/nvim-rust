-- https://github.com/onsails/lspkind-nvim

local icons = require("utils.icons")
local options = require("basic.options")

require("lspkind").init(
    {
        symbol_map = icons[options.icons]
    }
)
