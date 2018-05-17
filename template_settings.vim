" ============================================================================
" Name: settings.vim
" Maintainer: https://github.com/EvanQuan/.vim/
" Version: 1.1.0
"
" Setting values affect vimrc configuration.
" ============================================================================

" True color (24-bit)
"   Many terminals don't support True color and will screw up some color
"   schemes if it is enabled.
"   If disabled, color schemes will work but the colors may appear slightly
"   different from what they should be.
let g:truecolor_enabled = 1
" Powerline
"   If powerline fonts are not installed on device, unicode characters for
"   lightline will not render correctly. Disable to have default lightline
"   separators and supseparators.
let g:special_symbols_enabled = 1
" Color scheme
"   Affects overall color scheme and lightline color scheme
"   0: Default
"   1: One Dark
"   2: Solarized
let g:colorscheme_type = 1
" Text wrap
"   Automatically wraps text to the next line at wrap_width.
"   Hard wrap actually moves text to the next line once the line reaches 79 characters.
"   Soft wrap visually moves text to the next line once it reaches the end of
"   screen or window.
"   0: No wrap
"   1: Soft wrap
"     at edge of screen
"   2: Hard wrap
"     at wrap_width columns. Column at wrap_width is highlighted.
let g:wrap_enabled = 2
let g:wrap_width = 79
" Show invisibles
"   Render placeholders for invivisble characters, such as tabs, spaces and
"   newlines
let g:show_invisibles_enabled = 1
" Disable cursor blinking
"   0: Default
"       Cursor blinking is set to whatever is set on your machine.
"   1: Disabled
"       Cursor blinking is disabled and will always show.
let g:cursor_blinking_disabled = 1
" Cursor color
"   On some terminals, cursor color can be changed.
"   0: Default
"     Cursor color is unchanged.
"   1: Blue
"   2: Green
"   3: Red
let g:cursor_color = 1
