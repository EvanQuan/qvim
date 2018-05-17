" ============================================================================
" Name: vimrc
" Maintainer: https://github.com/EvanQuan/.vim/
" Version: 1.2.1
"
" Contains optional runtime configuration settings to initialize Vim when it
" starts. This should be linked to the ~/.vimrc file as described in the
" README.md file.
" ============================================================================

" Settings determine how some configurations are set
" Look at README.md if there is no settings.vim file in current directory
source ~/.vim/settings.vim


" Don't try to be vi compatible
"
set nocompatible

" if has('win32') || has('win64')
"  set runtimepath=path/to/home.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,path/to/home.vim/after
" endif


" Helps force plugins to load correctly when it is turned back on below
"
filetype off

" Load plugins with pathogen
"
execute pathogen#infect()
" Help tags are loaded from all packages
Helptags

" Turn on syntax highlighting
"
syntax enable

" For plugins to load correctly
"
filetype plugin indent on

" Leader key
" This key is used in combination with other keys to perform many customizable
" commands
" default leader is \
"
let mapleader = ","

" Security
" Google "vim modeline vulnerability"
"
" Set modelines to parse to 0
"
set modelines=0
" Disable modeline entirely just to be safe 
"
set nomodeline

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

" Open vimrc anywhere
"
nmap <silent> <leader>ev :e ~/.vim/vimrc<CR>
" Reload vimrc anywhere
"
nmap <silent> <leader>sv :so ~/.vim/vimrc<CR>
" Open settings.vim anywhere
"
nmap <silent> <leader>es :e ~/.vim/settings.vim<CR>
" To apply changes, reload vimrc

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

" Improves scrolling lag, especially with some forms of syntax highlighting
"
set lazyredraw

" Indentation
" Default: 4-space soft tab
"
set formatoptions=tcqrn1
set tabstop=4 " 2
set shiftwidth=4 " 2
set softtabstop=4 " 2
set expandtab " sets tabs to spaces
set noshiftround

" Toggle between hard and soft tabs
" Hard tab sizes are consistent with soft tab sizes 
"
"
function ToggleTabs()
  set expandtab!
  if &expandtab
    echo "Soft tabs enabled (SPACES)"
  else
    echo "Hard tabs enabled (TABS)"
  endif
endfunction
map <leader>i :call ToggleTabs()<CR>
" map <leader>i :set expandtab!<CR>

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

" As a priority, tabs or spaces is determined by what is already being used
" in the current file
"
function TabsOrSpaces()
  " Determines whether to use spaces or tabs on the current buffer.
  if getfsize(bufname("%")) > 256000
    " File is very large, just use the default.
    return
  endif

  let numTabs=len(filter(getbufline(bufname("%"), 1, 250), 'v:val =~ "^\\t"'))
  let numSpaces=len(filter(getbufline(bufname("%"), 1, 250), 'v:val =~ "^ "'))

  if numTabs > numSpaces
    setlocal noexpandtab
  endif
endfunction

" Call the function after opening a buffer
"
autocmd BufReadPost * call TabsOrSpaces()


" vim-workspace
"
nnoremap <leader>w :ToggleWorkspace<CR>
" Set if workspace automatically writes to file with every edit
"
let g:workspace_autosave_always = 0


" arm-syntax-vim
"
au BufNewFile,BufRead *.s,*.S,*.asm set filetype=arm " arm = armv6/7


" ctrlp.vim
"
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


" haskell-vim
"
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


" vim-javacomplete2 plugin
"
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
set scrolloff=3
" Allow backspacing over autoindent, line breaks, and start of insert action
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim


" Move up/down by visual lines instead of by 'literal' lines
" Good for when there is soft wrapping
"
nnoremap j gj
nnoremap k gk
" Go down half a page
nnoremap J <C-d> 
" Go up half a page
nnoremap K <C-u>


" Improves rendering when scrolling
"
set ttyfast


" Status bar displays the current mode, file name, file status, ruler etc.
" Current unnecessary with lightline
"
set laststatus=2


" Show command
" Displays in bottom-right what keys have already been pressed for the current
" command
"
set showcmd

" Visul autocomplete for command menu
" Use tab to autocomplete
"
set wildmenu


" Searching
nnoremap / /\v
vnoremap / /\v
" highlight matches
"
set hlsearch
" Search as characters are entered
"
set incsearch
" Ignore case when searching
"
set ignorecase
" ...unless case is specified, in which case is not ignored
"
set smartcase
" Matching parens highlighted
"
set showmatch
" clear search
"
nnoremap <leader><space> :nohlsearch<CR>

" Remap autocomplete movement to allow j,k movement
inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("k"))


" vim-togglecursor
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



" Nerdcommeter
" Add spaces after comment delimters
"
let g:NERDSpaceDelims = 1
" Align line-wise comment delimiters flush left instead of following code
" indentation
"
let g:NERDDefaultAlign = 'left'
" nmap <C-c> <Plug>NERDCommenterInvert
" imap <C-c> <Plug>NERDCommenterInvert
" vmap <C-c> <Plug>NERDCommenterInvert

" Indent with tab and unindenting with shift-tab in all modes
"
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
"
nmap <silent> <C-\> :NERDTreeToggle<CR>


" vim-gitgutter
" Delay time of the diff markers updating as the file is edited
"
set updatetime=100 " [ms] Default: 4000


" NOTE: Currently commented out, as Ctrl-P and Ctrl-N with standard hjkl
" movement does the job better
" Use TAB to complete when typing words, else inserts TABs as usual.
" Uses dictionary and source files to find matching words to complete.
" See help completion for source,
" Note: usual completion is on <C-n> but more trouble to press all the time.
" Never type the same word twice and maybe learn a new spellings!
" Use the Linux dictionary when spelling is in doubt.
" Window users can copy the file to their machine.
" function! Tab_Or_Complete()
"   if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
"     return "\<C-N>"
"   else
"     return "\<Tab>"
"   endif
" endfunction
" :inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
" :set dictionary="/usr/dict/words"


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
" Open new tab
noremap <leader>t :tabe <C-m>
" Split open new window
noremap <leader>s :split
noremap <leader>vs :vsplit
if exists(":terminal")
  " in-editor terminal only works with some terminals
  noremap <leader>b :terminal <C-m>
else
  " There is a default terminal, but it's not as good
  noremap <leader>b :sh <C-m>
endif
" Enable mouse scroll, clicking, and dragging in all modes
set mouse=a

" Close current buffer
"
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" Show whitespace
" Visualize spaces, tabs and end of line characters
"
set listchars=tab:»\ ,eol:¬,trail:~,extends:>,precedes:<,space:·
if g:show_invisibles_enabled
  " Whitespace is visible
  set list
endif
" Manually toggle tab, space and EOL visibility
function ToggleWhitespace()
  set list!
  if &list
    echo "Whitespace VISIBLE"
  else
    echo "Whitespace INVISIBLE"
  end
endfunction
map <leader>l :call ToggleWhitespace()<CR>


" vim-closetag
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


" Syntastic
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" One Dark Color scheme
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

" Color scheme (terminal)
"
set t_Co=256 " 256
set background=dark
let g:onedark_termcolors=256
let g:onedark_terminal_italics=1
let g:solarized_termcolors=256
let g:solarized_terminal_italics=1
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:

" Lightline
"
" set hidden  " allow buffer switching without saving
set nohidden " No hidden buffers because they are annoying
set showtabline=2  " always show tabline
" do not show default INSERT mode below since this is what lightline does
set noshowmode 

                    " \ 'enable': { 'tabline': 0 },
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

" lightline-buffer ui settings
" replace these symbols with ascii characters if your environment does not support unicode

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

" Arrow keys move between buffers
nnoremap <Left> :bprev<CR>
nnoremap <Right> :bnext<CR>

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
        let mark = '⭠ '
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

function! MyFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

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

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0


" Determine colorscheme based on settings.vim
" Lightline colorscheme is consistent with main colorscheme
if g:colorscheme_type == 1 " One dark
  colorscheme onedark
  let g:lightline.colorscheme = 'onedark'
elseif g:colorscheme_type == 2 " Solarized
  colorscheme solarized
  let g:lightline.colorscheme = 'solarized'
endif " else no colorscheme
