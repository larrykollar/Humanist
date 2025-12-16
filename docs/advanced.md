# Advanced techniques

You may find some advanced techniques useful
when working with the Humanist Publishing System.

## Patching monolithic Markdown files {.section}

If you generate a large Markdown file,
then find you need to modify it,
put it under source control
then use `git diff` to create a patch.
Next time you generate the file,
use the patch to automatically apply any updates.

## Using a Makefile {.section}

If you are familiar with the POSIX *make* utility,
you can control building your document using a Makefile.
In this example, the book has three topics and a graphics file.

```make
# Name our utilities so we can change them later
HUMANIST = humanist
PDFENGINE = weasyprint
STITCH = stitch

# Name our components
TOPICS = topic1.md topic2.md topic3.md
GRAPHICS = Graphics/pic.png
BOOKMETA = mybook.meta.yaml
BOOKFILE = mybook.book.txt
INTERMED = mybook.md

mybook.pdf: mybook.html
    $(PDFENGINE) $< $@

mybook.html: $(INTERMED)
    humanist $< >$@

$(INTERMED): $(TOPICS) $(GRAPHICS) $(BOOKMETA) $(BOOKFILE)
    $(STITCH) -v bookmeta=$(BOOKMETA) $(BOOKFILE) >$@

clean::
    rm -f mybook.pdf mybook.html mybook.md

.SUFFIXES: .md .txt .html .pdf
```

For those unfamiliar with *make*,
think of it as working from the bottom up:

1. The intermediate file, `mybook.md`,
   is the complete file built by *stitch*.
   But *make* does not run *stitch* unless
   one of the dependencies (topics, graphics, metadata, or book file)
   are newer than the intermediate file.

2. If the intermediate file has been rebuilt,
   it is now newer than the HTML file
   (or the HTML file does not exist),
   and *make* runs *humanist* to regenerate the HTML.

3. Finally, if the HTML file is newer than the PDF
   (or the PDF does not exist),
   *make* runs the PDF engine (*weasyprint* in this example)
   to format a new PDF file.

Typing *make* automatically checks the dependencies
and starts the build process.
If nothing has changed, *make* outputs a message similar to
`mybook.pdf is up to date.`

Typing *make clean* cleans up the directory,
removing files that can be renewed by typing *make* again.
