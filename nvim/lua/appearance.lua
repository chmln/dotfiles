vim.o.hlsearch = false
vim.o.showtabline = 0
vim.o.showcmd = false
vim.o.showmode = false
vim.o.laststatus = 0
vim.o.ruler = false
vim.o.foldenable = false
vim.o.title = true
vim.o.winblend = 7
vim.o.pumblend = 7

vim.wo.cursorline = true
vim.wo.signcolumn = "yes"

vim.o.fillchars = "eob: ,stl:―,stlnc:―,vert:│"
vim.o.statusline = "%a"

packer.use("sainnhe/edge")
vim.g.edge_transparent_background = 1
vim.g.edge_disable_italic_comment = 1
vim.cmd [[ colorscheme edge ]]

-- packer.use {
--   'Th3Whit3Wolf/one-nvim',
--   config = function()
--     vim.g.one_nvim_transparent_bg = true
--     vim.cmd [[ colorscheme one-nvim ]]
--   end
-- }
--

-- Keep cursor vertically centered
vim.api.nvim_command("augroup cursor_centered")
vim.api.nvim_command("au BufEnter * let &scrolloff=winheight(win_getid())")
vim.api.nvim_command("augroup END")

-- icons
packer.use {
  "kyazdani42/nvim-web-devicons",
  config = function()
    require "nvim-web-devicons".setup({ default = true })
  end
}

if os.execute("sh -c '[ $(get_theme) = \"light\" ]'") == 0 then
  vim.o.background = "light"
else
  vim.o.background = "dark"
end

packer.use "dstein64/nvim-scrollview"
vim.g.scrollview_excluded_filetypes = {"LuaTree", "markdown"}

vim.api.nvim_command("augroup CustomHighlights")
vim.api.nvim_command("au!")
vim.api.nvim_command("au BufEnter *.rs hi CocRustChainingHint guifg=#aaaaaa")
vim.api.nvim_command("au! ColorScheme * hi link FloatermBorder Normal")
vim.api.nvim_command(
  "au BufEnter * if &background=='dark' | hi CursorLine guibg=#333333 | else | hi CursorLine guibg=#dddddd | endif"
)
vim.api.nvim_command("au! ColorScheme * highlight StatusLine ctermbg=none ctermfg=0 | highlight StatusLineNC ctermbg=none ctermfg=0")
vim.api.nvim_command(
  "au ColorScheme * if &background=='dark' | hi Indent guifg=#0c0c0c | else | hi Indent guifg=#dddddd | endif"
)
vim.api.nvim_command("augroup end")

-- distraction-free markdown editing
packer.use "plasticboy/vim-markdown"
vim.g.vim_markdown_math = 1
vim.g.vim_markdown_folding_disabled = 1

packer.use {
  "lukas-reineke/indent-blankline.nvim",
  branch = "lua",
  config = function()
    vim.g.indent_blankline_enabled = false
    vim.g.indent_blankline_show_first_indent_level = false
    vim.g.indent_blankline_use_treesitter = true
    vim.g.indent_blankline_char_highlight = 'Indent'
    vim.g.indent_blankline_char = '│'
  end
}
