" ============================================================================
" File:       .gvimrc
" Maintainer: https://github.com/EvanQuan/.vim/
" Version:    0.1.0
"
" Contains optional runtime configuration settings to initialize GUIVim when
" it starts.
"
" Press SPACE to toggle category folding/unfolding.
" ============================================================================

" Appearance {{{

" Font {{{

" Lightline needs powerline fonts to work correctly. While this can be easily
" set manually for terminals, configuring GUI fonts is a bit more difficult,
" and can be done here.
"
if has('gui_macvim')
  " MacVim cannot have its font changed directly. This enabled powerline fonts
  " for it.
  set guifont=Meslo_LG_M_for_Powerline:h14
elseif has('win32') || has('win64')
  " NOTE: gVim and terminal on Windows seems to be restricted to a select few
  " predefined fonts, even if more fonts are installed. This makes powerline
  " fonts on  Windows not possible.
  " Git Bash for Windows does not consider itself be windows, so
  " g:special_symbols_enabled must be manually disabled in settings.
  set guifont=Consolas:h13
endif

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
