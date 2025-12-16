# CSS file setup

CSS has long been the best way to format HTML pages,
and the CSS3 Paged Media specification
extends it to PDF and similar printed documents.

CSS3 adoption is widespread,
and many formatters (open-source and commercial)
are available to convert HTML files to PDF
using CSS3 to control formatting and layout.

If you (or your company) has a website,
you can use the CSS for the website as a template
for your documentation.
Ideally, you can use the same CSS
for everything, using the `@page`
and `@media print` at-rules
to contain print-specific rules and overrides.

A fairly simple CSS can define a book format.
If needed, study the `example6x9.css` file in the `test` directory.

## Table of Contents formatting {.section}

Pandoc insists on outputting a table of contents
as a series of nested, unordered lists.
In your book template,
wrap TOC processing in `<nav id="TOC">...</nav>`
(the example template does this).
You can then separate table of contents rules
from other list types by specifying `#TOC`.
For example:

```css
#TOC {
    /* general TOC formatting */
}
#TOC > ul {
    /* TOC1 */
    display:block;
    list-style-type: none;
    font-weight: bold;
}
#TOC > ul ul {
    /* TOC2 - you may need to reset TOC1-specific settings */
    font-weight: normal;
    margin-left: 1.5em;
}
```
