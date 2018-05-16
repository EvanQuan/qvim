"_____Settings_____
" True color (24-bit)
"   Many terminals don't support True color and will screw up some color
"   schemes if it is enabled.
"   If disabled, color schemes will work but the colors may appear slightly
"   different from what they should be.
let truecolor_enabled = 1
" Powerline
"   If powerline fonts are not installed on device, unicode characters for
"   lightline will not render correctly. Disable to have default lightline
"   separators and supseparators.
let special_symbols_enabled = 0
" Color scheme
"   Affects overall color scheme and lightline color scheme
"   0: Default
"   1: One Dark
"   2: Solarized
let colorscheme_type = 1
" Text wrap
"   Automatically wraps text to the next line at wrap_width.
"   Hard wrap actually moves text to the next line once the line reaches 79 characters.
"   Soft wrap visually moves text to the next line once it reaches the end of
"   screen or window.
"   0: No wrap
"   1: Soft wrap
"   2: Hard wrap with visual marker of 79 lines
let wrap_enabled = 1
" Show invisibles
"   Render placeholders for invivisble characters, such as tabs, spaces and
"   newlines
let show_invisibles_enabled = 1
" Disable cursor blinking
"   0: Default
"       Cursor blinking is set to whatever is set on your machine.
"   1: Disabled
"       Cursor blinking is disabled and will always show.
let cursor_blinking_disabled = 1
" Enable cursor color
"   0: Default
"     Cursor color is unchanged.
"   1: Enabled
"     On some terminals, cursor color can be changed.
let cursor_color_enabled = 1
