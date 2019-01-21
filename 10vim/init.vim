"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
set history=9999

" let terminal resize scale the internal windows
autocmd VimResized * :wincmd =

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set nocompatible              " be iMproved, required
filetype off                  " required

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Encoding
set bomb
set binary
set ttyfast

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac
set showcmd
set shell=/bin/sh

" session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

let erlang_folding = 1
let erlang_show_errors = 1

let g:asyncrun_open = 1

autocmd BufRead,BufNewFile *.md setlocal spell
"set spell spelllang=en_us

" exit insert mode without using Esc
inoremap jk <Esc>

" switch windows with two keystrokes
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h

" enter command mode with one keystroke
nnoremap ; :
nnoremap : ;

" start an external command with a single bang
nnoremap ! :!

" autosave a file when leaving insert mode
" autocmd InsertLeave * if expand('%') != '' | update | endif
autocmd InsertLeave,TextChanged * if expand('%') != '' | update | endif

" Use ',' instead of '\'.
" It is not mapped with respect well unless I set it before setting for plugin.
let mapleader = ','
" Use <Leader> in global plugin.
let g:mapleader = ','
" Use <LocalLeader> in filetype plugin.
let g:maplocalleader = 'm'

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Initialize plugin system
Plug 'philip-karlsson/bolt.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'dbeniamine/cheat.sh-vim'
Plug 'w0rp/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'https://github.com/terryma/vim-expand-region.git'
Plug 'https://github.com/tpope/vim-abolish.git'
Plug 'https://github.com/tpope/vim-repeat.git'
Plug 'https://github.com/tpope/vim-eunuch.git'
Plug 'https://github.com/scrooloose/nerdcommenter.git'
Plug 'https://github.com/vim-scripts/SearchComplete.git'
Plug 'https://github.com/vim-scripts/indentpython.git'
Plug 'https://github.com/Shougo/neomru.vim.git'
Plug 'https://github.com/Shougo/deol.nvim.git'
Plug 'https://github.com/alvan/vim-closetag.git'
Plug 'https://github.com/Raimondi/delimitMate.git'
Plug 'https://github.com/ervandew/supertab.git'
Plug 'https://github.com/majutsushi/tagbar.git'
Plug 'Shougo/vimproc.vim', { 'do': 'make'}
Plug 'luochen1990/rainbow'
Plug 'plasticboy/vim-markdown'
Plug 'terryma/vim-smooth-scroll'
Plug 'https://github.com/tpope/vim-speeddating.git'
Plug 'inside/vim-search-pulse'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'slashmili/alchemist.vim'
Plug 'brooth/far.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'davidhalter/jedi-vim'
Plug 'https://github.com/elzr/vim-json.git'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'https://github.com/aquach/vim-http-client.git'
Plug 'https://github.com/terryma/vim-multiple-cursors.git'
Plug 'https://github.com/jceb/vim-orgmode.git'
Plug 'https://github.com/AndrewRadev/splitjoin.vim.git'
Plug 'rstacruz/sparkup'
Plug 'flazz/vim-colorschemes'
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'
Plug 'https://github.com/akalyaev/vim-erlang-spec.git'
Plug 'https://github.com/edkolev/erlang-motions.vim.git'
Plug 'https://github.com/jimenezrick/vimerl.git'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'jreybert/vimagit'
call plug#end()

" Rainbow turn on
let g:rainbow_active = 1

" Achemist
let g:alchemist#elixir_erlang_src = "/usr/local/share/src"

" pulse
let g:vim_search_pulse_duration = 200

" indent guides
let g:indent_guides_auto_colors = 0
"let g:indent_guides_enable_on_vim_startup = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" colors
"colorscheme desert256
colorscheme desert
"set background=dark

" filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.jsx,*.js"

" Javascript
autocmd FileType javascript.jsx setlocal expandtab

" Open in browser
nnoremap <leader>w :silent !xdg-open <C-R>=escape("<C-R><C-F>", "#?&;\|%")<CR><CR>

" Jedi
let g:jedi#use_splits_not_buffers = "top"

" Ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" End Ultisnip

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'

" Whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Elixir
let g:mix_format_on_save = 1
let g:mix_format_options = '--check-equivalent'
"let g:mix_format_silent_errors = 1
" End Elixir

" Neocomplete
"let g:neocomplete#enable_at_startup = 1
let g:acp_enableAtStartup = 0
" End neocomplete

" Smooth
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 5, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 5, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 5, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 5, 4)<CR>

" Expand region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Denite
call denite#custom#var('file/rec', 'command',
	\ ['rg', '--files', '--glob', '!.git'])
nnoremap <silent> <leader>b :Denite -buffer-name=buffers -winheight=15 buffer tag outline<CR>
nnoremap <silent> <leader>s :DeniteCursorWord -auto-preview grep<CR>

nnoremap <silent> <leader>op :Denite -auto-preview neo_mru/file<CR>
