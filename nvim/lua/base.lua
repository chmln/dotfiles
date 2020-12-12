vim.o.hidden = true
vim.o.ignorecase = true
vim.o.wrap = false
vim.o.termguicolors = true
vim.o.clipboard = "unnamedplus"
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.backup = false
vim.o.shell = "/bin/dash"

vim.cmd [[ set noswapfile ]]

-- unbreak inotify
vim.o.writebackup = false

-- disable intro msg
vim.o.shortmess = vim.o.shortmess .. "Ic"

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- allow resizing splits with mouse
-- vim.o.mouse = "a"

-- set correct working directory
packer.use "airblade/vim-rooter"
vim.g.rooter_patterns = {".git/"}
vim.g.rooter_silent_chdir = 1

-- Trailing whitespace
packer.use "mboughaba/vim-lessmess"
vim.g.enable_lessmess_onsave = 0

-- Comments
packer.use "noahares/nvim-commenter"
vim.api.nvim_set_keymap("n", "<C-_>", ":SingleCommenterToggle<CR>", {})
vim.api.nvim_set_keymap("v", "<C-_>", ":MultiCommenterToggle<CR>", {})

packer.use "xi/vim-indent-detect"

vim.api.nvim_command("augroup misc")
vim.api.nvim_command("au!")
-- Remove whitespace
vim.api.nvim_command("au BufWritePre * LessmessExecute")
-- Update buffer on external changes
vim.api.nvim_command(
  "au FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif"
)
vim.api.nvim_command("augroup END")

-- disable arrow keys
vim.api.nvim_set_keymap("n", "<Left>", "<Nop>", {})
vim.api.nvim_set_keymap("n", "<Right>", "<Nop>", {})
vim.api.nvim_set_keymap("n", "<Up>", "<Nop>", {})
vim.api.nvim_set_keymap("n", "<Down>", "<Nop>", {})

vim.api.nvim_set_keymap("n", "Q", "q", {noremap = true})
vim.api.nvim_set_keymap(
  "n",
  "<C-s>",
  ":w!<CR>",
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap("n", "<Tab>", "<C-W><C-W>", {})

vim.cmd [[ inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : coc#refresh() ]]
vim.cmd [[ inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>" ]]

-- sane terminal/split setup
packer.use "vimlab/split-term.vim"
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.fillchars = "eob: ,stl:―,stlnc:―,vert:│"
vim.o.statusline = "%a"

vim.api.nvim_command("augroup splits")
vim.api.nvim_command("au!")
vim.api.nvim_command(
  "au! ColorScheme * highlight StatusLine ctermbg=none ctermfg=0 | highlight StatusLineNC ctermbg=none ctermfg=0"
)
vim.api.nvim_command("augroup END")

vim.api.nvim_command("augroup termstuff")
vim.api.nvim_command("au!")
vim.api.nvim_command(
  "au! TermOpen * setlocal nonumber norelativenumber nocursorline"
)
vim.api.nvim_command("augroup END")

-- open external terminal
vim.api.nvim_set_keymap(
  "n",
  "<F4>",
  ":silent !nohup env -u NVIM_LISTEN_ADDRESS terminal >/dev/null 2>&1 &<CR>",
  {}
)
-- open internal terminal
vim.api.nvim_set_keymap("n", "<F5>", ":Term 20 fish<CR>", {})
