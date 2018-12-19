" ============================================================================
" File:       settings.vim
" Maintainer: https://github.com/EvanQuan/qvim/
" Version:    2.0.4
"
" Setting values affect how Vim is configured. This file is not tracked by
" git, allowing you to customize this differently for each machine. You can
" learn more about it with:
"
"     :help settings.vim
"
" Press ENTER to toggle category folding.
" ============================================================================

" True Color (24-bit) {{{
"   Many terminals don't support True color and will screw up the color
"   schemes if it is enabled. If there are problems with how Vim is displaying
"   color, consider disabling this.
"   0: Disabled
"     Color scheme will work but the colors may appear slightly different
"     from its intended appearance.
"   1: Enabled
"     Color scheme will appear as it should if your terminal supports 24-bit
"     color. Otherwise, the colors will not work properly.
" }}}
let g:truecolor_enabled = 1
" Powerline {{{
"   If powerline fonts are not installed on device, unicode characters for
"   lightline will not render correctly. Disable to have default lightline
"   separators and supseparators. This is automatically disabled on Windows
"   and gVim because Powerline fonts don't render correctly.
"   0: Disabled
"   1: Enabled
" }}}
let g:special_symbols_enabled = 0
" Color Scheme {{{
"   Affects overall color scheme and lightline color scheme
"   0: None
"   1: One Dark
"     Uses vim-one plugin.
"   2: One Light
"     Uses vim-one plugin.
"   3: One Dark Alternative
"     Uses onedark.vim plugin.
" }}}
let g:colorscheme_type = 3
" Highlight Cursor Line {{{
"   Highlight the line the cursor is currently on.
"   0: Disabled
"   1: Enabled
" }}}
let g:highlight_cursor_line = 1
" Highlight Cursor Column {{{
"   Highlight the column the cursor is currently on.
"   0: Disabled
"   1: Enabled
" }}}
let g:highlight_cursor_column = 0
" Highlight Width Indicator {{{
"   Highlight the column to indicate g:wrap_width
"   0: Disabled
"   1: Enabled
" }}}
let g:highlight_width_indicator = 1
" Line Numbers {{{
"   Set line numbers to be visible on the left margin.
"   0: Disabled
"   1: Absolute line numbers
"     Show the line numbers relative to the the start of the file.
"   2: Relative line numbers
"     Show the line numbers relative to the line with the cursor.
" }}}
let g:line_numbers = 2
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
"   The number of columns for hard wrapping and highlighted column.
" }}}
let g:wrap_width = 78
" Show Whitespace {{{
"   Render placeholders for invisible characters, such as tabs, spaces and
"   new lines. Whitespace can be toggled at any time with the <leader>tw
"   command.
"   0: Off
"     Whitespace is not visible by default.
"   1: On
"     Whitespace is visible by default.
"   2: Minimal
"     Whitespace is visible except for spaces and new line characters.
" }}}
let g:show_whitespace = 2
" Python 3 Execution {{{
"   In order for the executioner.vim plugin to work properly for Python 3, it
"   must know the right command to run in the terminal. Set it according to
"   how it works on your machine. .bashrc aliases do not count.
"   0: if `python` executes `python3` in the terminal
"   1: if `python3` executes `python3` in the terminal
" }}}
let g:python3_execution = 1
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
"   1: Enabled
"     Sets "aa" as ESCAPE in INSERT, REPLACE and VISUAL modes
"   2: Enabled
"     Sets "jk" and "kj" as ESCAPE in INSERT, REPLACE and VISUAL modes
" }}}
let g:escape_alternative_enabled = 0
