let mapleader='\'

" Clear autocmds
autocmd!

" Use Vim settings, rather than Vi settings
" This must be first because it changes other options as a side effect
set nocompatible

" Don't show mode
set noshowmode

set number

" automatically reload vimrc when it's saved
au BufWritePost .vimrc so $MYVIMRC
autocmd BufWritePre * :%s/\s\+$//e

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'dockyard/vim-easydir'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'simon2k/vim-i18n'
Plugin 'szw/vim-tags'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'simon2k/vim-jump-to-test'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-commentary'

command! -nargs=1 Silent
\ | execute ':silent !'.<q-args>
\ | execute ':redraw!'

" All of your Plugins must be added before the following line
call vundle#end()

" CtrlP
hi def link CtrlPMatch CursorLine
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git\|node_modules\|bin\|\.hg\|\.svn\|build\|log\|resources\|coverage\|doc\|tmp\|public/assets\|vendor\|Android',
  \ 'file': '\.jpg$\|\.exe$\|\.so$\|tags$\|\.dll$'
  \ }

" Enable file type detection and load plugin indent files
filetype plugin on
filetype plugin indent on

nnoremap <TAB> :bn<cr>
nnoremap <S-TAB> :bp<cr>

let g:netrw_liststyle = 0

" Don't map rubyhash keys
let g:rubyhash_map_keys = 0
" ruby path if you are using RVM
let g:ruby_path = system('rvm current')
" Intent private methods
let g:ruby_indent_access_modifier_style = 'outdent'

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

set listchars=

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=128

" Use only 1 space after "." when joining lines instead of 2
set nojoinspaces

" Don't reset cursor to start of line when moving around
set nostartofline

"" Autocomplete ids and classes in CSS
autocmd FileType css,scss set iskeyword=@,48-57,_,-,?,!,192-255
"" Add the '-' as a keyword in erb files
autocmd FileType eruby set iskeyword=@,48-57,_,192-255,$,-

set background=dark
colorscheme railscasts
highlight clear SignColumn
highlight SignColumn term=standout ctermfg=242 ctermbg=bg guifg=#777777 guibg=bg

syntax enable
syntax sync fromstart

set hlsearch                    " highlight the search
set ls=2                        " show a status line even if there's only one window

" Improve vim's scrolling speed
set ttyfast
set ttyscroll=3
set lazyredraw

set wildmenu                    " show completion on the modeline
set linespace=0                 " number of pixels between the lines
set splitright                  " open vertical splits on the right
set splitbelow                  " open the horizontal split below
set wrap                        " wrap long lines
set linebreak                   " break lines at word end
set nobackup                    " don't want no backup files
set nowritebackup               " don't make a backup before overwriting a file
set noswapfile                  " no swap files
set hidden                      " hide buffers when abandoned

" Time out on key codes but not mappings
set notimeout
set ttimeout
set ttimeoutlen=100

" Auto-reload buffers when files are changed on disk
set autoread

" Lines with equal indent form a fold.
set foldmethod=indent
set foldlevel=1
set foldnestmax=10
" Open all folds by default
set nofoldenable

set undofile                    " Save undo's after file closes
set undodir=~/.vim/undo         " where to save undo histories
set undolevels=1000             " How many undos
set undoreload=10000            " number of lines to save for undo

set vb                          " disable alert sound
set showcmd                     " display incomplete commands
set history=100                 " a ton of history

" Default shell and shell syntax and source ~/.bash_profile
set shell=/bin/bash\ --login
let g:is_bash=1

" Whitespace
set tabstop=2 shiftwidth=2      " a tab is two spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode

" Searching
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set scrolloff=0                 " keep a 5 line padding when moving the cursor

set autoindent                  " indent on enter
set smartindent                 " do smart indenting when starting a new line
set shiftround                  " indent to the closest shiftwidth

set switchbuf=""                " do not move focus/cursor to where the buffer is already open
set tagbsearch                  " use binary searching for tags

" The "Press ENTER or type command to continue" prompt is jarring and usually unnecessary.
set shortmess=atI

" Search word under cursor
nnoremap K :Ag <cword><cr>
nnoremap <leader>a :Ag

" Expand %% to current directory
" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%')<cr>

" Limit commit message width and check spelling
autocmd Filetype gitcommit setlocal spell textwidth=72

" =============================================================================
" Filetypes and Custom Autocmds
" =============================================================================

" Complete till longest common string.
" When more than one match exists, list them all.
set wildmode=longest,list
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.gif,*.jpg,*.png,*.log
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*
set wildignore+=*/resources/*
set wildignore+=node_modules/*
set wildignore+=*.swp,*~,._*
set wildignore+=.DS_Store

" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

nnoremap <leader><leader> :b#<cr>
nnoremap <leader>V :e $MYVIMRC<cr>

" set haml filetype on weird extensions
autocmd BufRead,BufNewFile *.hamljs set filetype=haml

nnoremap <leader>t :call ToggleBetweenTestAndFile()<cr>

map - :NERDTreeToggle<CR>
map <leader>n :NERDTreeFind<CR>

" Translate selected strings in I18n
let g:I18nYamlPath = 'config/locales/en-GB.yml'
