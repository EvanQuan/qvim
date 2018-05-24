" ============================================================================
" Name: vimrc
" Maintainer: https://github.com/EvanQuan/.vim/
" Version: 1.4.7
"
" Contains optional runtime configuration settings to initialize Vim when it
" starts. For Vim verions before 7.4, this should be linked to the ~/.vimrc
" file as described in the README.md file. Later versions automatically detect
" this as the 2nd user vimrc file.
"
" Press SPACE to toggle category folding/unfolding
" ============================================================================
" Initial Setup {{{

"   The first steps necessary to set up all the configurations

" Settings determine how some configurations are set
" Look at README.md if there is no settings.vim file in current directory
source ~/.vim/settings.vim

" Use Vim settings, rathan than  Vi settings. 
" This must be efirst because it changes other options as a side effect.
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
"
filetype off

" Load plugins with pathogen
"
execute pathogen#infect()
" Help tags are loaded from all packages
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

endif " has('autocmd')

" }}} return
" Appearance {{{

" Color scheme {{{

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
" Syntax highlighting {{{

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
set foldenable
" Starting fold level for opening a new buffer. If it is set to 0, all folds
" will be closed. Setting it ti 99 would guarantee folds are always open. So,
" setting it to 10 here ensure that only very nested blocks of code are folded
" when opening a buffer.
set foldlevelstart=10  " open most fold by default
" Folds can be nested. Setting a max on the number of folds guards against too
" many folds.
set foldnestmax=10 " 10 nested fold max
" space open/closes folds
nnoremap <space> za
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
set foldmethod=indent

" }}}
" Line Numbers {{{

" Show hybrid relative numbers by default
"
set number relativenumber
"
" Absolute number on INSERT and REPLACE modes
"
autocmd InsertEnter * :set number norelativenumber
" Hybrid relative number on NORMAL and VISUAL modes
"
autocmd InsertLeave * :set relativenumber 

" }}}
" Indentation {{{

" Default {{{
"
" 4-space soft tabs
"
set formatoptions=tcqrn1
set tabstop=4 " 2
set shiftwidth=4 " 2
set softtabstop=4 " 2
set expandtab " sets tabs to spaces
set noshiftround
" }}}
" Lantuage-Specific {{{
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
autocmd Filetype arm setlocal noexpandtab tabstop=8 shiftwidth=8
" }}}

" }}}
" Movement {{{

" Between Windows {{{

" Move between windows with Ctrl-standard directions keys
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

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

" Move between buffers
"
" Next buffer
"
map gn :bn<cr>

" Prevous buffer
"
map gp :bp<cr>

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

" }}}

" }}}
" Optimization {{{

" Improves scrolling lag, especially with some forms of syntax highlighting
"
set lazyredraw

" Improves rendering when scrolling
"
set ttyfast

" }}}
" Shortcuts {{{

" Hard Mode {{{

" Arrow keys
" Normal
nnoremap <Left> :echo "Stop using arrow keys, you PLEB!"<CR>
nnoremap <Right> :echo "Stop using arrow keys, you PLEB!"<CR>
nnoremap <Up> :echo "Stop using arrow keys, you PLEB!"<CR>
nnoremap <Down> :echo "Stop using arrow keys, you PLEB!"<CR>
" Insert
inoremap <Left> <ESC> :echo "Stop using arrow keys, you PLEB!"<CR>i
inoremap <Right> <ESC> :echo "Stop using arrow keys, you PLEB!"<CR>i
inoremap <Up> <ESC> :echo "Stop using arrow keys, you PLEB!"<CR>i
inoremap <Down> <ESC> :echo "Stop using arrow keys, you PLEB!"<CR>i
" Visual
vnoremap <Left> <ESC> :echo "Stop using arrow keys, you PLEB!"<CR>
vnoremap <Right> <ESC> :echo "Stop using arrow keys, you PLEB!"<CR>
vnoremap <Up> <ESC> :echo "Stop using arrow keys, you PLEB!"<CR>
vnoremap <Down> <ESC> :echo "Stop using arrow keys, you PLEB!"<CR>

" Page up and down
" Normal
nnoremap <PageUp> :echo "Stop using PAGEUP, you PLEB!"<CR>
nnoremap <PageDown> :echo "Stop using PAGEDOWN, you PLEB!"<CR>
" Insert
inoremap <PageUp> <ESC> :echo "Stop using PAGEUP, you PLEB!"<CR>i
inoremap <PageDown> <ESC> :echo "Stop using PAGEDOWN, you PLEB!"<CR>i
" Visual
vnoremap <PageUp> <ESC> :echo "Stop using PAGEUP, you PLEB!"<CR>
vnoremap <PageDown> <ESC> :echo "Stop using PAGEDOWN, you PLEB!"<CR>

" }}}
" Leader Key {{{

" This key is used in combination with other keys to perform many customizable
" commands
" default leader is \
"
let mapleader = ","

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

" }}}
" Searching {{{

" Searching in file {{{

" Enable "very magic" search mode
" All characters except 0-9, a-z, A-Z, an _ have special meaning
" Allow for searching with regex
" Type ":help \v" for more information
nnoremap / /\v
vnoremap / /\v

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

nnoremap <leader>s :%s/

" Remap autocomplete movement to allow j,k movement
inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("k"))

" }}}

" }}}
" Vimrc Editing {{{

" Open vimrc anywhere
"
nmap <silent> <leader>ev :e ~/.vim/vimrc<CR>

" Reload vimrc anywhere
"
nmap <silent> <leader>rv :so ~/.vim/vimrc<CR>

" Open settings.vim anywhere
"
nmap <silent> <leader>es :e ~/.vim/settings.vim<CR>
" To apply changes, reload vimrc

" }}}
" Misc {{{

" Alternative to ESC key
" Not applied to NORMAL mode due to "j" and "k" being used in movement
" Normally, pressing ESC moves the cursor left by 1.
" Mapping a key to <ESC> does not do this.
" Applying h (move left) moves the cursor left by 2 so hl (left then right),
" makes the behaviour the same as regular ESC
"
if g:escape_alternative_enabled
  " INSERT and REPLACE
  imap jk <ESC>hl
  " VISUAL
  vmap jk <ESC>hl
endif

" Use ":" for Ex mode instead, use Q for formatting
"
map Q gq


" Open new tab
noremap <leaderht :tabe <C-m>

" Split open new window
"
" Horizontal
noremap <leader>hs :split<space>
" Vertical
noremap <leader>vs :vsplit<space>

" Manually toggle tab, space and EOL visibility
function! ToggleWhitespace()
set list!
if &list
  echo "Whitespace VISIBLE"
else
  echo "Whitespace INVISIBLE"
end
endfunction
map <leader>tw :call ToggleWhitespace()<CR>

" Toggle between hard and sort tabs
" Hard tabs sizes are consistent with soft tabs sizes for each file type
"
function! ToggleTabs()
  set expandtab!
  if &expandtab
    echo "Soft tabs enabled (SPACES)"
  else
    echo "Hard tabs enabled (TABS)"
  endif
endfunction
map <leader>tt :call ToggleTabs()<CR>

" Close current buffer
"
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" Delete buffer
map gd :bd<cr> 

" }}}
" Terminal {{{

if has("terminal")
  " in-editor terminal only works with some terminals
  " Horizontal split
  noremap <leader>ht :vert terminal <C-m>
  " Vertical split
  noremap <leader>vt :terminal <C-m>
else
  " There is a default terminal, but it's not as good
  noremap <leader>b :sh <C-m>
endif

" }}}

" }}}
" Packages {{{

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
let g:haskell_indent_where = 4 " 6
let g:haskell_indent_before_where = 4 " 2
let g:haskell_indent_after_bare_where = 4 " 2
let g:haskell_indent_do = 4 " 3
let g:haskell_indent_guard = 4 " 2
"}}}
" lightline.vim {{{
" Repository: https://github.com/itchyny/lightline.vim

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

" Functions {{{

" File name displays its path relative to wherever vim was opened
"
function! FilenameRelativePath()
  return expand('%')
endfunction

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable
          \ ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &ro ? '<U+2B64>' : ''
endfunction

function! MyTabFilename(n)
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
function! MyFilename()
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
  function! MyFugitive()
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
  function! MyFugitive()
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
function! MyFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

" File type only shows if window width is over 70 columns to avoid clutter
"
function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

" File encoding only shows if window width is over 70 columns to avoid clutter
"
function! MyFileencoding()
    return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
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

function! CtrlPMark()
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

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
    return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
  let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost * call s:syntastic()
augroup END
function! s:syntastic()
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
" nerdtree {{{
" Repository: https://github.com/scrooloose/nerdtree

" autocmd VimEnter * NERDTree " tree is open on start
" autocmd VimEnter * wincmd p " cursor starts in main window and not NERDtree
"
nmap <silent> <C-\> :NERDTreeToggle<CR>

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

autocmd FileType java setlocal omnifunc=javacomplete#Complete
" Enable smart (trying to guess import option) inserting class imports with F4
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
" To enable usual (will ask for import option) inserting class imports with F5
nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)
" To add all missing imports with F6
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
" To remove all missing imports with F7
nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)

nmap <leader>jI <Plug>(JavaComplete-Imports-AddMissing)
nmap <leader>jR <Plug>(JavaComplete-Imports-RemoveUnused)
nmap <leader>ji <Plug>(JavaComplete-Imports-AddSmart)
nmap <leader>jii <Plug>(JavaComplete-Imports-Add)

imap <C-j>I <Plug>(JavaComplete-Imports-AddMissing)
imap <C-j>R <Plug>(JavaComplete-Imports-RemoveUnused)
imap <C-j>i <Plug>(JavaComplete-Imports-AddSmart)
imap <C-j>ii <Plug>(JavaComplete-Imports-Add)

nmap <leader>jM <Plug>(JavaComplete-Generate-AbstractMethods)

imap <C-j>jM <Plug>(JavaComplete-Generate-AbstractMethods)

nmap <leader>jA <Plug>(JavaComplete-Generate-Accessors)
nmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
nmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
nmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)
nmap <leader>jts <Plug>(JavaComplete-Generate-ToString)
nmap <leader>jeq <Plug>(JavaComplete-Generate-EqualsAndHashCode)
nmap <leader>jc <Plug>(JavaComplete-Generate-Constructor)
nmap <leader>jcc <Plug>(JavaComplete-Generate-DefaultConstructor)

imap <C-j>s <Plug>(JavaComplete-Generate-AccessorSetter)
imap <C-j>g <Plug>(JavaComplete-Generate-AccessorGetter)
imap <C-j>a <Plug>(JavaComplete-Generate-AccessorSetterGetter)

vmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
vmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
vmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)

nmap <silent> <buffer> <leader>jn <Plug>(JavaComplete-Generate-NewClass)
nmap <silent> <buffer> <leader>jN <Plug>(JavaComplete-Generate-ClassInFile)

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

nnoremap <leader>w :ToggleWorkspace<CR>
" Set if workspace automatically writes to file with every edit
"
let g:workspace_autosave_always = 0

" }}}

" }}}
" UI Layout {{{

" Ruler is displayed on the right side of the status line at the bottom of the
" window. It displays the line number, the column number, and the relative
" position of the cursor in the file (as a percent)
"
set ruler

" Disable audio and visualbell alerts entirely when scrolling beyond file lines
" or pressing escape in normal mode
"
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Change the terminal's title
"   Kind of neat, but doesn't really do much
set title

" UTF-8 Encoding
"
set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8

" Text Wrapping
"
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

" Status bar displays the current mode, file name, file status, ruler etc.
" Current unnecessary with lightline
"
set laststatus=2

" Gui settings (MacVim or gVim)
"
set guioptions = " No scroll bars
" Disable all blinking
set guicursor+=a:blinkon0

" Cursor motion
"
" Determines the number of context lines you want to see above and below the
" cursor. Helpful for scrolling.
"
set scrolloff=5

" Show command
" Displays in bottom-right what keys have already been pressed for the current
" command
"
set showcmd

set hidden  " allow buffer switching without saving
set showtabline=2  " always show tabline
" do not show default INSERT mode below since this is what lightline does
set noshowmode


if g:cursor_color
  if g:cursor_color == 1 " Blue
    silent !echo -ne "\033]12;rgb:61/af/ef\x7\007"
  elseif g:cursor_color == 2 " Green
    silent !echo -ne "\033]12;rgb:98/c3/79\x7\007"
  elseif g:cursor_color == 3 " Red
    silent !echo -ne "\033]12;rgb:e0/6c/75\x7\007"
  endif
  " Reset cursor to original when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
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

" Show whitespace
" Visualize spaces, tabs and end of line characters
"
set listchars=tab:»\ ,eol:¬,trail:~,extends:>,precedes:<,space:·
if g:show_invisibles_enabled
  " Whitespace is visible
  set list
endif

" }}}
" Utility {{{

" Visul autocomplete for command menu
" Use tab to autocomplete
"
set wildmenu

" In many terminal emulators the mouse works just fine. By enabling it you can
" position the cursor, Visually select and scroll with the mouse.
if has('mouse')
  set mouse=a
endif

" Keep 200 lines of command line history
"
set history=200

" }}}
" Vimrc Organization {{{

" Set modelines to parse to 1
" This is normally dangerous to do for security reasons, but is necessary for
" organizational folding for this file
" Google "vim modeline vulnerability"
set modelines=1

" }}}
" vim:foldmethod=marker:foldlevel=0
