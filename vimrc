" Clear autocmds
autocmd!

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
" Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
" Plugin 'bronson/vim-ruby-block-conv'
" Plugin 'derekwyatt/vim-scala'
" Plugin 'digitaltoad/vim-jade'
Plugin 'dockyard/vim-easydir'
" Plugin 'ekalinin/Dockerfile.vim'
Plugin 'gmarik/Vundle.vim'
" Plugin 'gosukiwi/vim-atom-dark'
" Plugin 'henrik/vim-yaml-flattener'
Plugin 'jiangmiao/auto-pairs'
Plugin 'joshdick/onedark.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'mattn/emmet-vim'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
" Plugin 'simon2k/vim-i18n'
Plugin 'simon2k/vim-jump-to-test'
" Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-commentary'
" Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/Align'
Plugin 'vim-scripts/SQLUtilities'
Plugin 'vim-scripts/ctags.vim'
" Plugin 'w0ng/vim-hybrid'
Plugin 'mxw/vim-jsx'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'junegunn/gv.vim'
Plugin 'NLKNguyen/papercolor-theme'
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
colorscheme onedark

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

" Toggle between a test file and its implementation
nnoremap <leader>t :call ToggleBetweenTestAndFile()<cr>

" Translate selected strings in I18n
" let g:I18nYamlPath = 'config/locales/en-GB.yml'

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

" Use zsh as a default shell
set shell=zsh\ -i

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

" Ignore certain files in nerd tree view
let NERDTreeIgnore=['\.class']

" Limit commit message width and check spelling
autocmd Filetype gitcommit setlocal spell textwidth=72

set nospell

" Create a commit
map <leader>gco :Gco<cr>

" Show git status
map <leader>gst :Gst<cr>

" Amend changes in file
map <leader>gr :Gread<cr>

" Show blame for file
map <leader>gb :Gblame<cr>

" Show diff for file
map <leader>gd :Gd<cr>

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

" Show me recently opened files
nmap <leader>b :CtrlPBuffer<cr>

" Index tags within a project
map <Leader>rt :!ctags --extra=+f --exclude=.git --exclude=coverage --exclude=.svn --exclude=log  --exclude=app/assets --exclude=vendor -R<cr><cr>

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

" Exec specs in osx iterm
let g:rspec_runner = 'os_x_iterm'

" Debugging abbreviations - expandable
:ab bpy binding.pry
:ab clg console.log
