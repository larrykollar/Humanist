
# Name our utilities so we can change them later
HUMANIST = humanist
PDFENGINE = weasyprint
STITCH = stitch

# Name our components
TOPICS = advanced.md bestpractices.md bookbuild.md bookfile.md \
  bookformat.md bookmeta.md booksetup.md css_setup.md gitignore.md \
  installation.md intro.md PDFengines.md publishing.md requirements.md \
  test.keyfile.md topic.md variables.md
GRAPHICS = Graphics/oje_icon.png
BOOKMETA = test.bookmeta.yaml
BOOKFILE = test.book.txt
INTERMED = test.md
CSS = book6x9.css

test.pdf: test.html $(CSS)
	$(PDFENGINE) $< $@

test.html: $(INTERMED)
	$(HUMANIST) $< >$@

$(INTERMED): $(TOPICS) $(GRAPHICS) $(BOOKMETA) $(BOOKFILE)
	$(STITCH) -v metafile=$(BOOKMETA) $(BOOKFILE) >$@

clean::
	rm -f test.pdf test.html test.md

.SUFFIXES: .md .txt .html .pdf
