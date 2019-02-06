" ============================================================================
" File:       vimrc
" Maintainer: https://github.com/EvanQuan/qvim/
" Version:    3.16.0
"
" Contains optional runtime configuration settings to initialize Vim when it
" starts. For Vim versions before 7.4, this should be linked to the ~/.vimrc
" file as described in the README.md file. Later versions automatically detect
" this as the default user vimrc file. You can learn more about this
" configuraion with:
"
"     :help qvim
"
" Press ENTER or za to toggle category folding/unfolding.
" ============================================================================
" Initial Setup {{{

" The first steps necessary to set up everything.

" Version
" Displayed with lightline-buffer.
"
let g:vimrc_version = '3.16.0'

" Path {{{

" Operating system determines the vim home directory.
" NOTE: As of vimrc 2.0.0, with vim-plug as a manager, operating system
" difference problem can be bypassed with a uniform plugin runtime path.
"
let $MYVIMHOME = '~/.vim'

" $MYVIMRC already exists as a path variable, but defaults to ~/.vimrc
" if it exists. To prevent this, it is redefined to ensure that it links
" to this one.
"
let $MYVIMRC = $MYVIMHOME . '/vimrc'
let $MYPLUGINS = $MYVIMHOME . '/plugged'
let $MYGITPLUGINS = $MYVIMHOME . '/bundle'
let $MYDOC = $MYVIMHOME . '/doc'
let $MYQVIMDOC = $MYDOC . '/qvim.txt'
let $MYVERSION = $MYVIMHOME . '/version'
let $MYTEMPLATES = $MYVERSION . '/templates'
let $MYSETTINGS = $MYVIMHOME . '/settings.vim'
let $MYSETTINGSTEMPLATE = $MYTEMPLATES . '/settings.vim'
let $MYNOTES = $MYVIMHOME . '/notes.txt'
let $MYGVIMRC = $MYVIMHOME . '/gvimrc'
let $MYWINDOWSVIMRC = '~/_vimrc'
let $MYWINDOWSVIMRCTEMPLATE = $MYTEMPLATES . '/_vimrc'

let $ANACONDA_PYTHON = '/anaconda3/bin/python'

" }}}
" Settings {{{

" settings.vim determines how some configurations are set
" Copy ~/.vim/template/settings.vim if there is no settings.vim file
" in your ~/.vim/ directory.
"
" In case settings.vim does not exist, settings.vim template is used.
" If that also does not exist, setting variables directly defined here.
" Set settings to 3.1.0 defaults if settings.vim does not exist.
"
if filereadable(expand($MYSETTINGS))
  source $MYSETTINGS
elseif filereadable(expand($MYSETTINGSTEMPLATE))
  source $MYSETTINGSTEMPLATE
endif
if !exists('g:settings#truecolor')
  let g:settings#truecolor = 1
endif
if !exists('g:settings#powerline_symbols')
  let g:settings#powerline_symbols = 0
endif
if !exists('g:settings#colorscheme')
  let g:settings#colorscheme = 3
endif
if !exists('g:settings#highlight_cursor_line')
  let g:settings#highlight_cursor_line = 1
endif
if !exists('g:settings#highlight_cursor_column')
  let g:settings#highlight_cursor_column = 0
endif
if !exists('g:settings#highlight_width_indicator')
  let g:settings#highlight_width_indicator = 1
endif
if !exists('g:settings#italics')
  let g:settings#italics = 1
endif
if !exists('g:settings#line_numbers')
  let g:settings#line_numbers = 2
endif
if !exists('g:settings#wrap')
  let g:settings#wrap = 1
endif
if !exists('g:settings#wrap_width')
  let g:settings#wrap_width = 78
endif
if !exists('g:settings#whitespace')
  let g:settings#whitespace = 2
endif
if !exists('g:settings#escape_alternative')
  let g:settings#escape_alternative = 0
endif
if !exists('g:settings#python3_execution')
  let g:settings#python3_execution = 1
endif
if !exists('g:settings#cursor_color')
  let g:settings#cursor_color = 1
endif
if !exists('g:settings#dev_mode')
  let g:settings#dev_mode = 0
endif

" Set statusline to nothing for later commands that increment onto statusline.
" This lets the refresh vimrc command to work without overloading the
" statusline.
"
set statusline=

" }}}
" Plugins {{{

" Use Vim settings, rather than  Vi settings.
" This must be first because it changes other options as a side effect.
"
set nocompatible

" Helps force plugins to load correctly when it is turned back on after
" plugins are loaded.
"
" Note: This may be unecessary with vim-plug as plugin manager.
"
filetype off

" Load plugins with vim-plug from plugged directory
"
call plug#begin($MYPLUGINS)
" Color scheme {{{

Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'

" }}}
" Editing {{{

Plug 'jiangmiao/auto-pairs'
Plug $MYGITPLUGINS . '/betterdigraphs'
if (has('python') || has('python3')) && has('job') && has('timers') && has('lambda')
  Plug 'maralla/completor.vim'
else
  Plug 'Shougo/neocomplete.vim'
endif
Plug $MYGITPLUGINS . '/dragvisuals'
Plug $MYGITPLUGINS . '/listtrans'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'alvan/vim-closetag'
Plug 'junegunn/vim-easy-align'
Plug 'tommcdo/vim-exchange'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'thaerkh/vim-workspace'
Plug 'EvanQuan/vmath-plus'
Plug 'kana/vim-textobj-user'
Plug 'sgur/vim-textobj-parameter'
Plug 'wellle/targets.vim'
Plug $MYGITPLUGINS . '/vis.vim'
Plug 'bkad/CamelCaseMotion'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'EvanQuan/victionary'

" }}}
" File Navigation {{{

Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'pbrisbin/vim-mkdir'

" }}}
" Language Support {{{

Plug 'ARM9/arm-syntax-vim', { 'for': 'arm' }
Plug 'adimit/prolog.vim', { 'for': 'prolog' }
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }
Plug 'sheerun/vim-polyglot'
Plug 'mxw/vim-prolog', { 'for': 'prolog' }
Plug 'jeetsukumaran/vim-pythonsense', { 'for': 'python' }
Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }
Plug 'lervag/vimtex', { 'for': 'tex' }

" }}}
" Linting {{{

Plug 'w0rp/ale'
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
" Plug 'davidhalter/jedi-vim'
" Plug 'python-mode/python-mode', { 'branch': 'develop' , 'for': 'python'}

" }}}
" Programming {{{

Plug 'EvanQuan/vim-executioner'

" }}}
" User Interface {{{

Plug 'junegunn/goyo.vim'
Plug 'Yggdroot/indentLine'
Plug 'taohexxx/lightline-buffer'
Plug 'itchyny/lightline.vim'
Plug 'unblevable/quick-scope'
Plug 'hecal3/vim-leader-guide'
Plug 'tpope/vim-sleuth'
Plug 'jszakmeister/vim-togglecursor'

" }}}
" Version Control {{{

Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'itchyny/vim-gitbranch'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb'

" }}}
" Dev {{{

if g:settings#dev_mode
  Plug 'EvanQuan/vim-AAAAAAAAAAAAAA'
  Plug 'EvanQuan/vim-dna-sharp'
  Plug 'EvanQuan/vim-scene'
  Plug 'EvanQuan/vim-verbose'
  Plug 'EvanQuan/vim-indent-with-semicolons'
  Plug 'junegunn/vader.vim'
endif

" }}}
call plug#end()

" For plugins to load correctly
" Only do this part when compiled with support for autocommands
"
if has('autocmd')
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
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

" }}}

" }}}
" Appearance {{{

" Color Scheme {{{

if g:settings#italics == 1
  let g:onedark_terminal_italics = 1
endif

" When set to "dark", Vim will try to use colors that look good on a dark
" background.
"
if g:settings#colorscheme == 2
  set background=light
else
  set background=dark
endif

" Determine color scheme based on settings.vim
" Lightline color scheme is consistent with main color scheme
"
if g:settings#colorscheme >= 3
  colorscheme onedark
elseif g:settings#colorscheme >= 1
  colorscheme one
endif

" }}}
" Font {{{

" This is not placed in the gvimrc because gvimrc loads after vimrc
" Lightline needs powerline fonts to work correctly. While this can be easily
" set manually for terminals, configuring GUI fonts is a bit more difficult,
" and can be done here.
"
if (has('win32') || has('win64') || has('gui_running')) && !has('gui_macvim')
  " NOTE: gVim and terminal on Windows seems to be restricted to a select few
  " predefined fonts, even if more fonts are installed. This makes powerline
  " fonts on  Windows not possible.
  " Git Bash for Windows does not consider itself be windows, so
  " g:settings#powerline_symbols must be manually disabled in settings.
  let g:settings#powerline_symbols = 0
endif



" }}}
" Syntax Highlighting {{{

" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors)
"
if &t_Co > 2 || has('gui_running')
  " Revert with ":syntax off"
  syntax enable
endif


" Use 24-bit (true color) mode in Vim/Neovim when outside tmux. If you're
" using tmux version 2.2 or later, you can remove the outermost $TMUX check
" and use tmux's 24-bit color support (see
" < http://sunaku.github.io/tmux-24bit-color.html#usage > for more
" information.)
"
if g:settings#truecolor
  " if (empty($TMUX))
    if (has("nvim"))
      " For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
      let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    " For Neovim > 0.1.5 and Vim > patch 7.4.1799
    " < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
    " > Based on Vim patch 7.4.1770 (`guicolors` option)
    " < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
    " > < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
    if (has("termguicolors"))
      set termguicolors
    " endif
  endif
endif

" }}}

" }}}
" Folding {{{

" Enable folding
"
set foldenable

" After setting fold method to identation by default for a while, I have found
" that I have never actually used folding in my work. However, I find that
" "{{{", "}}}" delimited auto-folding to be very useful in for arbitrary
" projects of different langauges.
"
set foldmethod=marker
set foldlevel=0

" }}}
" Languages {{{

" Default {{{

" Describes how automatic formatting is done.
"
set formatoptions=tcqrn1

" 4-space soft tabs
"
" Number of spaces that a <Tab> in the file counts for.
" Default 8
"
set tabstop=4

" Number of spaces to use for each step of (auto)indent.
"
set shiftwidth=4

" Number of spaces that a <Tab> conunts for while performing editing
" operations.
"
set softtabstop=4

" In Insert mode: use the appropraiate number of spaces to insert a <Tab>.
"
set expandtab " sets tabs to spaces

" Do not round indent to multiple of 'shiftwidth'.
"
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
" Auto-Detect {{{

" As a priority, soft or hard tab indentation is determined by what is already
" being used in the current file.
" TODO remove due to sleuth?

" function! TabsOrSpaces() abort
"   " Determines whether to use spaces or tabs on the current buffer.
"   if getfsize(bufname("%")) > 256000
"     " If the file is very large, just use the default, since it will take too
"     " long to determine which tab type to use.
"     return
"   endif

"   " To determine priority, get the number of tab indentations and space
"   " indentations, and choose the one that is used more frequently
"   let numTabs=len(filter(getbufline(bufname("%"), 1, 250), 'v:val =~ "^\\t"'))
"   let numSpaces=len(filter(getbufline(bufname("%"), 1, 250), 'v:val =~ "^\\ "'))

"   if numTabs > numSpaces
"     setlocal noexpandtab " enable hard tabs
"   else
"     setlocal expandtab
"   endif
" endfunction

" " Call the function after opening a buffer
" if has('autocmd')
"   autocmd BufReadPost * call TabsOrSpaces()
" endif

" }}}

" }}}
" Mappings {{{

" Leader Key {{{

" This key is used in combination with other keys to perform many customizable
" commands
" default leader is \
"
let mapleader = " "

" }}}
" Editing {{{

" Recursive mapping due to vim-speeddating plugin
" Incrementing and decrementing numbers
"
map + <C-a>
map - <C-x>

" Sequential increment and decrement
map g+ g<C-a>
map g- g<C-x>

" Change {{{

" Replaces the word under cursor with whatever you want
"   Similar to ciw
" Repeat with . replaces FOLLOWING occurrences of that word
"
nnoremap c* /\<<C-R>=expand('<cword>')<Return>\>\C<Return>``cgn

" Repeat with . replaces PREVIOUS occurrences of that word
"
nnoremap c# ?\<<C-R>=expand('<cword>')<Return>\>\C<Return>``cgN

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

" }}}
" Delete {{{

" Similar with delete diw
"
nnoremap d* /\<<C-r>=expand('<cword>')<Return>\>\C<Return>``dgn
nnoremap d# ?\<<C-r>=expand('<cword>')<Return>\>\C<Return>``dg

" Around/In Line
"
nnoremap dal dd
" TODO: This pauses for some reason, source not found. Mapped here prevents
" delay. Perhaps source is plugin. Grepping shows no results.
nnoremap dd dd
nnoremap dil S<Esc>

" Around/In Double Quotes
"
nnoremap daq da"
nnoremap diq di"

" Around/In Single Quotes
"
nnoremap daQ da'
nnoremap diQ di'

" }}}
" Spelling {{{

" Suggest spellcheck fixes for current word
"
noremap <Leader>ss z=

" }}}
" Substitute {{{

" Globally in File
"
noremap <Leader>sgf :%s//g<Left><Left>

" First in File
"
noremap <Leader>sff :%s//<Left>

" Globally in Line
"
noremap <Leader>sgl :s//g<Left><Left>

" In Line
"
noremap <Leader>sfl :s//<Left>

" }}}
" Paste {{{

" Put Vim in Paste mode. This is useful if you want to cut or copy some text
" from another window and paste it in Vim. This will avoid unexpected effects.
" Setting this option is useful when using Vim in a terminal, where Vim cannot
" distinguish between typed text and pasted text.
"
function! TogglePasteMode() abort
  set paste!
  if &paste
    echo "-- PASTE ON --"
  else
    echo "-- PASTE OFF --"
  endif
endfunction
noremap <Leader>tp :call TogglePasteMode()<Return>

" Similar to yanking

" Leader prefix added to prevent input lag for normal 'p'
" Current disabled, as special paste commands requires leader prefix.
" nnoremap pp p

" System Clipboard
"
noremap <Leader>pc "+p

" Around/In Word
"
nnoremap <Leader>paw "_dawP
nnoremap <Leader>piw "_diwP

" Around/In Braces
"
nnoremap <Leader>pi{ "_di{P
nnoremap <Leader>pi} "_di}P
nnoremap <Leader>piB "_di{P
nnoremap <Leader>piB "_di}P

" Around/In Brackets
"
nnoremap <Leader>pi[ "_di[P
nnoremap <Leader>pi] "_di]P

" Around/In Double Quotes
"
nnoremap <Leader>pa" "_da"P
nnoremap <Leader>paq "_da"P
nnoremap <Leader>pi" "_di"P
nnoremap <Leader>piq "_di"P

" Around/In Single Quotes
"
nnoremap <Leader>pa' "_da'P
nnoremap <Leader>paQ "_da'P
nnoremap <Leader>pi' "_di'P
nnoremap <Leader>piQ "_di"P

" Parens
"
nnoremap <Leader>pi( "_di(P
nnoremap <Leader>pi) "_di)P
nnoremap <Leader>pib "_di(P
nnoremap <Leader>pib "_di)P

" Greater/less than
nnoremap <Leader>pi< "_di<P
nnoremap <Leader>pi> "_di>P

" Tag
"
nnoremap <Leader>pit "_ditP

" Line
"
nnoremap <Leader>pil "_ddP

" }}}
" Underline {{{

nnoremap <Leader>u- yypVr-j
nnoremap <Leader>u= yypVr=j

" }}}
" Visual {{{

" Around Line
" Selects current line, but in Visual mode, not Visual-Line mode
"
vnoremap al <Esc>0v$

" In Line
" Selects current line, except for end-of-line character, in Visual mode
"
vnoremap il <Esc>0v$h

" Around/In Double Quotes
"
vnoremap aq a"
vnoremap iq i"

" Around/In Single Quotes
"
vnoremap aQ a'
vnoremap iQ i'

" Make Backspace/Delete work as expected in visual modes by deleting the
" selected text
"
vnoremap <BS> x

" Select all (the entire file).
"
vnoremap aa VGo1G

" }}}
" Yank {{{

" System clipboard
"
noremap <Leader>y "+y

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

" }}}

" }}}
" Files {{{

" Toggle between the last two files opened in current session.
"
nnoremap <Leader>tf <C-^>

" Edit vimrc
"
nnoremap <silent> <Leader>ev :edit $MYVIMRC<Return>
nnoremap <silent> <Leader>hev :split $MYVIMRC<Return>
nnoremap <silent> <Leader>vev :vsplit $MYVIMRC<Return>

" Edit Windows _vimrc
"
nnoremap <silent> <Leader>ew :edit $MYWINDOWSVIMRC<Return>
nnoremap <silent> <Leader>hew :split $MYWINDOWSVIMRC<Return>
nnoremap <silent> <Leader>vew :vsplit $MYWINDOWSVIMRC<Return>

" Edit Windows _vimrc template
"
nnoremap <silent> <Leader>eW :edit $MYWINDOWSVIMRCTEMPLATE<Return>
nnoremap <silent> <Leader>heW :split $MYWINDOWSVIMRCTEMPLATE<Return>
nnoremap <silent> <Leader>veW :vsplit $MYWINDOWSVIMRCTEMPLATE<Return>

" Edit qvim.txt help documentation
"
nnoremap <silent> <Leader>eq :edit $MYQVIMDOC<Return>
nnoremap <silent> <Leader>heq :split $MYQVIMDOC<Return>
nnoremap <silent> <Leader>veq :vsplit $MYQVIMDOC<Return>

" Edit gvimrc
"
nnoremap <silent> <Leader>eg :edit $MYGVIMRC<Return>
nnoremap <silent> <Leader>heg :split $MYGVIMRC<Return>
nnoremap <silent> <Leader>veg :vsplit $MYGVIMRC<Return>

" Reload vimrc
"
nnoremap <silent> <Leader>Rv :source $MYVIMRC<Return>

" Open settings.vim
"
nnoremap <silent> <Leader>es :edit $MYSETTINGS<Return>
nnoremap <silent> <Leader>hes :split $MYSETTINGS<Return>
nnoremap <silent> <Leader>ves :vsplit $MYSETTINGS<Return>

" Open settings.vim template
"
nnoremap <silent> <Leader>eS :edit $MYSETTINGSTEMPLATE<Return>
nnoremap <silent> <Leader>heS :split $MYSETTINGSTEMPLATE<Return>
nnoremap <silent> <Leader>veS :vsplit $MYSETTINGSTEMPLATE<Return>

" Open notes.txt
"
nnoremap <silent> <Leader>en :edit $MYNOTES<Return>
nnoremap <silent> <Leader>hen :split $MYNOTES<Return>
nnoremap <silent> <Leader>ven :vsplit $MYNOTES<Return>

" .tmux.conf
"
nnoremap <silent> <Leader>et :edit ~/.tmux.conf<Return>
nnoremap <silent> <Leader>het :split ~/.tmux.conf<Return>
nnoremap <silent> <Leader>vet :vsplit ~/.tmux.conf<Return>

" .bashrc
"
nnoremap <silent> <Leader>eb :edit ~/.bashrc<Return>
nnoremap <silent> <Leader>heb :split ~/.bashrc<Return>
nnoremap <silent> <Leader>veb :vsplit ~/.bashrc<Return>

" README.md
"
nnoremap <Leader>eR :edit README.md<Return>
nnoremap <Leader>heR :split README.md<Return>
nnoremap <Leader>veR :vsplit README.md<Return>

" run.sh
"
nnoremap <Leader>er :edit run.sh<Return>
nnoremap <Leader>her :split run.sh<Return>
nnoremap <Leader>ver :vsplit run.sh<Return>

" Makefile
"
nnoremap <Leader>em :edit makefile<Return>
nnoremap <Leader>hem :split makefile<Return>
nnoremap <Leader>vem :vsplit makefile<Return>

" input.txt
"
nnoremap <silent> <Leader>ei :edit input.txt<Return>
nnoremap <silent> <Leader>hei :split input.txt<Return>
nnoremap <silent> <Leader>vei :vsplit input.txt<Return>

" output.txt
"
nnoremap <silent> <Leader>eo :edit output.txt<Return>
nnoremap <silent> <Leader>heo :split output.txt<Return>
nnoremap <silent> <Leader>veo :vsplit output.txt<Return>

" }}}
" Folding {{{

" Toggle open/close folds
" Since default leader key is remapped, use it for folding
" Enter doesn't do anything in normal mode. Use it for folding.
"
nnoremap \ za
nnoremap <Return> za

" Change fold method settings
"
nnoremap <Leader>Ff :set fdm=manual<Return>
nnoremap <Leader>Fi :set fdm=indent<Return>
nnoremap <Leader>Fm :set fdm=marker<Return>
nnoremap <Leader>Fs :set fdm=syntax<Return>
nnoremap <Leader>Fd :set fdm=diff<Return>

" }}}
" Git {{{

nnoremap <Leader>gb :Gblame<Return>

" Open current file, blob, tree, commit, or tag in browser at upstream
" hosting provider.
"
nnoremap <Leader>gx :Gbrowse<Return>

" Diff
"
nnoremap <Leader>gd :Gdiff<Return>

" Status
"
nnoremap <Leader>gs :Gstatus<Return>

" Add/Stage all in current directory
"
nnoremap <Leader>ga :Git add .<Return>

" Write to the current file's path and stage the results.
"
nnoremap <Leader>gw :Gwrite<Return>

" Commit
"
nnoremap <Leader>gc :Gcommit<Return>

" Push
"
nnoremap <Leader>gp :Git push<Return>

" Pull
"
nnoremap <Leader>gl :Git pull<Return>

" Log
nnoremap <Leader>gl :Git log<Return>

" Edit config
"
nnoremap <Leader>ge :Git config -e<Return>

" Edit global config
"
nnoremap <Leader>gg :Git config --global -e<Return>

" }}}
" Formatting {{{

" Repeat last macro.
" NOTE: Overwrites default for enter Ex-mode.
" Use ":" for Ex mode instead (Command mode).
"
noremap Q @@

" Remove all carriage returns (displayed as ^M) from the current file.
" Use when the encodings gets messed up.
"
function! DeleteCarriageReturns() abort
  execute "normal mmHmt:%s/\<C-V>\<Return>//ge\<Return>'tzt'm"
  echo "-- DELETED CARRIAGE RETURNS --"
endfunction
nnoremap dc :call DeleteCarriageReturns()<Return>

" Delete all trailing whitespace from the current file.
"
function! DeleteTrailingWhitespace() abort
  " Store last search
  let _s=@/
  " Store cursor position
  let l = line(".")
  let c = col(".")
  " Strip white space
  %!git stripspace
  " Clean up:
  " Restore previous search history
  let @/=_s
  " Restore cursor position
  call cursor(1, c)
  echo "-- DELETED TRAILING WHITESPACE --"
endfunction
nnoremap dr :call DeleteTrailingWhitespace()<Return>

" }}}
" Layout {{{

" Resize windows
"
nnoremap <C-j> <C-w>+
nnoremap <C-k> <C-w>-
nnoremap <C-l> <C-w>>
nnoremap <C-h> <C-w><

" }}}
" Movement {{{

" Buffers {{{

" Move between buffers
"
" Next buffer
"
nnoremap ]b :bnext<Return>

" Previous buffer
"
nnoremap [b :bprevious<Return>

" Quit current buffer
"
function! QuitCurrentBuffer() abort
  execute "bprevious|split|bnext|bdelete"
  echo "-- QUIT BUFFER --"
endfunction
nnoremap <Leader>qb :call QuitCurrentBuffer()<Return>

" Quit all buffers except the currently focused one.
" Convenient when hidden buffers accumulate over time.
"
function! QuitHiddenBuffers() abort
  let tpbl=[]
  call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
  for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
    silent execute 'bwipeout' buf
  endfor
  echo "-- QUIT HIDDEN BUFFERS --"
endfunction
nnoremap <silent> <Leader>qh :call QuitHiddenBuffers()<Return>

" }}}
" Windows {{{

" Split open new window

" NOTE: Functions exist to allow for user input for vim-leader-guide
" but at the cost of no filename autocomplete. This is suboptimal.
" If command is done fast enough without prompting vim-leader-guide, then
" filename completion works.

" Horizontal
"
function! HorizontalSplit() abort
  " This function exists for vim-leader-guide compatibility
  call feedkeys(":split ")
endfunction
nnoremap <Leader>hs :split<space>

" Vertical
"
function! VerticalSplit() abort
  " This function exists for vim-leader-guide compatibility
  call feedkeys(":vsplit ")
endfunction
nnoremap <Leader>vs :vsplit<space>

" Directional movement
"
nnoremap <Leader>wh <C-w>h
nnoremap <Leader>wj <C-w>j
nnoremap <Leader>wk <C-w>k
nnoremap <Leader>wl <C-w>l

" Go to next window
"
nnoremap ]w <C-w>w

" Go to previous window
"
nnoremap [w <C-w>W

" Quit window
"
nnoremap <Leader>qw :x<Return>
nnoremap <Leader>wq :x<Return>

" Split
nnoremap <Leader>ws <C-w>s
nnoremap <Leader>wv <C-w>v

" }}}
" Tabs {{{

" Open new tab
nnoremap <Leader>ot :tabe<Return>

" Go to tab :by number
"
nnoremap <Leader>T1 1gt
nnoremap <Leader>T2 2gt
nnoremap <Leader>T3 3gt
nnoremap <Leader>T4 4gt
nnoremap <Leader>T5 5gt
nnoremap <Leader>T6 6gt
nnoremap <Leader>T7 7gt
nnoremap <Leader>T8 8gt
nnoremap <Leader>T9 9gt
nnoremap <Leader>Tf :tabfirst<Return>
nnoremap <Leader>Tl :tablast<Return>

" Go to next tab
" Same as gt
"
nnoremap ]t :tabnext<Return>

" Go to previous tab
" Same as gT
"
nnoremap [t :tabprevious<Return>

" Quit tab
"
nnoremap <Leader>qt tabclose

" }}}
" Session {{{

function! ChangeDirectory() abort
  " cd vim into the directory of the current buffer
  execute ":cd %:p:h"
  echo "Changed current working directory to " . getcwd()
endfunction
nnoremap cd :call ChangeDirectory()<Return>

" }}}
" Within Window {{{

" Move up/down by visual lines instead of by 'literal' lines
" Good for when there is soft wrapping.
" If using count to move up and down, revert back to 'logical' lines so that
" wrapped lines only count as one. Mark the previous location so it can be
" returned to with CTRL-O
"
nnoremap <expr> j (v:count > 1 ? "m'" . v:count . 'j' : 'gj')
nnoremap <expr> k (v:count > 1 ? "m'" . v:count . 'k' : 'gk')

" Non-modifier approach to moving up and down half a window. Since j and
" k already use gj/gk, we might as well make use of these bindings.
"
noremap gj <C-d>
noremap gk <C-u>

" Allow backspacing over autoindent, line breaks, and start of insert action
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Alternative to Esc key
" Not applied to NORMAL mode due to "j" and "k" being used in movement
" Normally, pressing Esc moves the cursor left by 1.
" Mapping a key to <Esc> does not do this.
" Applying h (move left) moves the cursor left by 2 so hl (left then right),
" makes the behaviour the same as regular Esc
"
if g:settings#escape_alternative == 1
  inoremap aa <Esc>hl
  vnoremap aa <Esc>hl
elseif g:settings#escape_alternative == 2
  inoremap jk <Esc>hl
  vnoremap jk <Esc>hl
  inoremap kj <Esc>hl
  vnoremap kj <Esc>hl
endif

" Search for TODO comments
"
nnoremap ]T /TODO<Return>
nnoremap [T ?TODO<Return>

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
    echo "-- SOFT TABS (" . &softtabstop . " SPACES) --"
  else
    echo "-- HARD TABS (" . &tabstop . " SPACES) --"
  endif
endfunction
nnoremap <Leader>ti :call ToggleTabs()<Return>

" Replace all sequences of white-space containing a <Tab> with new strings of
" white-space using the new tabstop value given. If you do not specify a new
" tabstop size or it is zero, Vim uses the current value of 'tabstop'.
"
nnoremap <Leader>Rt :retab<Return>

" }}}
" Searching {{{

" Enable "very magic" search mode
" All characters except 0-9, a-z, A-Z, an _ have special meaning
" Allow for searching with regex
" Type ":help \v" for more information
"
nnoremap / /\v
vnoremap / /\v

" Going to next/previous search moves cursor to the centre of the screen.
"
noremap n nzz
noremap N Nzz

" clear highlighting
"
" Cannot directy nnoremap <Esc>. Workaround.
nnoremap <Leader><space> :nohlsearch<Return>
" Source: https://stackoverflow.com/questions/11940801/mapping-esc-in-vimrc-causes-bizarre-arrow-behaviour
" TODO this is causing bugs
" if has('gui_running')
"   nnoremap <silent> <esc> :nohlsearch<return><esc>
" else
"   " code from above
  " augroup no_highlight
  "   autocmd TermResponse * nnoremap <esc> :noh<return><esc>
  " augroup END

" end
" nnoremap <esc> :noh<return><esc>

" augroup escape_mapping
"   autocmd!
"   autocmd InsertEnter * call s:setupEscapeMap()
" augroup END

" function! s:setupEscapeMap()
"   nnoremap <Esc> :noh<Return><Esc>
" endfunction"




"
" Convenient command to see the different between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
"
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
    \ | wincmd p | diffthis
endif
" Bind it for convenience
noremap <Leader>fd :DiffOrig<Return>

" }}}
" Terminal {{{

if has("terminal")
  " in-editor terminal only works with some terminals
  " Vertical split with terminal
  noremap <Leader>vt :vertical terminal<Return>
  " Horizontal split with terminal
  noremap <Leader>ht :terminal<Return>
else
  " Default to shell when terminal is not available
  noremap <Leader>vt :shell<Return>
  noremap <Leader>ht :shell<Return>
endif
" There is a terminal which is available for earlier versions of Vim,
" which opens the terminal in a new buffer.
" It can be closed with "exit" or "Ctrl-D".
"
noremap <Leader>ob :shell<Return>

" }}}
" User Interface {{{

" Toggle colorcolumn visibility
"
let s:colorcolumn_visible = g:settings#highlight_width_indicator
function! ToggleColorColumn() abort
  if s:colorcolumn_visible
    let s:colorcolumn_visible = 0
    set colorcolumn=0
    echo "-- COLORCOLUMN DISABLED --"
  else
    let s:colorcolumn_visible = 1
    set colorcolumn=+1
    " execute "set colorcolumn=".(g:settings#wrap_width + 1)
    echo "-- COLORCOLUMN ENABLED --"
  endif
endfunction
nnoremap <Leader>thw :call ToggleColorColumn()<Return>

" Toggle cursorcolumn visibility
"
function! ToggleCursorColumn() abort
  set cursorcolumn!
  if &cursorcolumn
    echo "-- CURSORCOLUMN ENABLED --"
  else
    echo "-- CURSORCOLUMN DISABLED --"
  endif
endfunction
nnoremap <Leader>thc :call ToggleCursorColumn()<Return>


" Toggle cursorline visibility
"
function! ToggleCursorLine() abort
  set cursorline!
  if &cursorline
    echo "-- CURSORLINE ENABLED --"
  else
    echo "-- CURSORLINE DISABLED --"
  endif
endfunction
nnoremap <Leader>thl :call ToggleCursorLine()<Return>

" Toggle spell check
"
function! ToggleSpellcheck() abort
  set spell!
  if &spell
    echo "-- SPELLCHECK ENABLED --"
  else
    echo "-- SPELLCHECK DISABLED --"
  endif
endfunction
nnoremap <Leader>ts :call ToggleSpellcheck()<Return>

" }}}
" Visibility {{{

" Toggle tab, space and EOL visibility
"
function! ToggleWhitespace() abort
  set list!
  if &list
    echo "-- WHITESPACE ON --"
  else
    echo "-- WHITESPACE OFF --"
  endif
endfunction
noremap <Leader>tw :call ToggleWhitespace()<Return>

" Refresh syntax highlighting in case it gets messed up
" TODO: Never actually tested this. Doesn't work?
"
nnoremap <Leader>Rh :execute 'colo' colors_name<Return>:syntax sync fromstart<Return>

" Toggle absolute and relative line numbers
"
function! ToggleRelativeLineNumbers() abort
  if &relativenumber
    set number norelativenumber
    echo "-- ABSOLUTE LINE NUMBERS --"
  else
    set relativenumber
    echo "-- RELATIVE LINE NUMBERS --"
  endif
endfunction
noremap <Leader>tr :call ToggleRelativeLineNumbers()<Return>

" Toggle line number visibility
"
function! ToggleLineNumbers() abort
  if &number
    set nonumber norelativenumber
    echo "-- LINE NUMBERS OFF --"
  else
    set number relativenumber
    echo "-- LINE NUMBERS ON --"
  endif
endfunction
noremap <Leader>tl :call ToggleLineNumbers()<Return>

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
" screen for redrawing, instead of using insert/delete line commands. Improves
" smoothness of redrawing when there are multiple windows and the terminal
" does not support a scrolling region.
" Also enables the extra writing of characters at the end of each screen line
" for lines that wrap. This helps when using copy/paste with the mouse in an
" xterm and other terminals.
"
" Improves rendering when scrolling
"
set ttyfast

" Maximum column inn which to search for syntax items. In long lines the text
" after this column is not highlighted and following lines may not be
" highlighted correctly, because the syntax state is cleared.
" This helps avoid very slow redrawing for an XML file that is one long line.
" Set to 0 to remove the limit.
"
" Currently disabled as its effect is minimal and most files don't have text
" that extends laterally that far anyways.
"
" Default 3000
"
" set synmaxcol=128

" }}}
" Plugins {{{

" ale {{{
" Repository: https://github.com/w0rp/ale

" Enable or disable ALE linting, including all of its autocmd events, loclist
" items, quickfix items, signs, current jobs, etc., globally.
"
nnoremap <Leader>ta :ALEToggle<Return>

nnoremap <Leader>ad :ALEDetail<Return>
nnoremap <Leader>ag :ALEGoToDefinition<Return>
nnoremap <Leader>ah :ALEHover<Return>
nnoremap <Leader>ar :ALEFindReferences<Return>
nnoremap <Leader>as :ALEFixSuggest<Return>
nnoremap <Leader>at :ALEToggle<Return>

" Move between ale linting errors
"
nnoremap ]a :ALENextWrap<Return>
nnoremap [a :ALEPreviousWrap<Return>

" Repository: https://github.com/desmap/ale-sensible
" TODO: May later install plugin later down the road, but currently seems
" unnecessary.

" Don't use the sign column/gutter for ALE
let g:ale_set_signs = 0

" Lint always in Normal Mode
let g:ale_lint_on_text_changed = 'normal'

" Lint when leaving Insert Mode but don't lint when in Insert Mode
let g:ale_lint_on_insert_leave = 1

" Set ALE's 200ms delay to zero
let g:ale_lint_delay = 0

" Set gorgeous colors for marked lines to sane, readable combinations
" working with any colorscheme
au! VimEnter,BufEnter,ColorScheme *
  \ exec "hi! ALEInfoLine
    \ guifg=".(&background=='light'?'#808000':'#ffff00')."
    \ guibg=".(&background=='light'?'#ffff00':'#555500') |
  \ exec "hi! ALEWarningLine
    \ guifg=".(&background=='light'?'#808000':'#ffff00')."
    \ guibg=".(&background=='light'?'#ffff00':'#555500') |
  \ exec "hi! ALEErrorLine
    \ guifg=".(&background=='light'?'#ff0000':'#ff0000')."
    \ guibg=".(&background=='light'?'#ffcccc':'#550000')

"}}}
" betterdigraphs {{{

" NOTE: Does not currently work as expected. In terms of automatically
" completing the digraphs, it works, but the visual prompt is broken.
" Don't now if this is due to conflicts with other settings or plugins, or
" because the plugin is so old that its behaviour is outdated in newer
" versions of Vim.
"
inoremap <expr> <C-K> BDG_GetDigraph ()

" }}}
" CamelCaseMotion {{{
" Repository: https://github.com/bkad/CamelCaseMotion

call camelcasemotion#CreateMotionMappings(',')

" }}}
" ctrlp.vim {{{
" Repository: https://github.com/ctrlpvim/ctrlp.vim

" Fuzzy find OR find file
nnoremap <silent> <Leader>ff :CtrlP<Return>

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
" dragvisuals {{{

" Arrow keys are used because they normally have no other use. However, this
" breaks home row flow so <C-hjkl> is used instead. <S-hjkl> was considered as
" a slightly more ergonomic alternative, but it removes the default <S-hjkl>
" features, so it was avoided.
"
vmap  <expr>  <left>   DVB_Drag('left')
vmap  <expr>  <right>  DVB_Drag('right')
vmap  <expr>  <down>   DVB_Drag('down')
vmap  <expr>  <up>     DVB_Drag('up')
vmap  <expr>  <C-h>    DVB_Drag('left')
vmap  <expr>  <C-l>    DVB_Drag('right')
vmap  <expr>  <C-j>    DVB_Drag('down')
vmap  <expr>  <C-k>    DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()

" Remove any introduced trailing whitespace after moving
"
let g:DVB_TrimWS = 1

" }}}
" goyo.vim {{{
" Repository: https://github.com/junegunn/goyo.vim

" Toggle distract-free
"
nnoremap <silent> <Leader>td :Goyo<Return>

" Avoid line numbers changing on insert
"
if has('autocmd')
  function! s:goyo_enter()
      autocmd! InsertEnter *
      autocmd! InsertLeave *
  endfunction

  function! s:goyo_leave()
      autocmd InsertEnter * :set number norelativenumber
      autocmd InsertLeave * :set relativenumber
  endfunction

  autocmd! User GoyoEnter nested call <SID>goyo_enter()
  autocmd! User GoyoLeave nested call <SID>goyo_leave()
endif


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
let g:haskell_indent_before_where = 2 " 2
let g:haskell_indent_after_bare_where = 2 " 2
let g:haskell_indent_do = 4 " 3
let g:haskell_indent_guard = 4 " 2
"}}}
" indentLine {{{
" Repository: https://github.com/Yggdroot/indentLine

" Use this option to specify a list of filetypes to disable the plugin for.
"
" Disabling no filetype ('') also disables nerdtree.
"
let g:indentLine_fileTypeExclude = ['help', 'text', '']
let g:indentLine_char = '│'

" Concealing is annoying while editing, but is fine for reading
"
let g:indentLine_concealcursor=0

" }}}
" jedi-vim {{{

" TODO this may be replaced with python-mode
" let g:pymode_python = 'python3'
" Requires python support to work. If Vim build does not support jedi, then
" don't load the plugin.
"
if has('python3') || has('python')
  let g:jedi#goto_command = "<Leader>jd"
  let g:jedi#goto_assignments_command = "<Leader>ja"
  let g:jedi#goto_definitions_command = ""
  let g:jedi#documentation_command = "K"
  let g:jedi#usages_command = "<Leader>ju"
  let g:jedi#completions_command = "<C-Space>"
  let g:jedi#rename_command = "<Leader>jr"
else
  let g:jedi#auto_initialization = 0
  let g:jedi#squelch_py_warning = 1
endif

" }}}
" lightline.vim {{{
" Repository: https://github.com/itchyny/lightline.vim

" Layout {{{

    " \           [ 'expandtab', 'fileencoding', 'fileformat'],
                    " \ 'enable': { 'tabline': 0 },
" This determines what information lightline shows and in what format
" I did not make this or the corresponding functions it uses
"
let g:lightline = {
  \ 'active': {
    \ 'left': [ [ 'mode', 'paste' ],
    \           [ 'fugitive', 'readonly', 'modified' ],
    \           [ 'filename'],
    \         ],
    \ 'right':[ [ 'percent', 'lineinfo' ],
    \           [ 'filetype' ],
    \           [ 'expandtab', 'fileencoding', 'fileformat' ],
    \         ]
    \ },
  \ 'component_function': {
    \ 'time': 'MyTime',
    \ 'percent': 'MyPercent',
    \ 'vimrcversion': 'MyVimrcVersion',
    \ 'vimversion': 'MyVimVersion',
    \ 'lineinfo': 'MyLineinfo',
    \ 'fileencodingandformat': 'MyFileencodingAndFormat',
    \ 'readonly': 'MyReadonly',
    \ 'modified': 'MyModified',
    \ 'fugitive': 'MyFugitive',
    \ 'filename': 'MyFilename',
    \ 'fileformat': 'MyFileformat',
    \ 'filetype': 'MyFiletype',
    \ 'expandtab': 'MyExpandtab',
    \ 'fileencoding': 'MyFileencoding',
    \ 'mode': 'MyMode',
    \ 'ctrlpmark': 'CtrlPMark',
    \ 'gitbranch': 'gitbranch#name',
    \ 'bufferbefore': 'lightline#buffer#bufferbefore',
    \ 'bufferafter': 'lightline#buffer#bufferafter',
    \ 'bufferinfo': 'lightline#buffer#bufferinfo',
    \ 'devmode': 'MyDevMode',
    \ },
  \ 'tab_component_function': {
    \ 'filename': 'MyTabFilename'
  \ },
  \ 'component_expand': {
    \ 'buffercurrent': 'lightline#buffer#buffercurrent2',
  \ },
  \ 'component_type': {
    \ 'buffercurrent': 'tabsel',
  \ },
  \ 'tabline': {
      \ 'left': [ [ 'bufferinfo' ], [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
      \ 'right': [ [ 'devmode', 'vimversion', 'vimrcversion'], [ 'time' ], ],
      \ },
\ }

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

" Special symbols are applied to lightline
" Purely cosmetic
if g:settings#powerline_symbols == 1
  let g:lightline.separator = {'left': "\ue0b0", 'right': "\ue0b2"}
  let g:lightline.subseparator = { 'left': "\ue0b1", 'right': "\ue0b3"}
  let g:lightline_buffer_expand_left_icon = '◀ '
  let g:lightline_buffer_expand_right_icon = ' ▶'
  " This is the Apple logo, which doesn't render the same on other OSs.
  " let g:lightline_buffer_logo = ' '
  let g:lightline_buffer_logo = "\u2630 "
  let g:lightline_buffer_readonly_icon = ''
  let g:lightline_buffer_modified_icon = '✭'
  let g:lightline_buffer_git_icon = ' '
else
  " let g:lightline.separator = {'left': "\ue0b0", 'right': "\ue0b2"}
  " let g:lightline.subseparator = { 'left': "\ue0b1", 'right': "\ue0b3"}
  " let g:lightline_buffer_expand_left_icon = '« '
  " let g:lightline_buffer_expand_right_icon = ' »'
  " let g:lightline_buffer_logo = ''
  let g:lightline_buffer_logo = "\u2630 "
  let g:lightline_buffer_readonly_icon = 'RO'
  let g:lightline_buffer_modified_icon = '*'
  let g:lightline_buffer_git_icon = '⎇ '
endif

" Set lightline color scheme
" Whether it is light or dark is determined in one package
"
if g:settings#colorscheme >= 3
  let g:lightline.colorscheme = 'onedark'
elseif g:settings#colorscheme >= 1
  let g:lightline.colorscheme = 'one'
endif

" }}}
" Functions {{{

" Amount of information shown depends on the size of the window.
"

function! MyPercent() abort
  return winwidth(0) > 35 || &filetype == 'nerdtree' ? line('.') * 100 / line('$') . '%' : ''
endfunction


" Displays current vimrc version. Used for tabline.
"
function! MyVimrcVersion() abort
  " return winwidth(0) > 50 ? 'vimrc ' . g:vimrc_version : ''
  return &columns > 50 ? 'vimrc ' . g:vimrc_version : ''
endfunction

" Modulo operator because Vim's default one is bad.
"
function! s:mod(n,m) abort
  return ((a:n % a:m) + a:m) %a:m
endfunction

" Displays the current Vim version. Used for tabline.
function! MyVimVersion() abort
  let v100 = v:version / 100
  let v10 = s:mod(v:version, 100)
  " return winwidth(0) > 60 ? 'vim ' . string(v100) . '.' . string(v10) : ''
  return &columns > 60 ? 'vim ' . string(v100) . '.' . string(v10) : ''
endfunction



" Describes the line and column number of the current cursor location.
"
function! MyLineinfo() abort
  if g:settings#powerline_symbols == 1
    let line_number = "\uE0A1 "
    " let col_number = "\uE0A3 "
    let col_number = ":"
  else
    let line_number = ''
    let col_number =  ':'
  endif
  return winwidth(0) > 40 || &filetype == 'nerdtree' ? line_number . line(".") . col_number . col(".") : ''
  " return winwidth(0) > 25 ? mark . line(".") . ":" . col(".") : ''
endfunction

" Combines file encoding and file format information
"
" utf-8[unix]
"
function! MyFileencodingAndFormat() abort
  return winwidth(0) > 79 ? MyFileencoding().'['.MyFileformat().']' : ''
endfunction
" Shows current time. Currently unused as it takes
" up too much space and the clock is synchronous (which is annoying.)
"
function! MyTime() abort
  let display_width = &columns
  " let display_width = winwidth(0)
  if display_width > 105
    return strftime('%c') " Day # Month Year Hour:Minute:Second AM/PM TimeZone
  elseif display_width > 90
    return strftime ('%X %Z') " Hour:Minute:Second AM/PM TimeZone
  elseif display_width > 85
    return strftime ('%H:%M') " Hour:Minute:Second
  else
    return ''
  endif
endfunction

" File name displays its path relative to wherever vim was opened.
"
" function! FilenameRelativePath() abort
"   return expand('%')
" endfunction

" Signifies that the current file is modified and now saved.
" + signifies file is modified
" - signifies not modifiable
"
function! MyModified() abort
  if g:settings#powerline_symbols == 1
    let modified_mark = "\u00b1"
    let not_modifiable_mark = ''
  else
    " let modified_mark = '+'
    let modified_mark = "\u00b1"
    let not_modifiable_mark = '-'
  endif
  return &filetype =~ 'help\|vimfiler\|gundo\|nerdtree' ? '' : &modified ? modified_mark : &modifiable
          \ ? '' : not_modifiable_mark
endfunction

" Displays if the file is read only.
"
function! MyReadonly() abort
  return &filetype !~? 'help\|vimfiler\|gundo\|nerdtree' && &readonly ? 'readonly' : ''
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

" Displays current file name.
"
function! MyFilename() abort
  " If filetype is nerdtree, or if in ControlP mode then don't show filename.
  "
  if &filetype == 'nerdtree' || expand('%:t') == 'ControlP'
    return ''
  endif
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
function! MyFugitive() abort
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &filetype !~? 'vimfiler' && exists('*fugitive#head')
      if g:settings#powerline_symbols == 1
        let git_symbol = ' '
      else
        " let git_symbol = '⎇ '
        let git_symbol = ''
      endif
      " let git_symbol = '⭠ ' " this was the default
      let _ = fugitive#head()
      return (strlen(_) && winwidth(0) > 60) ? git_symbol._ : ''
    endif
  catch
  endtry
  return ''
endfunction

" Displays whether soft tabs (spaces) or hard tabs (tabs) are being used, and
" the the tab width.
"
function! MyExpandtab() abort
  let window_width = winwidth(0)
  let spaces_marker = window_width > 79 ? ' spaces' : ' S'
  let tabs_marker = window_width > 79 ? ' tabs' : ' T'
  return window_width > 67 ? (&expandtab ? &softtabstop . spaces_marker : &tabstop. tabs_marker) : ''
endfunction

" File format (unix, dos, mac)
" Formatted as LF, CRLF, CR
"
function! MyFileformat() abort
  return winwidth(0) > 57 ? (&fileformat == 'unix' ? 'LF' : &fileformat == 'dos' ? 'CRLF' : 'CR') : ''
endfunction

" File type (java, python, vim)
"
function! MyFiletype() abort
  return winwidth(0) > 50 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

" File encoding (UTF-8)
"
function! MyFileencoding() abort
  return winwidth(0) > 77 ? (strlen(&fileencoding) ? &fileencoding : &encoding) : ''
 endfunction

" Set the mode name to plugin names when in respective plugin modes, notably
" for CtrlP and NERDTree.
"
function! MyMode() abort
  let file_name = expand('%:t')
  return file_name == '__Tagbar__' ? 'Tagbar' :
    \ file_name == 'ControlP' ? 'CtrlP' :
    \ file_name == '__Gundo__' ? 'Gundo' :
    \ file_name == '__Gundo_Preview__' ? 'Gundo Preview' :
    \ file_name =~ 'NERD_tree' ? 'NERDTree' :
    \ &filetype == 'unite' ? 'Unite' :
    \ &filetype == 'vimfiler' ? 'VimFiler' :
    \ &filetype == 'vimshell' ? 'VimShell' :
    \ winwidth(0) > 75 ? lightline#mode() : ''
endfunction

" Indicates in tabline if in dev mode
function! MyDevMode() abort
  return g:settings#dev_mode ? 'dev' : ''
endfunction

" Signifies currently in CtrlP search mode.
"
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
" listtrans {{{

" Toggles between a list and a bullet points.
nnoremap <silent> <Leader>tL :call ListTrans_toggle_format()<Return>
vnoremap <silent> <Leader>tL :call ListTrans_toggle_format('visual')<Return>

" }}}
" neocomplete {{{
" Repository: https://github.com/Shougo/neocomplete.vim

" Only enable at startup if Vim has lua support. Enabling without
" lua support spams an error message every frame.
"
if has('lua')
  let g:neocomplete#enable_at_startup = 1
endif

" First option is automatically selected.
" Eases <Return> completion.
"
let g:neocomplete#enable_auto_select = 1

" use smartcase
"
let g:neocomplete#enable_smart_case = 1

" Set minimum syntaxt keyword length
"
let g:neocomplete#sources#syntax#min_key_word_length = 3

" <Return>: completes currently selected option and closes popup.
"
inoremap <silent> <Return> <C-r>=<SID>MyReturnNeocompletion()<Return>
function! s:MyReturnNeocompletion()
  " return (pumvisible() ? "\<C-y>" : "" ) . "\<Return>"
  " For no inserting <Return> key.
  return pumvisible() ? "\<C-y>" : "\<Return>"
endfunction

" <TAB>: completion.
" Selects further options beyond initial one. Must press <Return> to actually
" finish completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-N>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-P>" : "\<C-d>"

" }}}
" nerdcommeter {{{
" Repository: https://github.com/scrooloose/nerdcommenter

" Add spaces after comment delimiters
"
let g:NERDSpaceDelims = 1

" Align line-wise comment delimiters flush left instead of following code
" indentation
"
let g:NERDDefaultAlign = 'left'

" NOTE: May need to remove one of these in the future for namespace.
" NOTE: tc currently hangs because it is overloaded with toggle cursor column
" (tcc) toggle cursor line (tcl), and toggle color column (tcw) commands.
" May need to rebind those in the future as they are not commonly used.
"
map <Leader>ct <plug>NERDCommenterToggle
map <Leader>tc <plug>NERDCommenterToggle
" For some reason, Vim registers <C-/> as <C-_>
map <C-_> <plug>NERDCommenterToggle

" }}}
" nerdtree {{{
" Repository: https://github.com/scrooloose/nerdtree

" Show hidden files by default (bound to I)
"
let NERDTreeShowHidden = 1

" autocmd VimEnter * NERDTree " tree is open on start
" autocmd VimEnter * wincmd p " cursor starts in main window and not NERDtree

" Atom keybinding
"
nnoremap <silent> <C-\> :NERDTreeToggle<Return>

" Toggle tree
"
nnoremap <silent> <Leader>tt :NERDTreeToggle<Return>

" File tree
"
nnoremap <silent> <Leader>ft :NERDTreeToggle<Return>

" }}}
" ultisnips {{{
" Repository: https://github.com/SirVer/ultisnips

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsExpandTrigger="<NUL>"
let g:ulti_expand_or_jump_res = 0
function! <SID>ExpandSnippetOrReturn()
  let snippet = UltiSnips#ExpandSnippetOrJump()
  if g:ulti_expand_or_jump_res > 0
    return snippet
  else
    return "\<Return>"
  endif
endfunction
inoremap <expr> <Return> pumvisible() ? "<C-R>=<SID>ExpandSnippetOrReturn()<Return>" : "\<Return>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" }}}
" victionary {{{
" Repository: https://github.com/EvanQuan/victionary

let g:victionary#map_defaults = 0
nmap <Leader>dw <Plug>(victionary#define_under_cursor)
nmap <Leader>dW <Plug>(victionary#define_prompt)
nmap <Leader>ds <Plug>(victionary#synonym_under_cursor)
nmap <Leader>dS <Plug>(victionary#synonym_prompt)

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
let g:closetag_close_shortcut = '<Leader>>'
" }}}
" vim-easy-align {{{
" Repository: https://github.com/junegunn/vim-easy-align

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" }}}
" vim-executioner {{{
" Repository: https://github.com/EvanQuan/vim-executioner

let g:executioner#extensions = {}
if g:settings#python3_execution == 0
  let g:executioner#extensions['py'] = 'python %'
elseif filereadable(expand($ANACONDA_PYTHON))
  let g:executioner#extensions['py'] = $ANACONDA_PYTHON . ' %'
else
  let g:executioner#extensions['py'] = 'python3 %'
endif

" Run current buffer
"
nnoremap <silent> <Leader>rf :Executioner<Return>
nnoremap <silent> <Leader>hrf :ExecutionerHorizontal<Return>
nnoremap <silent> <Leader>vrf :ExecutionerVertical<Return>

" Run current buffer with input redirected from input.txt
"
nnoremap <silent> <Leader>ri :Executioner % < input.txt<Return>
nnoremap <silent> <Leader>hri :ExecutionerHorizontalBuffer % < input.txt<Return>
nnoremap <silent> <Leader>vri :ExecutionerVerticalBuffer % < input.txt<Return>

" run.sh
"
nnoremap <silent> <Leader>rr :Executioner run.sh<Return>
nnoremap <silent> <Leader>hrr :ExecutionerHorizontal run.sh<Return>
nnoremap <silent> <Leader>vrr :ExecutionerVertical run.sh<Return>

" Makefile
"
nnoremap <silent> <Leader>rm :Executioner makefile<Return>
nnoremap <silent> <Leader>hrm :ExecutionerHorizontal makefile<Return>
nnoremap <silent> <Leader>vrm :ExecutionerVertical makefile<Return>

" }}}
" vim-gitgutter {{{
" Repository: https://github.com/airblade/vim-gitgutter

" Delay time of the diff markers updating as the file is edited
"
set updatetime=100 " [ms] Default: 4000

" Move to next/previous hunk
"
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

" Stage and undo hunks
"
nmap <Leader>ghs <Plug>GitGutterStageHunk
nmap <Leader>ghu <Plug>GitGutterUndoHunk


" }}}
" vim-instant-markdown {{{
" Repository: https://github.com/suan/vim-instant-markdown

" Don't open automatically
"
let g:instant_markdown_autostart = 0

" }}}
" vim-javacomplete2 {{{
" Repository: https://github.com/artur-shaik/vim-javacomplete2

if has('autocmd')
  autocmd FileType java setlocal omnifunc=javacomplete#Complete
endif

" Enable smart (trying to guess import option) inserting class imports with F4
" nnoremap <F4> <Plug>(JavaComplete-Imports-AddSmart)
" inoremap <F4> <Plug>(JavaComplete-Imports-AddSmart)
" To enable usual (will ask for import option) inserting class imports with F5
" nnoremap <F5> <Plug>(JavaComplete-Imports-Add)
" inoremap <F5> <Plug>(JavaComplete-Imports-Add)
" To add all missing imports with F6
" nnoremap <F6> <Plug>(JavaComplete-Imports-AddMissing)
" inoremap <F6> <Plug>(JavaComplete-Imports-AddMissing)
" To remove all missing imports with F7
" nnoremap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
" inoremap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)

" nnoremap <Leader>jI <Plug>(JavaComplete-Imports-AddMissing)
" nnoremap <Leader>jR <Plug>(JavaComplete-Imports-RemoveUnused)
" nnoremap <Leader>ji <Plug>(JavaComplete-Imports-AddSmart)
" nnoremap <Leader>jii <Plug>(JavaComplete-Imports-Add)

" inoremap <C-j>I <Plug>(JavaComplete-Imports-AddMissing)
" inoremap <C-j>R <Plug>(JavaComplete-Imports-RemoveUnused)
" inoremap <C-j>i <Plug>(JavaComplete-Imports-AddSmart)
" inoremap <C-j>ii <Plug>(JavaComplete-Imports-Add)

" nnoremap <Leader>jM <Plug>(JavaComplete-Generate-AbstractMethods)

" inoremap <C-j>jM <Plug>(JavaComplete-Generate-AbstractMethods)

" nnoremap <Leader>jA <Plug>(JavaComplete-Generate-Accessors)
" nnoremap <Leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
" nnoremap <Leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
" nnoremap <Leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)
" nnoremap <Leader>jts <Plug>(JavaComplete-Generate-ToString)
" nnoremap <Leader>jeq <Plug>(JavaComplete-Generate-EqualsAndHashCode)
" nnoremap <Leader>jc <Plug>(JavaComplete-Generate-Constructor)
" nnoremap <Leader>jcc <Plug>(JavaComplete-Generate-DefaultConstructor)

" inoremap <C-j>s <Plug>(JavaComplete-Generate-AccessorSetter)
" inoremap <C-j>g <Plug>(JavaComplete-Generate-AccessorGetter)
" inoremap <C-j>a <Plug>(JavaComplete-Generate-AccessorSetterGetter)

" vnoremap <Leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
" vnoremap <Leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
" vnoremap <Leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)

" nnoremap <silent> <buffer> <Leader>jn <Plug>(JavaComplete-Generate-NewClass)
" nnoremap <silent> <buffer> <Leader>jN <Plug>(JavaComplete-Generate-ClassInFile)

" }}}
" vim-leader-guide {{{
" Repository: https://github.com/hecal3/vim-leader-guide

" Define prefix dictionary
let g:lmap = {}

" Create new menus not based on existing mappings:
" clear highlighting {{{
"
let g:lmap[' '] = [':nohlsearch', 'Clear highlighting']

" }}}
" ale {{{

let g:lmap.a = {
                \'name' : 'ALE...',
                \ 'd' : ['ALEDetail', 'Detail'],
                \ 'g' : ['ALEGoToDefinition', 'Go to definition'],
                \ 'h' : ['ALEHover', 'Hover'],
                \ 'r' : ['ALEFindReferences', 'References'],
                \ 's' : ['ALEFixSuggest', 'Suggest fix'],
                \ 't' : ['ALEToggle', 'Toggle'],
                \}

" }}}
" comment {{{

let g:lmap.c = {
                \'name' : 'Comment...',
                \'$' : ['call feedkeys("\<plug>NERDCommenterToEOL")', 'To EOL'],
                \'A' : ['call feedkeys("\<plug>NERDCommenterAppend")', 'Append'],
                \'a' : ['call feedkeys("\<plug>NERDCommenterAltDelims")', 'Alternative delimiters'],
                \'b' : ['call feedkeys("\<plug>NERDCommenterAlignBoth")', 'Align both'],
                \'c' : ['call feedkeys("\<plug>NERDCommenterComment")', 'Comment'],
                \'i' : ['call feedkeys("\<plug>NERDCommenterInvert")', 'Invert'],
                \'l' : ['call feedkeys("\<plug>NERDCommenterAlignLeft")', 'Align left'],
                \'m' : ['call feedkeys("\<plug>NERDCommenterMinimal")', 'Minimal'],
                \'n' : ['call feedkeys("\<plug>NERDCommenterNested")', 'Nested'],
                \'s' : ['call feedkeys("\<plug>NERDCommenterSexy")', 'Sexy'],
                \'t' : ['call feedkeys("\<plug>NERDCommenterToggle")', 'Toggle'],
                \'u' : ['call feedkeys("\<plug>NERDCommenterUncomment")', 'Uncomment'],
                \'y' : ['call feedkeys("\<plug>NERDCommenterYank")', 'Yank'],
                \}

" }}}
" define {{{

let g:lmap.d = {
                \'name' : 'Define...',
                \'w' : ['call feedkeys("\<Plug>(victionary#define_under_cursor)")', 'Word'],
                \'s' : ['call feedkeys("\<Plug>(victionary#synonym_under_cursor)")', 'Synonym'],
                \'W' : ['call feedkeys("\<Plug>(victionary#define_prompt)")', 'Word prompt'],
                \'S' : ['call feedkeys("\<Plug>(victionary#synonym_prompt)")', 'Synonym prompt'],
                \}

" }}}
" edit {{{

let g:lmap.e = {
                \'name' : 'Edit...',
                \'b' : ['edit ~/.bashrc', 'bashrc'],
                \'g' : ['edit $MYGVIMRC', 'gvimrc'],
                \'m' : ['edit makefile', 'makefile'],
                \'n' : ['edit $MYNOTES', 'Notes'],
                \'q' : ['edit $MYQVIMDOC', 'qvim help'],
                \'R' : ['edit README.md', 'README.md'],
                \'r' : ['edit run.sh', 'run.sh'],
                \'s' : ['edit $MYSETTINGS', 'settings.vim'],
                \'S' : ['edit $MYSETTINGSTEMPLATE', 'settings.vim template'],
                \'t' : ['edit ~/.tmux.conf', 'Tmux config'],
                \'v' : ['edit $MYVIMRC', 'vimrc'],
                \'w' : ['edit $MYWINDOWSVIMRC', 'Windows vimrc'],
                \'W' : ['edit $MYWINDOWSVIMRCTEMPLATE', 'Windows vimrc template'],
                \}

" }}}
" Fold method {{{

" TODO should be be replaced by something else? This doesn't get used.
let g:lmap.F = {
                \'name' : 'Fold method...',
                \'d' : ['set fdm=diff', 'Diff'],
                \'f' : ['set fdm=manual', 'Manual'],
                \'i' : ['set fdm=indent', 'Indentation'],
                \'m' : ['set fdm=marker', 'Marker'],
                \'s' : ['set fdm=syntax', 'Syntax'],
                \}

" }}}
" file {{{

let g:lmap.f = {
                \'name' : 'File...',
                \'d' : ['!make', 'Diff'],
                \'f' : ['CtrlP', 'Find'],
                \'t' : ['NERDTreeToggle', 'Tree'],
                \}

" }}}
" git {{{

let g:lmap.g = {
                \'name' : 'Git...',
                \'a' : ['Git add .', 'Add all'],
                \'b' : ['Gblame', 'Blame'],
                \'c' : ['Gcommit', 'Commit'],
                \'d' : ['Gdiff', 'Diff'],
                \'e' : ['Git config -e', 'Edit config'],
                \'g' : ['Git config --global -e', 'Edit global config'],
                \'h' : {
                        \'name' : 'Hunk',
                        \'s' : ['call feedkeys("\<plug>iGitGutterStageHunk")', 'Stage'],
                        \'u' : ['call feedkeys("\<plug>iGitGutterUndoHunk")', 'Undo'],
                        \},
                \'l' : ['Git log', 'Log'],
                \'u' : ['Gpull',   'Pull'],
                \'p' : ['Gpush',   'Push'],
                \'s' : ['Gstatus', 'Status'],
                \'w' : ['Gwrite',  'Write'],
                \'x' : ['Gbrowse', 'Browse on Github'],
                \}

" }}}
" horizontal {{{

let g:lmap.h = {
                \'name' : 'Horizontal...',
                \'s' : ['call HorizontalSplit()', 'Split window'],
                \'t' : ['terminal', 'Split Terminal'],
                \'e' : {
                        \'name' : 'Edit...',
                        \'b' : ['split ~/.bashrc', 'bashrc'],
                        \'g' : ['split $MYGVIMRC', 'gvimrc'],
                        \'i' : ['split input.txt', 'input.txt'],
                        \'m' : ['split makefile', 'makefile'],
                        \'n' : ['split $MYNOTES', 'Notes'],
                        \'o' : ['split output.txt', 'output.txt'],
                        \'q' : ['split $MYQVIMDOC', 'qvim help'],
                        \'R' : ['split README.md', 'README.md'],
                        \'r' : ['split run.sh', 'run.sh'],
                        \'s' : ['split $MYSETTINGS', 'settings.vim'],
                        \'S' : ['split $MYSETTINGSTEMPLATE', 'settings.vim template'],
                        \'t' : ['split ~/.tmux.conf', 'Tmux config'],
                        \'v' : ['split $MYVIMRC', 'vimrc'],
                        \'w' : ['split $MYWINDOWSVIMRC', 'Windows vimrc'],
                        \'W' : ['split $MYWINDOWSVIMRCTEMPLATE', 'Windows vimrc template'],
                        \},
                \'r' : {
                        \'name' : 'Run...',
                        \'f' : ['ExecutionerHorizontal', 'File'],
                        \'i' : ['ExecutionerHorizontalBuffer % < input.txt', 'File with input.txt'],
                        \'m' : ['ExecutionerHorizontal makefile', 'makefile'],
                        \'r' : ['ExecutionerHorizontal run.sh', 'run.sh'],
                        \},
                \}

" }}}
" jedi {{{

let g:lmap.j = {
                \'name' : 'Jedi...',
                \'a' : ['call jedi#goto_assignments()', 'Assignment'],
                \'d' : ['call jedi#goto()', 'Definition'],
                \'r' : ['call jedi#rename()', 'Rename'],
                \'u' : ['call jedi#usages()', 'Usages'],
                \}

" }}}
" math {{{

" TODO Figure out how to have it work for both normal and visual mode
let g:lmap.m = {
                \'name' : 'Math...',
                \'a' : ['call feedkeys("\<Plug>(vmath_plus#normal_analyze)")', 'Analyze'],
                \'b' : {
                        \ 'name' : 'Buffer...',
                        \ 'a' : ['call feedkeys("\<Plug>(vmath_plus#normal_analyze_buffer)")', 'Analyze'],
                        \ 'r' : ['call feedkeys("\<Plug>(vmath_plus#report_buffer)")', 'Report'],
                        \},
                \'r' : ['call feedkeys("\<Plug>(vmath_plus#report)")', 'Report'],
                \}

" }}}
" open {{{

let g:lmap.o = {
                \'name' : 'Open...',
                \'b' : ['shell', 'Bash shell'],
                \'t' : ['tabe', 'New Tab'],
                \}

" }}}
" Plugin {{{

let g:lmap.P = {
                \ 'name' : 'Plugin...',
                \ 'c' : ['PlugClean', 'Clean'],
                \ 'd' : ['PlugDiff', 'Diff'],
                \ 'g' : ['PlugUpgrade', 'Upgrade'],
                \ 'i' : ['PlugInstall', 'Install'],
                \ 'n' : ['PlugSnapshot', 'Snapshot'],
                \ 's' : ['PlugStatus', 'Status'],
                \ 'u' : ['PlugUpdate', 'Update'],
                \}

" }}}
" paste {{{

let g:lmap.p = {
                \'name' : 'Paste...',
                \'a' : {
                        \'name' : 'Around...',
                        \'"' : ["normal \"_da\"P", 'Double quotes'],
                        \"'" : ["normal \"_da'P", 'Single quotes'],
                        \'Q' : ["normal \"_da'P", 'Single quotes'],
                        \'q' : ["normal \"_da\"P", 'Double quotes'],
                        \'w' : ["normal \"_dawP", 'Word'],
                        \},
                \'c' : ["normal \"+p", 'Clipboard'],
                \'i' : {
                        \'name' : 'In...',
                        \'"' : ["normal \"_di\"P", 'Double quotes'],
                        \"'" : ["normal \"_di'P", 'Single quotes'],
                        \"(" : ["normal \"_di(P", 'Parentheses'],
                        \")" : ["normal \"_di)P", 'Parentheses'],
                        \"<" : ["normal \"_di)P", '<'],
                        \">" : ["normal \"_di)P", '>'],
                        \"[" : ["normal \"_di)P", 'Brackets'],
                        \"]" : ["normal \"_di)P", 'Brackets'],
                        \"{" : ["normal \"_di)P", 'Braces'],
                        \"}" : ["normal \"_di)P", 'Braces'],
                        \"B" : ["normal \"_di}P", 'Braces'],
                        \"b" : ["normal \"_di)P", 'Parentheses'],
                        \"l" : ["normal \"_ddP", 'Line'],
                        \'Q' : ["normal \"_di'P", 'Single quotes'],
                        \'q' : ["normal \"_di\"P", 'Double quotes'],
                        \'t' : ["normal \"_ditP", 'Tag'],
                        \'w' : ["normal \"_diwP", 'Word'],
                        \},
                \}

" }}}
" quit {{{

" TODO make into commands instead of leader mappings due to same mneumonic
let g:lmap.q = {
                \'name' : 'Quit...',
                \'b' : ['call QuitCurrentBuffer()', 'Buffer'],
                \'h' : ['call QuitHiddenBuffers()', 'Hidden buffers'],
                \'t' : ['tabclose', 'Tab'],
                \'w' : ['x', 'Window'],
                \}

" }}}
" Reload {{{

let g:lmap.R = {
                \'name' : 'Reload...',
                \'h' : ["execute 'colo' colors_name<Return>:syntax sync fromstart", 'Syntax highlighting'],
                \'v' : ['source $MYVIMRC', 'vimrc'],
                \'t' : ['retab', 'Tabs'],
                \}

" }}}
" run {{{

let g:lmap.r = {
                \'name' : 'Run...',
                \'f' : ["Executioner", 'File'],
                \'i' : ['Executioner % < input.txt', 'File with input.txt'],
                \'m' : ['Executioner makefile', 'makefile'],
                \'r' : ['Executioner run.sh', 'run.sh'],
                \}

" }}}
" substitute {{{

let g:lmap.s = {
                \'name' : 'Substitute...',
                \'g' : {
                        \'name' : 'Globally in...',
                        \'f' : ['call feedkeys(":%s//g\<Left>\<Left>")', 'File'],
                        \'l' : ['call feedkeys(":s//g\<Left>\<Left>")', 'Line'],
                        \},
                \'f' : {
                        \'name' : 'First in...',
                        \'f' : ['call feedkeys(":%s//\<Left>")', 'File'],
                        \'l' : ['call feedkeys(":s//\<Left>")', 'Line'],
                        \},
                \'s' : ['normal z=', 'Spellcheck fix'],
                \}

" }}}
" Tab {{{

let g:lmap.T = {
                \'name' : 'Tab...',
                \ 'f' : ['tabfirst', 'first'],
                \ 'l' : ['tablast', 'last'],
                \ '1' : ['1gt', '1'],
                \ '2' : ['2gt', '2'],
                \ '3' : ['3gt', '3'],
                \ '4' : ['4gt', '4'],
                \ '5' : ['5gt', '5'],
                \ '6' : ['6gt', '6'],
                \ '7' : ['7gt', '7'],
                \ '8' : ['8gt', '8'],
                \ '9' : ['9gt', '9'],
                \}

" }}}
" toggle {{{

let g:lmap.t = {
                \'name' : 'Toggle...',
                \'a' : ['ALEToggle', 'ALE linting'],
                \'c' : ['call feedkeys("\<plug>NERDCommenterToggle")', 'Comment'],
                \'d' : ["Goyo", 'Distraction-free'],
                \'f' : ["normal \<C-^>", 'File'],
                \'h' : {
                        \'name' : 'Highlight...',
                        \'c' : ['call ToggleCursorColumn()', 'Column'],
                        \'l' : ['call ToggleCursorLine()', 'Line'],
                        \'w' : ['call ToggleColorColumn()', 'Width indicator'],
                        \},
                \'i' : ['call ToggleTabs()', 'Identation'],
                \'L' : ['call ListTrans_toggle_format()', 'List'],
                \'l' : ['call ToggleLineNumbers()', 'Line numbers'],
                \'p' : ['call TogglePasteMode()', 'Paste mode'],
                \'r' : ['call ToggleRelativeLineNumbers()', 'Relative line numbers'],
                \'s' : ['call ToggleSpellcheck()', 'Spellcheck'],
                \'t' : ['NERDTreeToggle', 'Tree'],
                \'w' : ['call ToggleWhitespace()', 'Whitespace'],
                \'W' : ['ToggleWorkspace', 'Workspace'],
                \}

" }}}
" underline {{{

let g:lmap.u = {
                \'name': 'Underline...',
                \'-' : ['normal yypVr-j', 'Dashes'],
                \'=' : ['normal yypVr=j', 'Equal signs'],
                \}

" }}}
" vertical {{{

let g:lmap.v = {
                \'name' : 'Vertical...',
                \'s' : ['call VerticalSplit()', 'Split window'],
                \'t' : ['vertical terminal', 'Split Terminal'],
                \'e' : {
                        \'name' : 'Edit...',
                        \'b' : ['vsplit ~/.bashrc', 'bashrc'],
                        \'g' : ['vsplit $MYGVIMRC', 'gvimrc'],
                        \'i' : ['vsplit input.txt', 'input.txt'],
                        \'m' : ['vsplit makefile', 'makefile'],
                        \'n' : ['vsplit $MYNOTES', 'Notes'],
                        \'o' : ['vsplit output.txt', 'output.txt'],
                        \'q' : ['vsplit $MYQVIMDOC', 'qvim help'],
                        \'R' : ['vsplit README.md', 'README.md'],
                        \'r' : ['vsplit run.sh', 'run.sh'],
                        \'s' : ['vsplit $MYSETTINGS', 'settings.vim'],
                        \'S' : ['vsplit $MYSETTINGSTEMPLATE', 'settings.vim template'],
                        \'t' : ['vsplit ~/.tmux.conf', 'Tmux config'],
                        \'v' : ['vsplit $MYVIMRC', 'vimrc'],
                        \'w' : ['vsplit $MYWINDOWSVIMRC', 'Windows vimrc'],
                        \'W' : ['vsplit $MYWINDOWSVIMRCTEMPLATE', 'Windows vimrc template'],
                        \},
                \'r' : {
                        \'name' : 'Run...',
                        \'f' : ["ExecutionerVertical", 'File'],
                        \'i' : ['ExecutionerVerticalBuffer % < input.txt', 'File with input.txt'],
                        \'m' : ['ExecutionerVertical makefile', 'makefile'],
                        \'r' : ['ExecutionerVertical run.sh', 'run.sh'],
                        \},
                \}

" }}}
" window {{{

let g:lmap.w = {
                \ 'name' : 'Window...',
                \ 'h' : ["normal \<C-w>h", 'Left'],
                \ 'j' : ["normal \<C-w>j", 'Down'],
                \ 'k' : ["normal \<C-w>k", 'Up'],
                \ 'l' : ["normal \<C-w>l", 'Right'],
                \ 'q' : ["x", 'Quit'],
                \ 's' : ["normal \<C-w>s", 'Horizontal split'],
                \ 'v' : ["normal \<C-w>v", 'Vertical split'],
                \}

" }}}
" yank {{{

let g:lmap.y = [ "call feedkeys(\"\\\"+y\")", "Yank to clipboard" ]

" }}}
" let g:lmap.['/'][1] = 'Search next word'

" Bind leader key <Space> to open leader guide prompt
"
call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
nnoremap <silent> <Leader> :<c-u>LeaderGuide '<Space>'<Return>
vnoremap <silent> <Leader> :<c-u>LeaderGuideVisual '<Space>'<Return>

" }}}
" vim-plug {{{
" Repository: https://github.com/junegunn/vim-plug

noremap <Leader>Pc :PlugClean<Return>
noremap <Leader>Pi :PlugInstall<Return>
noremap <Leader>Pd :PlugDiff<Return>
noremap <Leader>Pn :PlugSnapshot<Return>
noremap <Leader>Ps :PlugStatus<Return>
noremap <Leader>Pu :PlugUpdate<Return>
noremap <Leader>Pg :PlugUpgrade<Return>

" }}}
" vim-polyglot {{{
" Repository: https://github.com/sheerun/vim-polyglot

" These language plugins have syntax concealing, which is extremely annoying.
" indentLine conflicts with this, as it automatically sets conceallevel=2
" To resolve this, indentLine takes precidence.
"
let g:polyglot_disabled = ['markdown', 'latex']

" }}}
" vim-togglecursor {{{
" Repository: https://github.com/jszakmeister/vim-togglecursor

" Cursor changes shapes with each mode. Cursor blinking is also disabled.
"
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

" }}}
" vim-workspace {{{
" Repository: https://github.com/thaerkh/vim-workspace

" Set if workspace automatically writes to file with every edit
"
let g:workspace_autosave_always = 0

" Toggle enable/disable workspace
nnoremap <Leader>tW :ToggleWorkspace<Return>

" }}}
" vmath-plus {{{
" Repository: https://github.com/EvanQuan/vmath-plus

" Calculates math stuff based on visual selection.

" Analyze
"
nmap <Leader>ma <Plug>(vmath_plus#normal_analyze)
nmap <Leader>mba <Plug>(vmath_plus#normal_analyze_buffer)
xmap <Leader>ma <Plug>(vmath_plus#visual_analyze)
xmap <Leader>mba <Plug>(vmath_plus#visual_analyze_buffer)

" Report
"
nmap <Leader>mr <Plug>(vmath_plus#report)
nmap <Leader>mbr <Plug>(vmath_plus#report_buffer)

" }}}

" }}}
" User Interface {{{

" Alerts {{{

" Disable audio and visualbell alerts entirely when scrolling beyond file lines
" or pressing escape in normal mode
"
set noerrorbells visualbell t_vb=

" }}}
" Cursor {{{

" Scrolling {{{

" Determines the number of context lines you want to see above and below the
" cursor. Helpful for scrolling.
"
set scrolloff=5

" }}}
" Color {{{

if g:settings#cursor_color
  if g:settings#cursor_color == 1 " Blue
    silent !echo -ne "\033]12;rgb:61/af/ef\x7\007"
  elseif g:settings#cursor_color == 2 " Green
    silent !echo -ne "\033]12;rgb:98/c3/79\x7\007"
  elseif g:settings#cursor_color == 3 " Red
    silent !echo -ne "\033]12;rgb:e0/6c/75\x7\007"
  endif
  " Reset cursor to original when vim exits
  if has('autocmd')
    autocmd VimLeave * silent !echo -ne "\033]112\007"
  endif
endif
" TODO: Cursor changes color depending on the mode
" These get overridden by vim-togglecursor settings
" Can be done by changing vim-togglecursor plugin
" Find a work around that does not alter vim-togglecursor plugin
" INSERT mode - blue
" let &t_SI =+ "\<Esc>]12;rgb:61/af/ef\x7"
" REPLACE mode - red
" let &t_SR =+ "\<Esc>]12;rgb:e0/6c/75\x7"
" NORMAL and VISUAL modes - green
" let &t_EI =+ "\<Esc>]12;rgb:98/c3/79\x7"

" }}}
" Visibility {{{

if g:settings#highlight_cursor_line
  set cursorline
endif

if g:settings#highlight_cursor_column
  set cursorcolumn
endif

set concealcursor=

" }}}

" }}}
" Encoding {{{

" Sets the character encoding used inside Vim. It applies to text in the
" buffers, register, String in expressions, text stored in the viminfo file
" etc.
set encoding=utf-8

" Sets the character encoding for the file of this buffer. When 'fileencoding'
" is different from 'encoding', conversion will be done when writing the file.
"
set fileencoding=utf-8

" This is a list of character encoding considered when starting to edit an
" existing file.
"
set fileencodings=utf-8

" Specify the character encoding used in the script. The following lines will
" be converted from [encoding] to the value of the 'encoding' option if they
" are different.
"
scriptencoding utf-8

" }}}
" Line Numbers {{{

if g:settings#line_numbers
  " Print the line number in front of each line.
  "
  set number
  " Changes the displayed number to relative to the cursor.
  "
  if g:settings#line_numbers == 2
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

" Set status line display.
" This is redundant with lightline but is a nice backup if lightline fails.
"
set statusline+=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" Ruler is displayed on the right side of the status line at the bottom of the
" window. It displays the line number, the column number, and the relative
" position of the cursor in the file (as a percent)
"
" This is redundant as lightline shows all this information anyways, but is
" enabled in case lightline is not working.
"
set ruler

" Status line displays the current mode, file name, file status, ruler etc.
" Current unnecessary with lightline, but is useful when lightline is
" disabled.
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
" If lightline is disabled, then show it.
set noshowmode

" }}}
" Text Wrapping {{{

if g:settings#wrap
  set wrap
  if g:settings#wrap == 1 " soft wrap
    set linebreak " line breaks only occur when the user explicitly makes them
    set textwidth=0 " disable text width limit
  elseif g:settings#wrap == 2 " hard wrap
    set nolist " Disable linebreak if it is enabled
    execute "set textwidth=".g:settings#wrap_width
  endif
else
  set nowrap
  set textwidth=0
endif

if g:settings#highlight_width_indicator
  " settings#wrap_width is visualized as highlighted column
  set colorcolumn=+1
  " execute "set colorcolumn=".(g:settings#wrap_width+1)
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

" Visualize whitespace characters.
" NOTE: Non-trailing spaces are not shown to reduce visual noise.
" Also, visual indicators are not needed because tabs are already visualized
" to distinguish them.
"
if g:settings#whitespace == 2
  set listchars=tab:»\ ,trail:·,extends:>,precedes:<,nbsp:‡
  " set listchars=tab:»\ ,eol:¬,trail:·,extends:>,precedes:<,nbsp:‡
else
  set listchars=tab:»\ ,eol:¬,trail:␣,extends:>,precedes:<,space:·,nbsp:‡
endif

" Highlight trailing whitespace characters for increased visibility
"
match ErrorMsg '\s\+$'

" Only show whitespace if enabled
"
if g:settings#whitespace
  set list
endif

" }}}

" }}}
" Utility {{{

" Autocomplete {{{

" Visual autocomplete for command menu
" Use tab to autocomplete
"
" TODO are both of these necessary?
"
set wildmenu
set wildmode=longest,list,full

" }}}
" Buffer {{{

" Allow buffer switching without saving
set hidden

" }}}
" Editing {{{

" Use one space, not two, after punctuation.
"
set nojoinspaces

" Square up visual selection
"
set virtualedit=block

" Add some more matchpairs for better % use.
"
set matchpairs=(:),{:},[:],<:>,«:»,｢:｣

" }}}
" File {{{

" When a file has been detected to have been changed outside of Vim and it
" has not been changed inside of Vim, automatically read it again.
"
set autoread

" Swap files are not created when opening a new buffer.
"
set noswapfile

" This gives the <EOL> of the current buffer, which is used for
" reading/writing the buffer from/to a file.
"
set fileformat=unix

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
" Splitting {{{

" Splitting a window will put the new window below the current one.
"
set splitbelow

" Splitting a window will put the new window right of the current one.
"
set splitright

" Always use vertical diffs
"
set diffopt+=vertical

" }}}

" }}}
