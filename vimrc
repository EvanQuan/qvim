" ============================================================================
" Name:       vimrc
" Maintainer: https://github.com/EvanQuan/.vim/
" Version:    1.11.1
"
" Contains optional runtime configuration settings to initialize Vim when it
" starts. For Vim verions before 7.4, this should be linked to the ~/.vimrc
" file as described in the README.md file. Later versions automatically detect
" this as the 2nd user vimrc file.
"
" Press SPACE to toggle category folding/unfolding
" ============================================================================
" Initial Setup {{{

" The first steps necessary to set up all the configurations

" Settings determine how some configurations are set
" Look at README.md if there is no settings.vim file in current directory
"
source ~/.vim/settings.vim

" Use Vim settings, rathan than  Vi settings.
" This must be first because it changes other options as a side effect.
"
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
"
filetype off

" Load plugins with pathogen
"
execute pathogen#infect()

" Help tags are loaded from all packages
"
Helptags

" For plugins to load correctly
" Only do this part when compiled with support for autocommands
"
if has('autocmd')
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do langauge-dependent indenting.
  " Revert with ":filetype off"
  filetype plugin indent on

  " Put these in an autocmd group, so that you can revert them with:
  " ":augroup vimStartup | au! | augroup END"
  augroup vimStartup
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim)
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

  augroup END

endif

" }}} return
" Appearance {{{

" Color Scheme {{{

" When set to "dark", Vim will try to use colors that look good on a dark
" background.
"
set background=dark
let g:onedark_termcolors=256
let g:onedark_terminal_italics=1
let g:solarized_termcolors=256
let g:solarized_terminal_italics=1
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
" Determine colorscheme based on settings.vim
" Lightline colorscheme is consistent with main colorscheme
"
if g:colorscheme_type == 1 " One dark
  colorscheme onedark
elseif g:colorscheme_type == 2 " Solarized
  colorscheme solarized
endif " else no colorscheme

" }}}
" Syntax Highlighting {{{

" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors)
"
if &t_Co > 2 || has('gui_running')
  " Revert with ":syntax off"
  syntax on
endif


" For Wind32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
if has('win32')
  set guioptions-=t
endif

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
"
if g:truecolor_enabled
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
endif

" }}}

" }}}
" Folding {{{

" Enable folding
"
set foldenable

" Starting fold level for opening a new buffer. If it is set to 0, all folds
" will be closed. Setting it ti 99 would guarantee folds are always open. So,
" setting it to 10 here ensure that only very nested blocks of code are folded
" when opening a buffer.
"

set foldlevelstart=10  " open most fold by default
" Folds can be nested. Setting a max on the number of folds guards against too
" many folds.
"
set foldnestmax=10 " 10 nested fold max

" This tells Vim to fold based on indentation.Other acceptable values are:
" marker: Folds symbols {}
"   Java, C, C++
" manual: Folds are created manually
" indent: Lines with equal indent form a fold
"   Python, Haskell
" expr:   'foldexpr' gives the fold level of a line
" syntax: syntax highlighting items specify folds
" diff:   fold text that is not changed
" Run :help foldmethod for more details
"
set foldmethod=indent

" }}}
" Indentation {{{

" Default {{{

" Describes how automatic formatting is done.
"
set formatoptions=tcqrn1

" 4-space soft tabs
"
set tabstop=4 " 2
set shiftwidth=4 " 2
set softtabstop=4 " 2
set expandtab " sets tabs to spaces
set noshiftround
" Insert tabs on the start of a line according to shiftwidth, not tabstop
"
set smarttab

" Copy indent from current line when starting a new line
"
set autoindent

" Copy the previous indentation on autoindenting
"
set copyindent

" }}}
" Language-Specific {{{

if has('autocmd')
  " 2-space soft tabs
  "
  autocmd Filetype php setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
  autocmd Filetype tex setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
  autocmd Filetype vim setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
  " 2-space hard tabs
  "
  autocmd Filetype html setlocal noexpandtab tabstop=2 shiftwidth=2
  autocmd Filetype xml setlocal noexpandtab tabstop=2 shiftwidth=2
  " 8-space hard tabs
  "
  autocmd Filetype arm setlocal noexpandtab tabstop=8 shiftwidth=8
endif


" }}}
" Auto-Detect {{{

" As a priority, soft or hard tab indentation is determined by what is already
" being used in the current file.
"
function TabsOrSpaces()
  " Determines whether to use spaces or tabs on the current buffer.
  if getfsize(bufname("%")) > 256000
    " If the file is very large, just use the default, since it will take too
    " long to determine which tab type to use.
    return
  endif

  " To determine priority, get the number of tab indentations and space
  " indentations, and choose the one that is used more frequently
  let numTabs=len(filter(getbufline(bufname("%"), 1, 250), 'v:val =~ "^\\t"'))
  let numSpaces=len(filter(getbufline(bufname("%"), 1, 250), 'v:val =~ "^\\ "'))

  if numTabs > numSpaces
    setlocal noexpandtab " enable hard tabs
  endif
endfunction

" Call the function after opening a buffer
if has('autocmd')
  autocmd BufReadPost * call TabsOrSpaces()
endif

" }}}

" }}}
" Shortcuts {{{

" Hard Mode {{{

" Disable keys that you should not be using at all
" If easy mode is activated, then hard mode is disabled.

if !g:easy_mode
  " Arrow keys
  "
  " Normal
  nnoremap <Left> :echo "-- STOP USING ARROW KEYS --"<CR>
  nnoremap <Right> :echo "-- STOP USING ARROW KEYS --"<CR>
  nnoremap <Up> :echo "-- STOP USING ARROW KEYS --"<CR>
  nnoremap <Down> :echo "-- STOP USING ARROW KEYS --"<CR>
  " Insert
  inoremap <Left> <ESC> :echo "-- STOP USING ARROW KEYS --"<CR>i
  inoremap <Right> <ESC> :echo "-- STOP USING ARROW KEYS --"<CR>i
  inoremap <Up> <ESC> :echo "-- STOP USING ARROW KEYS --"<CR>i
  inoremap <Down> <ESC> :echo "-- STOP USING ARROW KEYS --"<CR>i
  " Visual
  vnoremap <Left> <ESC> :echo "-- STOP USING ARROW KEYS --"<CR>
  vnoremap <Right> <ESC> :echo "-- STOP USING ARROW KEYS --"<CR>
  vnoremap <Up> <ESC> :echo "-- STOP USING ARROW KEYS --"<CR>
  vnoremap <Down> <ESC> :echo "-- STOP USING ARROW KEYS --"<CR>

  " Page up and down
  "
  " Normal
  nnoremap <PageUp> :echo "-- STOP USING PAGEUP --"<CR>
  nnoremap <PageDown> :echo "-- STOP USING PAGEDOWN --"<CR>
  " Insert
  inoremap <PageUp> <ESC> :echo "-- STOP USING PAGEUP --"<CR>i
  inoremap <PageDown> <ESC> :echo "-- STOP USING PAGEDOWN --"<CR>i
  " Visual
  vnoremap <PageUp> <ESC> :echo "-- STOP USING PAGEUP --"<CR>
  vnoremap <PageDown> <ESC> :echo "-- STOP USING PAGEDOWN --"<CR>
endif

" }}}
" Leader Key {{{

" This key is used in combination with other keys to perform many customizable
" commands
" default leader is \
"
let mapleader = ","

" }}}
" Editing {{{

" Change {{{

" Replaces the word under cursor with whatever you want
"   Similar to ciw
" Repeat with . replaces FOLLOWING occurrences of that word
nnoremap c* /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn
" Repeat with . replaces PREVIOUS occurences of that word
nnoremap c# ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN

" Around/In Line
"
nnoremap cal S
nnoremap cil S

" Around/In Double Quotes
"
nnoremap caq ca"
nnoremap ciq ci"

" Around/In Single Quotes
"
nnoremap caQ ca'
nnoremap ciQ ci'

" Until end of Line
"
nnoremap cL c$

" From start of Line
"
nnoremap cH c^

" Next Line
"
nnoremap col jS

" Previous Line
"
nnoremap cOl kS

" }}}
" Delete {{{

" Similar with delete diw
"
nnoremap d* /\<<C-r>=expand('<cword>')<CR>\>\C<CR>``dgn
nnoremap d# ?\<<C-r>=expand('<cword>')<CR>\>\C<CR>``dg

" Around/In Line
"
nnoremap dal dd
nnoremap dil S<ESC>

" Around/In Double Quotes
"
nnoremap daq da"
nnoremap diq di"

" Around/In Single Quotes
"
nnoremap daQ da'
nnoremap diQ di'

" Until end of Line
"
nnoremap dL d$

" From start of Line
"
nnoremap dH d^

" Next Line
"
nnoremap dol jdd

" Previous Line
"
nnoremap dOl kdd

" }}}
" Ex-mode {{{

" Easier to enter command mode - don't need to hold shift
"
noremap ; :

" }}}
" Substitute {{{

" These potentially conflicts with the default 's' keybinding for substitute

" Global File
"
nnoremap sgf :%s//g<Left><Left>

" In File
"
nnoremap sif :%s/

" Global Line
"
nnoremap sgl :s//g<Left><Left>

" In Line
"
nnoremap sil :s/

" }}}
" Paste {{{

" Similar to yanking
" Downside: There is lag for normal p

" Normal - to avoid lag
"
nnoremap pp p

" Around/In Word
"
nnoremap paw "_dawP
nnoremap piw "_diwP

" Around/In Braces
"
nnoremap pi{ "_di{P
nnoremap pi} "_di}P
nnoremap piB "_di{P
nnoremap piB "_di}P

" Around/In Brackets
"
nnoremap pi[ "_di[P
nnoremap pi] "_di]P

" Around/In Double Quotes
"
nnoremap pa" "_da"P
nnoremap paq "_da"P
nnoremap pi" "_di"P
nnoremap piq "_di"P

" Around/In Single Quotes
"
nnoremap pa' "_da'P
nnoremap paQ "_da'P
nnoremap pi' "_di'P
nnoremap piQ "_di"P

" Parens
"
nnoremap pi( "_di(P
nnoremap pi) "_di)P
nnoremap pib "_di(P
nnoremap pib "_di)P

" Greater/less than
nnoremap pi< "_di<P
nnoremap pi> "_di>P

" Tag
"
nnoremap pit "_ditP

" Line
"
nnoremap pil "_ddP

" }}}
" Visual {{{

" Around Line
" Selects current line, but in Visual mode, not Visual-Line mode
"
nnoremap val ^v$

" In Line
" Selects currenet line, except for end-of-line character, in Visual mode
"
nnoremap vil ^v$h

" Around/In Double Quotes
"
nnoremap vaq va"
nnoremap viq vi"

" Around/In Single Quotes
"
nnoremap vaQ va'
nnoremap viQ vi'

" Next Line
"
nnoremap vol jV

" Previous Line
"
nnoremap vOl kV

" }}}
" Yank {{{

" Around/In Line
" Yanks whole line except for end-of-line character
" Similar to yy
"
nnoremap yal Vy
nnoremap yil $v^y

"Around/In Double Quotes
"
nnoremap yaq ya"
nnoremap yiq yi"

"Around/In Single Quotes
"
nnoremap yaQ ya'
nnoremap yiQ yi'

" Until end of Line
"
nnoremap yL y$

" From start of Line
"
nnoremap yH y^

" Next Line
"
nnoremap yol jyy

" Previous Line
"
nnoremap yOl kyy

" }}}

" }}}
" Folding {{{

" Toggle open/close folds
"
nnoremap <space> za

" Change folder settings
"
nnoremap <leader>ff :set fdm=manual<cr>
nnoremap <leader>fi :set fdm=indent<cr>
nnoremap <leader>fm :set fdm=marker<cr>
nnoremap <leader>fs :set fdm=syntax<cr>
nnoremap <leader>fd :set fdm=diff<cr>"

" }}}
" Formatting {{{

" Use ":" for Ex mode instead, use Q for formatting
"
noremap Q gq

" }}}
" Terminal {{{

if has("terminal")
  " in-editor terminal only works with some terminals
  " Vertical split
  noremap <leader>vt :vertical terminal <C-m>
  " Horizontal split
  noremap <leader>ht :terminal <C-m>
else
  " Default to shell when terminal is not available
  noremap <leader>vt :shell <C-m>
  noremap <leader>ht :shell <C-m>
endif
" There is a terminal which is available for earlier versions of Vim,
" which opens the terminal in a new buffer.
" It can be closed with "exit" or "Ctrl-D".
noremap <leader>b :shell <C-m>

" }}}
" Movement {{{

" Buffers {{{

" Move between buffers
"
" Next buffer
"
map gn :bn<cr>

" Prevous buffer
"
map gp :bp<cr>

" Close current buffer
"
noremap <leader>q :bprevious<bar>split<bar>bnext<bar>bdelete<CR>

" Delete buffer
noremap gd :bdelete<cr>

" }}}
" Windows {{{

" Split open new window
"
" Horizontal
noremap <leader>hs :split<space>
" Vertical
noremap <leader>vs :vsplit<space>

" Easy window navigation
" Move between windows with Ctrl-standard directions keys
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" }}}
" Tabs {{{

" Open new tab
"
noremap <leader>nt :tabe <C-m>

" Go to tab :by number
"
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

" }}}
" Session {{{

" cd vim into the directory of the current buffer
nnoremap <leader>cd :cd %:p:h<CR>

" }}}
" Within Window {{{

" Move up/down by visual lines instead of by 'literal' lines
" Good for when there is soft wrapping
"
nnoremap j gj
nnoremap k gk
" Go down half a page
nnoremap J <C-d>
" Go up half a page
nnoremap K <C-u>

" Allow backspacing over autoindent, line breaks, and start of insert action
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move to the beginning of the line
"
nnoremap H ^
" Move to the end of the line
"
nnoremap L $

" Alternative to ESC key
" Not applied to NORMAL mode due to "j" and "k" being used in movement
" Normally, pressing ESC moves the cursor left by 1.
" Mapping a key to <ESC> does not do this.
" Applying h (move left) moves the cursor left by 2 so hl (left then right),
" makes the behaviour the same as regular ESC
"
if g:escape_alternative_enabled
  " INSERT and REPLACE
  inoremap aa <ESC>hl
  " VISUAL
  vnoremap aa <ESC>hl
endif

" }}}

" }}}
" Indentation {{{

" Indent with tab and unindenting with shift-tab in all modes
"
nnoremap <Tab> >>_
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-D>
vnoremap > >gv
vnoremap < <gv
vnoremap <S-Tab> <gv
vnoremap <Tab> >gv

" Toggle between hard and sort tabs
" Hard tabs sizes are consistent with soft tabs sizes for each file type
"
function! ToggleTabs() abort
  set expandtab!
  if &expandtab
    echo "-- Soft tabs enabled (SPACES) --"
  else
    echo "-- Hard tabs enabled (TABS) --"
  endif
endfunction
noremap <leader>tt :call ToggleTabs()<CR>

" }}}
" Plugins {{{

" nerdtree {{{
" Repository: https://github.com/scrooloose/nerdtree

" autocmd VimEnter * NERDTree " tree is open on start
" autocmd VimEnter * wincmd p " cursor starts in main window and not NERDtree

" Atom keybinding
"
nnoremap <silent> <C-\> :NERDTreeToggle<CR>
" Alternative
"
nnoremap <silent> <leader>tn :NERDTreeToggle<CR>

" }}}
" vim-javacomplete2 {{{
" Repository: https://github.com/artur-shaik/vim-javacomplete2

" Enable smart (trying to guess import option) inserting class imports with F4
nnoremap <F4> <Plug>(JavaComplete-Imports-AddSmart)
inoremap <F4> <Plug>(JavaComplete-Imports-AddSmart)
" To enable usual (will ask for import option) inserting class imports with F5
nnoremap <F5> <Plug>(JavaComplete-Imports-Add)
inoremap <F5> <Plug>(JavaComplete-Imports-Add)
" To add all missing imports with F6
nnoremap <F6> <Plug>(JavaComplete-Imports-AddMissing)
inoremap <F6> <Plug>(JavaComplete-Imports-AddMissing)
" To remove all missing imports with F7
nnoremap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
inoremap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)

nnoremap <leader>jI <Plug>(JavaComplete-Imports-AddMissing)
nnoremap <leader>jR <Plug>(JavaComplete-Imports-RemoveUnused)
nnoremap <leader>ji <Plug>(JavaComplete-Imports-AddSmart)
nnoremap <leader>jii <Plug>(JavaComplete-Imports-Add)

inoremap <C-j>I <Plug>(JavaComplete-Imports-AddMissing)
inoremap <C-j>R <Plug>(JavaComplete-Imports-RemoveUnused)
inoremap <C-j>i <Plug>(JavaComplete-Imports-AddSmart)
inoremap <C-j>ii <Plug>(JavaComplete-Imports-Add)

nnoremap <leader>jM <Plug>(JavaComplete-Generate-AbstractMethods)

inoremap <C-j>jM <Plug>(JavaComplete-Generate-AbstractMethods)

nnoremap <leader>jA <Plug>(JavaComplete-Generate-Accessors)
nnoremap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
nnoremap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
nnoremap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)
nnoremap <leader>jts <Plug>(JavaComplete-Generate-ToString)
nnoremap <leader>jeq <Plug>(JavaComplete-Generate-EqualsAndHashCode)
nnoremap <leader>jc <Plug>(JavaComplete-Generate-Constructor)
nnoremap <leader>jcc <Plug>(JavaComplete-Generate-DefaultConstructor)

inoremap <C-j>s <Plug>(JavaComplete-Generate-AccessorSetter)
inoremap <C-j>g <Plug>(JavaComplete-Generate-AccessorGetter)
inoremap <C-j>a <Plug>(JavaComplete-Generate-AccessorSetterGetter)

vnoremap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
vnoremap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
vnoremap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)

nnoremap <silent> <buffer> <leader>jn <Plug>(JavaComplete-Generate-NewClass)
nnoremap <silent> <buffer> <leader>jN <Plug>(JavaComplete-Generate-ClassInFile)

" }}}
" vim-workspace {{{
" Repository: https://github.com/thaerkh/vim-workspace

" Toggle enable/disable workspace
nnoremap <leader>w :ToggleWorkspace<CR>

" }}}

" }}}
" Searching {{{

" Searching in file {{{

" Enable "very magic" search mode
" All characters except 0-9, a-z, A-Z, an _ have special meaning
" Allow for searching with regex
" Type ":help \v" for more information
nnoremap / /\v
vnoremap / /\v

" Going to next/previous search centers cursor
map n nzz
map N Nzz

" clear search highlighting
"
nnoremap <leader><space> :nohlsearch<CR>

" Convenient command to see the different between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
    \ | wincmd p | diffthis
endif
" Bind it for convenience
map <leader>d :DiffOrig<CR>

" }}}
" Replacing in file {{{

" Remap autocomplete movement to allow j,k movement
inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("k"))

" }}}

" }}}
" Standard {{{

" Pasting from clipboard
"
inoremap <C-v> <ESC>"+pa
vnoremap <C-v> "+pa

" Copying to clipboard
"
vnoremap <C-c> "+y

" Cutting to clipboard
"
vnoremap <C-x> "+d

" Undo
"
inoremap <C-z> <ESC>ua

" Redo
"
inoremap <C-y> <ESC><C-r>

" Save file
"
" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
nnoremap <silent> <C-S> :<C-u>Update<CR>
inoremap <C-S> <ESC> :<C-u>Update<CR>

" Select all
"
nnoremap <C-a> ggVG
vnoremap <C-a> <ESC>ggVG
inoremap <C-a> <ESC>ggVG

" }}}
" Vimrc Editing {{{

" Open vimrc anywhere
"
nnoremap <silent> <leader>ev :edit ~/.vim/vimrc<CR>

" Reload vimrc anywhere
" ISSUE: Lightline does not open correctly
"
nnoremap <silent> <leader>rv :source ~/.vim/vimrc<CR>

" Open settings.vim anywhere
"
nnoremap <silent> <leader>es :edit ~/.vim/settings.vim<CR>
" To apply changes, reload vimrc

" }}}
" Visibility {{{

" Toggle tab, space and EOL visibility
function! ToggleWhitespace() abort
  set list!
  if &list
    echo "-- Whitespace VISIBLE --"
  else
    echo "-- Whitespace INVISIBLE --"
  endif
endfunction
noremap <leader>tw :call ToggleWhitespace()<CR>

" Refresh syntax highlighting in case it gets messed up
"
"
nnoremap <leader>rh <ESC>:execute 'colo' colors_name<cr>:syntax sync fromstart<cr>

" Toggle absolute and relative line numbers
"
function! ToggleLineNumber() abort
  if &relativenumber
    set number norelativenumber
    echo "-- ABSOLUTE LINE NUMBERS --"
  else
    set relativenumber
    echo "-- RELATIVE LINE NUMBERS --"
  endif
endfunction
noremap <leader>tl :call ToggleLineNumber()<CR>
" }}}

" }}}
" Performance {{{

" When this option is set, the screen will not be redrawn while executing
" macros, registers and other command that have not been typed. Also, updating
" the window title is postponed.
"
" Improves scrolling lag, especially with some forms of syntax highlighting
"
set lazyredraw

" Indicates a fast terminal connection. More characters will be sent to the
" screen for redrawing, instead of using inster/delte line commands. Imroves
" smoothness of redrawing when there are multiple windows and the terminal
" does not support a scrolling region.
" Also enables the extra writing of characters at the end of each screen line
" for lines that wrap. This helps when using copy/paste with the mouse in an
" xterm and other terminals.
"
" Improves rendering when scrolling
"
set ttyfast

" }}}
" Plugin Settings {{{

" arm-syntax-vim {{{
" Repository: https://github.com/ARM9/arm-syntax-vim

" Recognize the correct file extentions as ARM files
"
au BufNewFile,BufRead *.s,*.S,*.asm set filetype=arm " arm = armv6/7
" }}}
" ctrlp.vim {{{
" Repository: https://github.com/kien/ctrlp.vim

let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0

" Ignore unwanted files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
" }}}
" haskell-vim {{{
" Repository: https://github.com/neovimhaskell/haskell-vim

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

let g:haskell_indent_if = 4 " 3
let g:haskell_indent_case = 4 " 2
let g:haskell_indent_let = 4 " 4
let g:haskell_indent_where = 2 " 6
let g:haskell_indent_before_where = 2 " 2
let g:haskell_indent_after_bare_where = 2 " 2
let g:haskell_indent_do = 4 " 3
let g:haskell_indent_guard = 4 " 2
"}}}
" lightline.vim {{{
" Repository: https://github.com/itchyny/lightline.vim

" Layout {{{

                    " \ 'enable': { 'tabline': 0 },
" This determines what information lightline shows and in what format
" I did not make this or the corresponding functions it uses
"
let g:lightline = {
  \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'fugitive', 'readonly', 'modified' ],
    \             [ 'filename'],
    \           ],
    \   'right':[ [ 'syntastic', 'lineinfo' ],
    \             ['percent'],
    \             [ 'fileformat', 'fileencoding', 'filetype' ],
    \           ]
    \ },
  \ 'component_function': {
    \   'fugitive': 'MyFugitive',
    \   'filename': 'FilenameRelativePath',
    \   'fileformat': 'MyFileformat',
    \   'filetype': 'MyFiletype',
    \   'fileencoding': 'MyFileencoding',
    \   'mode': 'MyMode',
    \   'ctrlpmark': 'CtrlPMark',
    \   'gitbranch': 'gitbranch#name',
    \ 'bufferbefore': 'lightline#buffer#bufferbefore',
    \ 'bufferafter': 'lightline#buffer#bufferafter',
    \ 'bufferinfo': 'lightline#buffer#bufferinfo',
    \ },
  \ 'tab_component_function': {
    \   'filename': 'MyTabFilename',
  \ },
  \ 'component_expand': {
    \   'syntastic': 'SyntasticStatuslineFlag',
    \   'buffercurrent': 'lightline#buffer#buffercurrent2',
  \ },
  \ 'component_type': {
    \   'syntastic': 'error',
    \   'buffercurrent': 'tabsel',
  \ },
  \ 'tabline': {
      \ 'left': [ [ 'bufferinfo' ], [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
      \ 'right': [ [ 'close' ], ],
      \ },
\ }

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

" Special symbols are applied to lightline
" Purely cosmetic
if g:special_symbols_enabled
  let g:lightline.separator = {'left': "\ue0b0", 'right': "\ue0b2"}
  let g:lightline.subseparator = { 'left': "\ue0b1", 'right': "\ue0b3"}
  let g:lightline_buffer_expand_left_icon = '◀ '
  let g:lightline_buffer_expand_right_icon = ' ▶'
  let g:lightline_buffer_logo = ' '
  let g:lightline_buffer_readonly_icon = ''
  let g:lightline_buffer_modified_icon = '✭'
  let g:lightline_buffer_git_icon = ' '
endif

" Keep lightline color scheme consistent with background color scheme
if g:colorscheme_type == 1 " One dark
  let g:lightline.colorscheme = 'onedark'
elseif g:colorscheme_type == 2 " Solarized
  let g:lightline.colorscheme = 'solarized'
endif " else no colorscheme

" }}}
" Functions {{{

" File name displays its path relative to wherever vim was opened
"
function! FilenameRelativePath() abort
  return expand('%')
endfunction

function! MyModified() abort
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable
          \ ? '' : '-'
endfunction

function! MyReadonly() abort
  return &ft !~? 'help\|vimfiler\|gundo' && &ro ? '<U+2B64>' : ''
endfunction

function! MyTabFilename(n) abort
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let bufnum = buflist[winnr - 1]
  let bufname = expand('#'.bufnum.':t')
  let buffullname = expand('#'.bufnum.':p')
  let buffullnames = []
  let bufnames = []
  for i in range(1, tabpagenr('$'))
    if i != a:n
      let num = tabpagebuflist(i)[tabpagewinnr(i) - 1]
      call add(buffullnames, expand('#' . num . ':p'))
      call add(bufnames, expand('#' . num . ':t'))
    endif
  endfor
  let i = index(bufnames, bufname)
  if strlen(bufname) && i >= 0 && buffullnames[i] != buffullname
    return substitute(buffullname, '.*/\([^/]\+/\)', '\1', '')
  else
    return strlen(bufname) ? bufname : '[No Name]'
  endif
endfunction
function! MyFilename() abort
  let n = tabpagenr()
  let buflist = tabpagebuflist(n)
  let winnr = tabpagewinnr(n)
  let bufnum = buflist[winnr - 1]
  let bufname = expand('#'.bufnum.':t')
  let buffullname = expand('#'.bufnum.':p')
  let buffullnames = []
  let bufnames = []
  for i in range(1, tabpagenr('$'))
    if i != n
      let num = tabpagebuflist(i)[tabpagewinnr(i) - 1]
      call add(buffullnames, expand('#' . num . ':p'))
      call add(bufnames, expand('#' . num . ':t'))
    endif
  endfor
  let i = index(bufnames, bufname)
  if strlen(bufname) && i >= 0 && buffullnames[i] != buffullname
    return substitute(buffullname, '.*/\([^/]\+/\)', '\1', '')
  else
    return strlen(bufname) ? bufname : '[No Name]'
  endif
endfunction

" Special symbols enhance lightline appearance
"
if g:special_symbols_enabled
  function! MyFugitive() abort
    try
      if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
        let mark = ' '
        " let mark = '⭠ ' " this was the default
        let _ = fugitive#head()
        return strlen(_) ? mark._ : ''
      endif
    catch
    endtry
    return ''
  endfunction
else
  function! MyFugitive() abort
    try
      if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
        let mark = ''
        let _ = fugitive#head()
        return strlen(_) ? mark._ : ''
      endif
    catch
    endtry
    return ''
  endfunction
endif

" File format only shows if window width is over 70 columns to avoid clutter
"
function! MyFileformat() abort
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

" File type only shows if window width is over 70 columns to avoid clutter
"
function! MyFiletype() abort
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

" File encoding only shows if window width is over 70 columns to avoid clutter
"
function! MyFileencoding() abort
    return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode() abort
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
    \ fname == 'ControlP' ? 'CtrlP' :
    \ fname == '__Gundo__' ? 'Gundo' :
    \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
    \ fname =~ 'NERD_tree' ? 'NERDTree' :
    \ &ft == 'unite' ? 'Unite' :
    \ &ft == 'vimfiler' ? 'VimFiler' :
    \ &ft == 'vimshell' ? 'VimShell' :
    \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark() abort
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
    \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked) abort
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str) abort
    return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
  let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

augroup AutoSyntastic
  if has('autocmd')
    autocmd!
    autocmd BufWritePost * call s:syntastic()
  endif
augroup END
function! s:syntastic() abort
  SyntasticCheck
  call lightline#update()
endfunction

" }}}

" }}}
" lightline-buffer {{{
" Repository: https://github.com/taohexx/lightline-buffer

" replace these symbols with ascii characters if your environment does not support unicode
"
let g:lightline_buffer_ellipsis_icon = '..'

let g:lightline_buffer_active_buffer_left_icon = ''
let g:lightline_buffer_active_buffer_right_icon = ''
let g:lightline_buffer_separator_icon = '  '

" lightline-buffer function settings
let g:lightline_buffer_show_bufnr = 1
let g:lightline_buffer_rotate = 0
let g:lightline_buffer_fname_mod = ':t'
let g:lightline_buffer_excludes = ['vimfiler']

let g:lightline_buffer_maxflen = 30
let g:lightline_buffer_maxfextlen = 3
let g:lightline_buffer_minflen = 16
let g:lightline_buffer_minfextlen = 3
let g:lightline_buffer_reservelen = 20

" }}}
" nerdcommeter {{{
" Repository: https://github.com/scrooloose/nerdcommenter

" Add spaces after comment delimters
"
let g:NERDSpaceDelims = 1

" Align line-wise comment delimiters flush left instead of following code
" indentation
"
let g:NERDDefaultAlign = 'left'

" }}}
" syntastic {{{
" Repository: https://github.com/vim-syntastic/syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" }}}
" vim-closetag {{{
" Repository: https://github.com/alvan/vim-closetag

" filenames like *.xml, *.html, *.xhtml, ...
" Then after you press <kbd>&gt;</kbd> in these files, this plugin will try to close the current tag.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non closing tags self closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" integer value [0|1]
" This will make the list of non closing tags case sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'
" }}}
" vim-gitgutter {{{
" Repository: https://github.com/airblade/vim-gitgutter

" Delay time of the diff markers updating as the file is edited
"
set updatetime=100 " [ms] Default: 4000

" }}}
" vim-javacomplete2 {{{
" Repository: https://github.com/artur-shaik/vim-javacomplete2

if has('autocmd')
  autocmd FileType java setlocal omnifunc=javacomplete#Complete
endif

" }}}
" vim-togglecursor {{{
" Repository: https://github.com/jszakmeister/vim-togglecursor

" Cursor changes shapes with each mode. Cursor blinking is also disabled.
"
if g:cursor_blinking_disabled
  " The default cursor shape. It is used in all modes except insert mode.
  "
  let g:togglecursor_default = 'block' " Not blinking
  " The insert mode cursor shape.
  "
  let g:togglecursor_insert = 'line' " Not blinking
  " The replace mode cursor shape
  "
  let g:togglecursor_replace = 'underline' " Not blinking
  " The cursor shape when exiting vim.
  "
  let g:togglecursor_leave = 'block' " Not blinking
endif

" }}}
" vim-workspace {{{
" Repository: https://github.com/thaerkh/vim-workspace

" Set if workspace automatically writes to file with every edit
"
let g:workspace_autosave_always = 0

" }}}

" }}}
" UI Layout {{{

" Alerts {{{

" Disable audio and visualbell alerts entirely when scrolling beyond file lines
" or pressing escape in normal mode
"
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" }}}
" Cursor {{{

" GUI {{{

" Disable all blinking
set guicursor+=a:blinkon0

" }}}
" Scrolling {{{

" Determines the number of context lines you want to see above and below the
" cursor. Helpful for scrolling.
"
set scrolloff=5

" }}}
" Color {{{

if g:cursor_color
  if g:cursor_color == 1 " Blue
    silent !echo -ne "\033]12;rgb:61/af/ef\x7\007"
  elseif g:cursor_color == 2 " Green
    silent !echo -ne "\033]12;rgb:98/c3/79\x7\007"
  elseif g:cursor_color == 3 " Red
    silent !echo -ne "\033]12;rgb:e0/6c/75\x7\007"
  endif
  " Reset cursor to original when vim exits
  if has('autocmd')
    autocmd VimLeave * silent !echo -ne "\033]112\007"
  endif
endif
" TODO: Cursor changes color depending on the mode
" These get overriden by vim-togglecursor settings
" Can be done by changing vim-togglecursor plugin
" Find a work around that does not alter vim-togglecursor plugin
" INSERT mode - blue
" let &t_SI =+ "\<Esc>]12;rgb:61/af/ef\x7"
" REPLACE mode - red
" let &t_SR =+ "\<Esc>]12;rgb:e0/6c/75\x7"
" NORMAL and VISUAL modes - green
" let &t_EI =+ "\<Esc>]12;rgb:98/c3/79\x7"

" }}}

" }}}
" Encoding {{{

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
scriptencoding utf-8

" }}}
" GUI {{{

" No scroll bars
set guioptions = " No scroll bars

" }}}
" Line Numbers {{{

if g:line_numbers
  set number
  if g:line_numbers == 2
    set relativenumber
    if has('autocmd')
      " Absolute number on INSERT and REPLACE modes
      "
      autocmd InsertEnter * :set number norelativenumber
      " Hybrid relative number on NORMAL and VISUAL modes
      "
      autocmd InsertLeave * :set relativenumber
    endif
  endif
endif

" }}}
" Status Line {{{

" Ruler is displayed on the right side of the status line at the bottom of the
" window. It displays the line number, the column number, and the relative
" position of the cursor in the file (as a percent)
"
" This is redundant as lightline shows all this information anyways, but is
" enabled incase lightline is not working.
"
set ruler

" Status line displays the current mode, file name, file status, ruler etc.
" Current unnecessary with lightline
"
set laststatus=2

" Show command
" Displays in bottom-right what keys have already been pressed for the current
" command
"
set showcmd

" The value of this option specifies when the line with tab pages labels will
" be displayed at the top of the screen:
"   0: never
"   1: only if there are at least two tab pages
"   2: always
"
set showtabline=2

" do not show default INSERT mode below since this is what lightline does
set noshowmode

" }}}
" Text Wrapping {{{

if g:wrap_enabled
  set wrap
  " wrap_width is visualized as highlighted column
  execute "set colorcolumn=".g:wrap_width
  if g:wrap_enabled == 1 " soft wrap
    set linebreak " line breaks only occur when the user explictly makes them
    set textwidth=0 " disable text width limit
  elseif g:wrap_enabled == 2 " hard wrap
    set nolist " Disable linebreak if it is enabled
    execute "set textwidth=".g:wrap_width
  endif
else
  set nowrap
  set textwidth=0
endif

" }}}
" Title {{{

" When in Vim, change the terminal's title to titlestring
set title
" Set title to this when exiting Vim only if it cannot be retrieved
set titleold="Terminal"
" path to file
set titlestring=%F

" }}}
" Whitespace {{{

" Visualize whitespace characters
"
set listchars=tab:»\ ,eol:¬,trail:~,extends:>,precedes:<,space:·,nbsp:‡

" Highlight trailing spaces for increased visibility
"
match ErrorMsg '\s\+$'

" Only show whitespace if enabled
if g:show_whitespace
  set list
endif

" }}}

" }}}
" Utility {{{

" Autocomplete {{{

" Visual autocomplete for command menu
" Use tab to autocomplete
"
set wildmenu

" }}}
" Buffer {{{

" Allow buffer switching without saving
set hidden

" }}}
" File {{{

" When a file has been detected to have been changed outside of Vim and it
" has not been changed inside of Vim, automatically aread it again.
"
set autoread

" }}}
" Easy Mode {{{

if g:easy_mode

  " Default mode is insert mode
  set insertmode
endif

" }}}
" History {{{

" Keep 1000 lines of command line history
"
set history=1000

" The maximum number of changes that can be undone.
"
set undolevels=1000


" }}}
" Mouse {{{

" In many terminal emulators the mouse works just fine. By enabling it you can
" position the cursor, Visually select and scroll with the mouse.
if has('mouse')
  " a: Enable mouse in ALL modes
  set mouse=a
endif

" }}}
" Searching {{{

" highlight matches
"
set hlsearch

" Search as characters are entered
"
set incsearch

" Ignore case when searching by default...
"
set ignorecase

" ...unless case is specified, in which case is not ignored
"
set smartcase

" Matching bracket-like characters highlighted
"
set showmatch

" }}}

" }}}
" Vimrc Organization {{{

" Folds everything by default in vimrc only.
" Folds are determined by {{{}}} markers

" Set modelines to parse to 1
" This is normally dangerous to do for security reasons, but is necessary for
" organizational folding for this file
" Google "vim modeline vulnerability"
"
set modelines=1

" }}}
" vim:foldmethod=marker:foldlevel=0
