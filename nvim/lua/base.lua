vim.o.hidden = true
vim.o.ignorecase = true
vim.o.wrap = false
vim.o.termguicolors = true
vim.o.clipboard = "unnamedplus"
vim.o.expandtab = true
vim.o.backup = false
vim.bo.swapfile = false

vim.o.splitright = true
vim.o.splitbelow = true

-- unbreak inotify
vim.o.writebackup = false

-- disable intro msg
vim.o.shortmess = vim.o.shortmess .. "Ic"

vim.o.updatetime=2000

-- set correct working directory
packer.use{
  "airblade/vim-rooter",
  config = function()
    vim.g.rooter_patterns = {".git/"}
    vim.g.rooter_silent_chdir = 1
  end
}

-- Trailing whitespace
packer.use "mboughaba/vim-lessmess"
vim.g.enable_lessmess_onsave = 0

-- Comments
packer.use { 'terrortylor/nvim-comment', config = function() require('nvim_comment').setup() end }

-- Indentation
packer.use "xi/vim-indent-detect"

vim.api.nvim_command("augroup misc")
vim.api.nvim_command("au!")
vim.api.nvim_command("au BufWritePre * LessmessForceExecute")
vim.api.nvim_command( "au FocusGained,BufEnter,CursorHold * if mode() != 'c' | checktime | endif")
vim.api.nvim_command("augroup END")

vim.api.nvim_set_keymap("n", "Q", "q", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-s>", ":w!<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Tab>", "<C-W><C-W>", {})

vim.cmd [[ inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>" ]]
vim.cmd [[ inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>" ]]
