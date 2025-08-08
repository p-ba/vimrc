if vim.g.neovide then
    vim.g.neovide_transparency = 0.8
    vim.g.transparency = 0.8
end
vim.opt.linespace = 12
vim.o.guifont = "Fira Code,Menlo:h16"
vim.g.netrw_liststyle = 3
vim.g.mapleader = " "
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 40
vim.opt.grepprg = "rg --vimgrep -U"
vim.opt.guicursor = "n-v-c-i:block"

vim.diagnostic.config({
    virtual_text = true
})

vim.api.nvim_create_user_command(
  'TrimWhitespace',
  function(opts)
	  vim.cmd(":%s/\\s\\+$//e")
  end,
  {
    nargs = 0,
}
)

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.scss"},
    command = "set filetype=css",
})

vim.opt.path = '**'
vim.opt.wildignore:append{
    '**/node_modules/*',
    '**/vendor/*',
    '**/var/cache/*',
    '**/venv/*',
    '**/.venv/*',
    '**/.git/*',
    '**/*.min.js',
    '**/*.min.css',
    '**/*.jpg',
    '**/*.jpeg',
    '**/*.png',
    '**/*.gif',
    '**/*.zip',
    '**/*.gz',
}

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.backspace = 'indent,eol,start'
vim.opt.completeopt = { "menuone", "noselect", "noinsert" }
vim.opt.shortmess:append "c"

vim.opt.wrap = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.iskeyword:append('-')
vim.opt.iskeyword:append('$')

vim.opt.clipboard:append('unnamedplus')

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.config/nvim/undodir'
vim.opt.undofile = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = ""
