# Scripts subdirectory

These scripts work together, but go in different places.
Requirements:

-  POSIX shell and utilities (awk, sed)
-  Pandoc (preferably something recent like 3.8)
-  Weasyprint (to produce PDF) or a different engine

`stitch`
:  Goes in ~/bin  
   This Awk script uses a list of file names, tab-indented to specify nesting,
   to build a monolithic Markdown file from Markdown topics.
   Each topic file should start with a level-1 heading; `stitch` fixes nesting.
   Use the `-v metafile=book.yaml` option to include the book metadata
   at the beginning of the output.
   If you need custom processing, pipe the output into a `custom` script.

`custom`
:  Goes in the book directory  
   This is a shell script that performs any book-specific
   customizations.
   This includes assigning HTML classes to paragraphs with certain patterns,
   and processing variables.
   (The `vars.lua` file should handle these, but so far
   it's only reliable with the cover page variables.)

`humanist`
:  Goes in ~/bin  
   This shell script calls Pandoc with necessary options.
   You can add other options to the command line if needed.
   To produce HTML: `humanist bookmeta.yaml mono.md >book.html`
   To produce PDF: `humanist -t html -o book.pdf bookmeta.yaml mono.md`
   (requires `weasyprint` to be installed)

`yamlparse`
:  Goes in ~/bin  
   This Awk script reads the YAML book metadata,
   picking certain structures (default: `links,imgs,vars`)
   and building a `sed` script to process the variables.
   You can insert it into the `custom` script as a here document
   and pipe any other customizations into it.

Once everything is installed, you should be able to use a pipeline
like this to process your book:

    stitch -v metafile=bookmeta.yaml bookfile.txt | ./custom >book.md
    humanist book.md >book.html
    weasyprint book.html book.pdf

Or, if you're satisfied with the output as-is:

    stitch -v metafile=bookmeta.yaml bookfile.txt | custom >book.md
    humanist -t html -o book.pdf book.md

You can change the HTML -> PDF engine by adding
the `--pdf-engine=`*xxx* option to the `humanist` command line.
As of Pandoc 3.8, you can specify `weasyprint` (default),
`prince`,  `wkhtmltopdf`, or `pagedjs-cli`.
If you prefer another processor, such as `vivliostyle`,
output to HTML then invoke the engine to produce your PDF.
