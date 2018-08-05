" ============================================================================
" File:       gvimrc
" Maintainer: https://github.com/EvanQuan/.vim/
" Version:    1.0.2
"
" Contains optional runtime configuration settings to initialize GUI Vim when
" it starts. For Vim versions before 7.4, this should be linked to the
" ~/.gvimrc file as described in the README.md file. Later versions
" automatically detect this as the 2nd user gvimrc file.
" ============================================================================
"
if has('win32') || has('win32')
  " Window's gVim default font is ugly.
  " set guifont=Consolas:h10
  set guifont=Consolas:h13
elseif has('gui_macvim')
  " MacVim cannot have its font changed directly. This enabled powerline fonts
  " for it.
  set guifont=Meslo_LG_M_for_Powerline:h12
endif
