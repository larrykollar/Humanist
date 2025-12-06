# Pandoc_scripts subdirectory

Requirements:

-  Pandoc (preferably something recent like 3.8)

The file paths assume the `XDG_DATA_HOME` environment variable
is not set, thus defaulting to `$HOME/.local/share/`.
If you have set `XDG_DATA_HOME` to a different value,
use it instead.

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

   This is, at the moment, only reliable for the coverpage content
   (specified in the YAML file in `include-before`).
   Until this is resolved, use the `yamlparse` script
   to create a sed script to process variables
   before feeding the output to Pandoc.
