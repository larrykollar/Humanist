# Building a book

The *stitch* utility reads a book file,
and outputs a monolithic Markdown file
with headings adjusted to match the book hierarchy.
It is an Awk script, so arguments are in Awk format.

Syntax:

```sh
stitch [-v debug=1] [-v bookmeta=metafile.yaml] bookname.book.txt > book.md
```

* Use `-v debug=1` to output the commands instead of executing them.
* Use `-v bookmeta=file.yaml` to prepend your book metadata.

You can process the output further,
piping it into other scripts, if needed.

When you're ready, create the PDF using the *humanist* command.

The *humanist* command is very basic, invoking Pandoc
and specifying the book template and Pandoc filter to use.
If you did not include the book metadata using *stitch*,
you must supply it on the command line:

`humanist ` *metafile*`.yaml` *book*`.md`

This produces an HTML file; use a CSS-based PDF formatter
to produce the PDF.
Producing HTML as an intermediate step
allows you to correct issues such as pagination
without reproducing the HTML.
If you want to produce the PDF directly:

`humanist -t html -o ` *book*`.pdf ` *book*`.md`

Pandoc uses [Weasyprint] by default.
To use a different formatter,
specify it with the `--pdf-engine=` option:

`humanist -t html --pdf-engine=`*name* `-o ` *book*`.pdf` *book*`.md`

See the [pdf-engine description] in Pandoc's documentation
for a list of supported formatters.
If your formatter is not listed,
you can output HTML and process it independently.
