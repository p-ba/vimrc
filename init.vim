set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vim/vimrc

lua << EOF
--local nvim_lsp = require('lspconfig')

--local on_attach = function(client, bufnr)
--  require'completion'.on_attach()
--  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

--  local opts = { noremap=true, silent=true }
--  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
--  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)

--  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
--end

--require'lspconfig'.intelephense.setup {
--	cmd = { "/Users/pavelbaraulya/intelephense/node_modules/.bin/intelephense", "--stdio" };
--	on_attach = on_attach
--}
EOF

"let g:completion_enable_snippet = 'UltiSnips'
"let g:completion_chain_complete_list = [
"    \{'complete_items': ['lsp']},
"    \{'complete_items': ['snippet', 'buffers']},
"    \{'mode': '<c-p>'},
"    \{'mode': '<c-n>'}
"\]

