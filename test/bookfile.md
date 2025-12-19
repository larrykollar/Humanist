# Book file format

The %vars.ProdName%
uses a very simple book file format
to define the order and hierarchy of topics
found in the book.

You can set up a book file in several different ways:

* Use a programming editor
  and set it to use "Indent as Tabs"
  (many editors provide this setting in the bottom toolbar).

* Use *vim* or a similiar editor
  that has "indent-left" and "indent-right" commands
  (`<<` and `>>` in Vim, respectively).

* Use any basic outliner,
  and output the structure as a text file.

* Use a spreadsheet app,
  putting chapters in column 1,
  sections in column 2, etc.,
  then output as a TSV (tab-separated variables) file.

This is a simple example book file
to generate a book
from this documentation:

```
# Humanist Publishing System documentation
intro.md
requirements.md
installation.md
booksetup.md
	bookformat.md
	bookmeta.md
	topic.md
  variables.md
	bookfile.md
	css_setup.md
	bestpractices.md
publishing.md
	PDFengines.md
gitignore.md
```

Lines beginning with `#` are ignored.
Use tabs to indent the sub-topics as needed.
Make sure your editor or exporter uses actual tabs for indentation
instead of spaces.

The `stitch` utility reads this book file
and outputs a monolithic Markdown file
with sub-topics modified to reflect their position
in the hierarchy.
You can optionally include the metadata
by specifying the `-v metadata=bookmeta.yaml` option.
This is important if you plan to pipe the output
through a customization script
before sending it to Pandoc for further processing.
