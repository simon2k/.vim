" Clear autocmds
autocmd!

" set shell=zsh\ -i

" Use Vim settings, rather than Vi settings
" This must be first because it changes other options as a side effect
set nocompatible

" Don't show mode
set noshowmode

" Show line numbers
set number

" Automatically reload vimrc when it's saved
au BufWritePost .vimrc so $MYVIMRC
autocmd BufWritePre * :%s/\s\+$//e

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'joshdick/onedark.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()

autocmd FileType ruby compiler ruby

command! -nargs=1 Silent
\ | execute ':silent !'.<q-args>
\ | execute ':redraw!'

" Enable file type detection and load plugin indent files
filetype plugin on
filetype plugin indent on

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Use only 1 space after "." when joining lines instead of 2
set nojoinspaces

" Don't reset cursor to start of line when moving around
set nostartofline

" Autocomplete ids and classes in CSS
autocmd FileType css,scss set iskeyword=@,48-57,_,-,?,!,192-255

" Set the '-' as a keyword in erb files
autocmd FileType eruby set iskeyword=@,48-57,_,192-255,$,-

set t_Co=256
colorscheme railscasts

syntax sync fromstart

set ls=2 " show a status line even if there's only one window

" Improve vim's scrolling speed
set ttyfast
set ttyscroll=3
set lazyredraw

set wildmenu    " show completion on the modeline
set linespace=0 " number of pixels between the lines
set splitright  " open vertical splits on the right
set splitbelow  " open the horizontal split below
set nowrap      " do not wrap long lines
set linebreak   " break lines at word end
set nobackup    " don't want no backup files
set nowritebackup " don't make a backup before overwriting a file
set noswapfile " no swap files
set hidden     " hide buffers when abandoned

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

" Settings for undos
set undofile            " Save undo's after file closes
set undodir=~/.vim/undo " where to save undo histories
set undolevels=1000     " How many undos
set undoreload=10000    " number of lines to save for undo
set history=100 " a ton of history

" Whitespace
set tabstop=2 shiftwidth=2     " a tab is two spaces
set expandtab                  " use spaces, not tabs
set backspace=indent,eol,start " backspace through everything in insert mode

" Searching
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter
set scrolloff=0 " keep a 5 line padding when moving the cursor
set hlsearch    " highlight the search

set autoindent  " indent on enter
set smartindent " do smart indenting when starting a new line
set shiftround  " indent to the closest shiftwidth

set switchbuf="" " do not move focus/cursor to where the buffer is already open
set tagbsearch   " use binary searching for tags

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Remove unnecessary stuff from the window
set guioptions-=m " Remove menu bar
set guioptions-=T " Remove toolbar
set guioptions-=r " Remove right-hand scroll bar
set guioptions-=L " Remove left-hand scroll bar
set guioptions-=M " Remove menubar

" Awesome font!
set guifont=Menlo:h15

command! -nargs=1 Silent
\ | execute ':silent !'.<q-args>
\ | execute ':redraw!'

" File Types
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

" Open nerd tree view, a list of files
map - :NERDTreeToggle<CR>

" Localize the currently file in the nerd tree list
map <leader>n :NERDTreeFind<CR>

" Limit commit message width and check spelling
autocmd Filetype gitcommit setlocal spell textwidth=72

set nospell

" CtrlP Settings
hi def link CtrlPMatch CursorLine
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git\|node_modules\|bin\|\.hg\|\.svn\|build\|log\|resources\|coverage\|doc\|tmp\|public\|vendor\|Android',
  \ 'file': '\.jpg$\|\.exe$\|\.so$\|tags$\|\.dll$'
  \ }

" Clear cache for CtrlP - index a new list of files
map <leader>c :CtrlPClearCache<cr>

" Search for word under cursor
nnoremap K :Ag <cword><cr>

" Open next buffer
nnoremap <tab> :bn<cr>

" Open previous buffer
nnoremap <s-tab> :bp<cr>

" Install VIM Plugins
nmap <leader>bi :BundleInstall<cr>

" Toggle search highlighting
nmap <silent> <leader>h :set invhls<CR>:set hls?<CR>

set wrap

let NERDTreeIgnore = ['\.pyc$', '^cookbooks$']

" airline
let g:airline_powerline_fonts = 1
" let g:airline_theme = 'powerlineish'
let g:airline_theme = 'onedark'
set laststatus=2
