" ============================================================================
" Name:       settings.vim
" Maintainer: https://github.com/EvanQuan/.vim/
" Version:    1.7.0
"
" Setting values affect vimrc.vim configuration.
"
" Press SPACE to toggle category folding/unfolding
" ============================================================================

" Easy Mode {{{
"   Optimizes certain settings if you are going to use Vim non-modally.
"   It is recommended to enable this if you are running eVim.
"   0: Disabled
"     Vim works modally as normal
"   1: Enabled
"     Hard mode is disabled
"     Default mode is insert mode
" }}}
let g:easy_mode = 0
" True Color (24-bit) {{{
"   Many terminals don't support True color and will screw up the color
"   schemes if it is enabled.
"   0: Disabled
"     Color scheme will work but the colors may appear slightly different
"     from its intended appearance.
"   1: Enabled
"     Color scheme will appear as it should
" }}}
let g:truecolor_enabled = 1
" Powerline {{{
"   If powerline fonts are not installed on device, unicode characters for
"   lightline will not render correctly. Disable to have default lightline
"   separators and supseparators.
"   0: Disabled
"   1: Enabled
" }}}
let g:special_symbols_enabled = 0
" Color Scheme {{{
"   Affects overall color scheme and lightline color scheme
"   0: None
"   1: One Dark
"   2: One Light
"   3: One Dark Alternative
" }}}
let g:colorscheme_type = 1
" Text Wrap {{{
"   0: No wrap
"   1: Soft wrap
"     Visually moves text to the next line once it reaches the end of window.
"   2: Hard wrap
"     Moves text to the next line once it reaches wrap_width columns.
"     Column at wrap_width is highlighted.
" }}}
let g:wrap_enabled = 1
" Text Wrap Width {{{
"   The number of columns for hard wrapping and highlighted column
" }}}
let g:wrap_width = 79
" Show Whitespace {{{
"   Render placeholders for invivisble characters, such as tabs, spaces and
"   newlines
"   0: Off by default
"   1: On by default
" }}}
let g:show_whitespace = 1
" Disable Cursor Blinking {{{
"   0: Default
"       Cursor blinking is set to whatever is set on your machine.
"   1: Disabled
"       Cursor blinking is disabled and will always show.
" }}}
let g:cursor_blinking_disabled = 1
" Cursor color {{{
"   On some terminals, cursor color can be changed.
"   0: Default
"     Cursor color is unchanged.
"   1: Blue
"   2: Green
"   3: Red
" }}}
let g:cursor_color = 1
" Escape Alternative {{{
"   Optimally, CAPSLOCK and ESCAPE should be swapped, but when that cannot be
"   done, this provides a lazy alternative.
"   0: Disabled
"   1: Sets "aa" as ESCAPE in INSERT, REPLACE and VISUAL modes
" }}}
let g:escape_alternative_enabled = 0
" Line Numbers {{{
"   Relative line numbers work well with Vim movment commands, but can can
"   scroll lag on some devices. Consider swapping to absolute line numbers if
"   performance issues arise from relative line numbers.
"   0: Disabled
"   1: Absolute
"   2: Relative
" }}}
let g:line_numbers = 2
" Settings Organization {{{

" Folds everything by default in settings only.
" Folds are determined by {{{}}} markers

" Set modelines to parse to 1
" This is normally dangerous to do for security reasons, but is necessary for
" organizational folding for this file
" Google "vim modeline vulnerability"
"
set modelines=1

" }}}
" vim:foldmethod=marker:foldlevel=0
