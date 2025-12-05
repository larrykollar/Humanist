# Pandoc_scripts subdirectory

Requirements:

-  Pandoc (preferably something recent like 3.8)

`defaults.html`
:  Goes in ~/.local/share/pandoc/templates  
   This Pandoc template structures the book for PDF output,
   giving it a cover and TOC and suppressing the default CSS.
   Pandoc insists on delivering its table of contents
   as a bunch of nested unordered lists, so you have to account for that in CSS.
   Add `--template=defaults.html` to your Pandoc command line.

`vars.lua`
:  Goes in ~/.local/share/pandoc/filters  
   This is a Pandoc Lua filter.
   It processes strings that look like `%varname%`
   or `%vars.varname%` and replaces them with strings or elements
   as specified in the bookmeta YAML file (or the command line).
   Add `--lua-filter=vars.lua` to your Pandoc command line.
