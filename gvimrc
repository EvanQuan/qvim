" In my 
if has('win32') || has('win32')
  " Window's gVim default font is ugly.
  " set guifont=Consolas:h10
  set guifont=Consolas:h13
elseif has('gui_macvim')
  " MacVim cannot have its font changed directly. This enabled powerline fonts
  " for it.
  set guifont=Meslo_LG_M_for_Powerline:h14
endif
