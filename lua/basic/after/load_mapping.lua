local mapping = require("basic.mapping")

for group_name, _ in pairs(mapping.global) do
    mapping.register("global", group_name, nil)
end
