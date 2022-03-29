set nocompatible              " be iMproved, required
filetype off                  " required
set number

call plug#begin()

" color schemes
Plug 'arcticicestudio/nord-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'w0ng/vim-hybrid'
Plug 'ayu-theme/ayu-vim'

" plugin on GitHub repo
Plug 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plug 'L9'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" plugin for perl syntax, template toolkit
Plug 'vim-perl/vim-perl'
" plugin for javascript syntax
Plug 'pangloss/vim-javascript'
" plugin for json syntax
Plug 'elzr/vim-json'
" plugin to easy find file
Plug 'kien/ctrlp.vim'
" tree explorer
Plug 'scrooloose/nerdtree'
" Status line
Plug 'vim-airline/vim-airline'
" HTML Syntax
Plug 'othree/html5.vim'
" Mojo html.ep
Plug 'yko/mojo.vim'
" Markdown highlighter
Plug 'plasticboy/vim-markdown'
" Code tags
Plug 'majutsushi/tagbar'
" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" easymotion
Plug 'easymotion/vim-easymotion'

" All of your Plugins must be added before the following line
call plug#end()

map <Leader>t :CtrlPBuffer<CR>
 let g:ctrlp_map = '<C-p>'
 let g:ctrlp_working_path_mode = 0 " don’t manage working directory.
 let g:ctrlp_use_caching = 1
 let g:ctrlp_custom_ignore = {
 \ 'dir':  '\v\c\.(git|svn)$|cgi/t/sandbox|cover_db',
 \ 'file': '\v\c\.(swf|bak|png|gif|js|mov|ico|jpg|pdf|jrxml)$'
  \ }

filetype plugin indent on    " required

set autoindent
set backspace=indent,eol,start
set cindent " set smartindent
set cmdheight=2
set cursorcolumn
set cursorline
set errorformat=\"../../%f\"\\,%*[^0-9]%l:\ %m
set expandtab
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:>-,trail:-
set mouse=c
set nowrap
set ruler
set scrolloff=5
set shiftwidth=4
set showcmd
set showmatch
set smarttab
"set statusline=%F%m%r%h%w\ [%{&ff}]\ %y\ [CHR=%b/0x%B]\ [POS=%04l,%03c(%03v)]\ [%p%%]\ [LEN=%L]\ %{fugitive#statusline()}
set t_Co=256
set tags=tags;/
set virtualedit=block
set wrap
"set nu
"set spell spelllang=en_us
set colorcolumn=80
syntax on

colorscheme jellybeans
set background=dark

highlight   CursorColumn  term=NONE    cterm=none ctermbg=232
highlight   CursorLine    term=NONE    cterm=bold ctermbg=8
highlight   FoldColumn                            ctermbg=8  ctermfg=14
highlight   Folded                                ctermbg=8  ctermfg=14
highlight   Search        term=reverse cterm=bold ctermbg=11 ctermfg=0
highlight   Visual        term=NONE    cterm=bold ctermbg=10 ctermfg=8
highlight   ColorColumn                           ctermbg=8

"" makes Omni Completion less pinky :P
highlight   Pmenu                                 ctermbg=2  ctermfg=0
highlight   PmenuSel                              ctermbg=7  ctermfg=0
highlight   PmenuSbar                             ctermbg=0  ctermfg=7
highlight   PmenuThumb                            ctermbg=7  ctermfg=0

" :help last-position-jump
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

nnoremap <C-L> :noh<CR><C-L>
inoremap jj <Esc>
nnoremap <Leader>r :source ~/.vimrc<CR>
nnoremap <Leader><Leader>r :e ~/.vimrc<CR>

map <Leader>gs :Gstatus<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gm :Gcommit --amend<CR>
map <Leader>gll :Git log<CR>
map <Leader>glp :Git log -p<CR>
map <Leader>gb :Gblame<CR>
map <Leader>gdd :Git diff<CR>
map <Leader>gdm :Git diff %<CR>
map <Leader>gdf :Gdiff<CR>
map <Leader>gg :Git

map <Leader>] :wa<bar><UP><CR>

nmap <F1> <Esc>
imap <F1> <Esc>

autocmd FileType gitcommit autocmd! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" navigate display line when wrap is set
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

map <F5> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
