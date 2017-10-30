" Don't try to be vi compatible
set nocompatible

" if has('win32') || has('win64')
"  set runtimepath=path/to/home.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,path/to/home.vim/after
" endif


" Helps force plugins to load correctly when it is turned back on below
filetype off

" TODO: Load plugins here (pathogen or vundle)
" Pathogen https://github.com/tpope/vim-pathogen
" execute pathogen#infect()

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
" default leader is \
let mapleader = ","

" Security
set modelines=0

" Show line numbers
" set number
set number relativenumber " hybrid relative number shows current line number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
" set wrap
" set textwidth=79
set formatoptions=tcqrn1
set tabstop=4 " 2
set shiftwidth=4 " 2
set softtabstop=4 " 2
set expandtab " sets tabs to spaces
set noshiftround

autocmd Filetype php setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype css setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype html setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype vim setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

" Autocomplete
" inoremap ( ()<Esc>i " parentheses
" inoremap <C-j> <Esc>/[)}"'\]>]<CR>:nohl<CR>a " brackets/braces

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd


" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>
" Remap autocomplete movement to allow j,k movement
inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("k"))

" Nerdcommeter settings
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
" nmap <C-c> <Plug>NERDCommenterInvert
" imap <C-c> <Plug>NERDCommenterInvert
" vmap <C-c> <Plug>NERDCommenterInvert

" Indenting and unindenting with tab with all modes
nnoremap <Tab> >>_
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-D>
vnoremap > >gv
vnoremap < <gv
vnoremap <S-Tab> <gv
vnoremap <Tab> >gv

" NERDTree
" autocmd VimEnter * NERDTree " tree is open on start
" autocmd VimEnter * wincmd p " cursor starts in main window and not NERDtree
nmap <silent> <C-\> :NERDTreeToggle<CR>
" nnoremap <silent> <C-\> :noh<CR><C-L>

" Git - vim-gitgutter
" https://github.com/airblade/vim-gitgutter
set updatetime=250 " default 4000???


"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.

"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
"Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
" function! Tab_Or_Complete()
"   if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
"     return "\<C-N>"
"   else
"     return "\<Tab>"
"   endif
" endfunction
" :inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
" :set dictionary="/usr/dict/words"


" Tabs
" Shift windows by Ctrl-directions keys
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
" Putting arrow keys to use for tab movement
noremap <Down> gt
noremap <Up> gT
noremap <Right> gt
noremap <Left> gT
" Go to tab :by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
" Open new tab
noremap <leader>t :tabe <C-m>
noremap <leader>xt :x <C-m>
noremap <leader>qt :q! <C-m>
noremap <leader>w :w <C-m>
noremap <leader>xw :NERDTreeToggle<CR> :x <C-m>
noremap <leader>qw :NERDTreeToggle<CR> :q! <C-m>
" Split open new window
noremap <leader>s :split 
noremap <leader>vs :vsplit 
" Enable mouse scroll
set mouse=a
" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬,trail:~,extends:>,precedes:<,space:·
" set lcs+=space· " only works with Gvim ?
" autocmd ColorScheme * highlight WhiteSpaces gui=undercurl guifg=LightGray | match WhiteSpaces / \+/ " doesn't work ?

" Uncomment this to enable by default:
set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL


"_____One Dark Color Scheme______
"https://github.com/joshdick/onedark.vim
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
   "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
   let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Color scheme (terminal)
" set t_Co=256 " 256
" set background=dark
let g:onedark_termcolors=256
let g:onedark_terminal_italics=1
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:

" Light line
" https://github.com/itchyny/lightline.vim 
"lightline
let g:lightline = {
  \'colorscheme': 'onedark',
  \'separator': {'left': "\u25B6", 'right': ''},
  \ 'subseparator': { 'left': '', 'right': ''}
  \}
"airline
" let g:airline_theme='onedark'
colorscheme onedark


