" ============================================================================
" File:       gvimrc
" Maintainer: https://github.com/EvanQuan/qvim/
" Version:    1.0.6
"
" Contains optional runtime configuration settings to initialize GUI Vim when
" it starts. For Vim versions before 7.4, this should be linked to the
" ~/.gvimrc file as described in the README.md file. Later versions
" automatically detect this as the 2nd user gvimrc file.
"
" Press ENTER or za to toggle category folding/unfolding.
" ============================================================================

" Fonts fall back to next on list if not available.
"
set guifont=Iosevka:h12,Meslo_LG_M_for_Powerline:h12,Consolas:h12

" For Wind32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
if has('win32')
  set guioptions-=t
endif

" No scroll bars
"
set guioptions = " No scroll bars

" Disable all cursor blinking
set guicursor+=a:blinkon0

" CTRL-F is the search and replace dialog,
" but in console, it might be backspace, so don't map it there
"
" TODO what C-H?
nnoremap <C-F> :promptrepl\<Return>
inoremap <C-F> <C-\><C-O>:promptrepl<Return>
cnoremap <C-F> <C-\><C-C>:promptrepl<Return>

" Disable audio and visualbell alerts entirely when scrolling beyond file lines
" or pressing escape in normal mode
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif
