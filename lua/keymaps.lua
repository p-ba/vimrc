vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<Leader>s", ":wa<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>co", ":copen<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>cq", ":cclose<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", ":cnext<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", ":cprev<CR>", { silent = true })
vim.keymap.set("n", "<Leader>g", ":grep <cword><CR>:copen<CR>", { silent = true })
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true })

local function copy_path_to_clipboard()
    local path = vim.fn.expand("%:p")
    vim.fn.setreg("+", path)
    vim.notify('Copied "' .. path .. '" to the clipboard!')
end
vim.keymap.set("n", "<Leader>c", copy_path_to_clipboard, { noremap = true, silent = true })

local find_definition_regex = string.gsub(string.gsub([[
(^[ \t]*(function|def|class|interface|public|private|protected)(\s\w*)*\s<cword>[\s\n{(])
|
(^[ \t]*(\w*)\s<cword>[ :=]*(function[ ]*)?\()
]], "\n", ""), "|", "\\|")
local cmd = string.format(":grep '%s'<CR>:copen<CR>", find_definition_regex)

vim.keymap.set("n", "<Leader>d", cmd, { silent = true })
