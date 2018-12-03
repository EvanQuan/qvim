" ============================================================================
" File:       gvimrc
" Maintainer: https://github.com/EvanQuan/.vim/
" Version:    1.0.5
"
" Contains optional runtime configuration settings to initialize GUI Vim when
" it starts. For Vim versions before 7.4, this should be linked to the
" ~/.gvimrc file as described in the README.md file. Later versions
" automatically detect this as the 2nd user gvimrc file.
"
" Press ENTER or za to toggle category folding/unfolding.
" ============================================================================
" Font {{{

" Lightline needs powerline fonts to work correctly. While this can be easily
" set manually for terminals, configuring GUI fonts is a bit more difficult,
" and can be done here.
"
if has('win32') || has('win64')
  " Window's gVim default font is ugly.
  " NOTE: gVim and terminal on Windows seems to be restricted to a select few
  " predefined fonts, even if more fonts are installed. This makes powerline
  " fonts on  Windows not possible. As a result, Consolas is chosen by
  " default.
  " Git Bash for Windows does not consider itself be windows, so
  " g:special_symbols_enabled must be manually disabled in settings.
  set guifont=Consolas:h13
elseif has('gui_macvim')
  " MacVim cannot have its font changed directly. This enabled powerline fonts
  " for it.
  set guifont=Meslo_LG_M_for_Powerline:h12
endif

" }}}
