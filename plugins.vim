" ============================================================================
" File:       plugins.vim
" Maintainer: https://github.com/EvanQuan/qvim/
" Version:    0.2.0
"
" Contains all plugins, managed with vim-plug.
"
"     :help qvim
"
" Press \ or za to toggle category folding/unfolding.
" ============================================================================

" Use Vim settings, rather than  Vi settings.
" This must be first because it changes other options as a side effect.
"
if $compatible
  set nocompatible
endif

let g:has_async = v:version >= 800 || has('nvim')

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
if has_python && has('job') && has('timers') && has('lambda')
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
if has_python
  Plug 'SirVer/ultisnips'
endif
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
Plug 'PProvost/vim-ps1', { 'for' : 'ps1' }

" }}}
" Linting {{{

if g:has_async
  Plug 'w0rp/ale'
endif
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
" Plug 'davidhalter/jedi-vim'
" Plug 'python-mode/python-mode', { 'branch': 'develop' , 'for': 'python'}

" }}}
" Programming {{{

Plug 'EvanQuan/vim-executioner'
Plug 'tpope/vim-classpath'

" }}}
" User Interface {{{

Plug 'junegunn/goyo.vim'
Plug 'Yggdroot/indentLine'
Plug 'taohexxx/lightline-buffer'
Plug 'itchyny/lightline.vim'
Plug 'unblevable/quick-scope'
Plug 'hecal3/vim-leader-guide'
Plug 'tpope/vim-sleuth'
" Plug 'jszakmeister/vim-togglecursor'
Plug 'EvanQuan/vim-togglecursor'
Plug 'mhinz/vim-startify'
if g:settings#nerdfont_symbols
  Plug 'ryanoasis/vim-devicons'
endif

" Causes lag, so not enabled
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" }}}
" Version Control {{{

Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'itchyny/vim-gitbranch'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb'

" }}}
" Dev {{{

if g:settings#dev_mode == 1
  Plug 'EvanQuan/vim-AAAAAAAAAAAAAA'
  Plug 'EvanQuan/vim-dna-sharp'
  Plug 'EvanQuan/vim-chef'
  Plug 'EvanQuan/vim-scene'
  Plug 'EvanQuan/vim-tree'
  Plug 'EvanQuan/vim-verbose'
  Plug 'junegunn/vader.vim'
  Plug 'EvanQuan/vim-pizza'
elseif g:settings#dev_mode == 2
  Plug 'EvanQuan/vim-indent-with-semicolons'
endif

" }}}
call plug#end()

