require("settings")
require("keymaps")
if vim.version().major == 0 and vim.version().minor > 11 then
    require("pack")
else
    require("lazy-init")
end
require("tagfunc")
