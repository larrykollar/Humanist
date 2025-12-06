# Book file format

The Humanist Publishing System
uses a very simple book file format
to define the order and hierarchy of topics
found in the book.

This is an example book file
that might be used to generate a book
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
	bookfile.md
	css_setup.md
	bestpractices.md
publishing.md
	PDFengines.md
gitignore.md
```

Use tabs to indent the sub-topics as needed.
Make sure your editor is using actual tabs for indentation
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
