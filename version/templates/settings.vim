" ============================================================================
" File:       settings.vim
" Maintainer: https://github.com/EvanQuan/.vim/
" Version:    1.13.2
"
" Setting values affect how Vim is configured. This file is not tracked by
" git, allowing you to customize this differently for each machine.
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
let g:wrap_width = 79
" Show Whitespace {{{
"   Render placeholders for invisible characters, such as tabs, spaces and
"   end-of-lines. Whitespace can be toggled at any time with the <leader>tw
"   command.
"   0: Off
"     Whitespace is not visible by default.
"   1: On
"     Whitespace is visible by default.
"   2: Minimal
"     Whitespace is visible except for spaces and end-of-line characters.
" }}}
let g:show_whitespace = 2
" Disable Cursor Blinking {{{
"   Cursor blinking can be distracting as the cursor location can be
"   momentarily lost while moving and changing modes.
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
"   1: Enabled
"     Sets "aa" as ESCAPE in INSERT, REPLACE and VISUAL modes
" }}}
let g:escape_alternative_enabled = 0
" Minimalistic Mode {{{
"   Similar to `vim --clean` (Vim default settings, no plugins, no viminfo),
"   except special settings and keybindings still enabled.
"   0: Disabled
"     Everything runs as normal. All plugins and special settings and
"     keybindings are used.
"   1: Enabled
"     Do not load any plugins but still use special settings and  keybindings.
"   2: Vim Defaults
"     Use Vim defaults straight out of the box. Use nothing from this
"     repository.
" }}}
let g:minimalist_mode_enabled = 0
" Performance Mode {{{
"   Disables certain settings and plugins that may cause poor performance on
"   some machines. These usually involve plugins and settings that slow down
"   rendering when scrolling and moving the cursor.
"   0: Disabled
"     Vim has all settings and plugins enabled.
"   1: Enabled
"     quick-scope disabled
"     Relative line numbers disabled (has absolute line numbers)
"     colorcolumn disabled
" }}}
let g:performance_mode_enabled = 0
" Standard Keybindings {{{
"   Enables keybindings commonly found in many other systems. Some of these
"   keybindings overwrite Vim's default keybindings, which makes this
"   undesirable for those familiar with Vim's defaults.
"   0: Disabled
"     Vim works as normal.
"   1: Enabled
"     Loads $VIMRUNTIME/mswin.vim
" }}}
let g:standard_keybindings = 0
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
